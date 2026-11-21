#!/bin/bash
set -u

FOX_RAMDISK="${1:-}"
STAGE="${2:-}"

if [ -z "$FOX_RAMDISK" ] || [ ! -d "$FOX_RAMDISK" ] || [ "$STAGE" != "--first-call" ]; then
    exit 0
fi

echo "-- [a7y18lte] Running fox_local_callback.sh on $FOX_RAMDISK ($STAGE)"

# Remove any leftover CJK / extra fallback fonts and 32-bit runtime artifacts
rm -f \
    "$FOX_RAMDISK/twres/fonts/wqy-microhei.ttf" \
    "$FOX_RAMDISK/twres/fonts/wqy-microhei_README.txt" \
    "$FOX_RAMDISK/twres/fonts/DroidSansFallback.ttf" \
    "$FOX_RAMDISK/twres/fonts/NotoSansCJKjp-Regular.ttf" \
    "$FOX_RAMDISK/sbin/linker" \
    "$FOX_RAMDISK/system/bin/linker"
rm -rf "$FOX_RAMDISK/system/lib" "$FOX_RAMDISK/vendor/lib"

# Locate strip tool for ARM64 ELF binaries and shared libraries
STRIP_TOOL=""
for cand in \
    /home/runner/fox/prebuilts/clang/host/linux-x86/clang-*/bin/llvm-strip \
    "$(command -v llvm-strip 2>/dev/null || true)" \
    "$(command -v aarch64-linux-gnu-strip 2>/dev/null || true)"
do
    if [ -n "$cand" ] && [ -x "$cand" ]; then
        STRIP_TOOL="$cand"
        break
    fi
done

if [ -n "$STRIP_TOOL" ]; then
    echo "-- [a7y18lte] Stripping ARM64 ELF files with: $STRIP_TOOL"
    for dir in "$FOX_RAMDISK/sbin" "$FOX_RAMDISK/system/bin" "$FOX_RAMDISK/system/lib64"; do
        [ -d "$dir" ] || continue
        while IFS= read -r -d '' f; do
            if file "$f" | grep -q "ELF 64-bit.*aarch64"; then
                "$STRIP_TOOL" --strip-unneeded "$f" 2>/dev/null || true
            fi
        done < <(find "$dir" -maxdepth 2 -type f -print0)
    done
else
    echo "-- [a7y18lte] WARNING: No ARM64 strip tool found; skipping ELF strip."
fi

# Measure exact LZMA-compressed ramdisk size matching core/Makefile
LZMA_TOOL="/home/runner/fox/prebuilts/tools-lineage/linux-x86/bin/lzma"
if [ ! -x "$LZMA_TOOL" ]; then
    LZMA_TOOL="$(command -v lzma 2>/dev/null || true)"
fi

measure_lzma_ramdisk() {
    if [ -n "$LZMA_TOOL" ]; then
        (cd "$FOX_RAMDISK" && find . | cpio -o -H newc 2>/dev/null | "$LZMA_TOOL" -f -c | wc -c)
    else
        (cd "$FOX_RAMDISK" && find . | cpio -o -H newc 2>/dev/null | xz --format=lzma -c | wc -c)
    fi
}

RAMDISK_BYTES="$(measure_lzma_ramdisk)"
echo "-- [a7y18lte] Compressed ramdisk size after initial cleanup/strip: $RAMDISK_BYTES bytes (safe budget <= 14800000 bytes; hard cap 15341568 bytes)"

# If still above safe threshold (leaving margin for kernel+dt+header <= 39845888),
# trim optional decorative fonts (substituting Roboto in XML) and offline charger.
if [ "${RAMDISK_BYTES:-0}" -gt 14800000 ]; then
    echo "-- [a7y18lte] Ramdisk exceeds 14,800,000 bytes; trimming optional fonts and offline charger..."
    TWRES_DIR="$FOX_RAMDISK/twres"
    for xml in \
        "$TWRES_DIR/themes/font.xml" \
        "$TWRES_DIR/resources/images.xml" \
        "$TWRES_DIR/splash.xml" \
        "$TWRES_DIR/themes/sed/splash.xml" \
        "$TWRES_DIR/themes/sed/splash_orig.xml"
    do
        [ -f "$xml" ] || continue
        sed -i -e 's/Chococooky/Roboto/g' \
               -e 's/Exo2/Roboto/g' \
               -e 's/EuclidFlex/Roboto/g' "$xml"
    done

    for font in Chococooky.ttf Exo2-Medium.ttf Exo2-Regular.ttf EuclidFlex-Medium.ttf EuclidFlex-Regular.ttf; do
        rm -f "$TWRES_DIR/fonts/$font"
        [ -f "$TWRES_DIR/resources/images.xml" ] && sed -i "/$font/d" "$TWRES_DIR/resources/images.xml"
    done

    rm -f "$FOX_RAMDISK/sbin/charger" "$FOX_RAMDISK/system/bin/charger"

    RAMDISK_BYTES="$(measure_lzma_ramdisk)"
    echo "-- [a7y18lte] Compressed ramdisk size after extra trim: $RAMDISK_BYTES bytes"
fi
