# OrangeFox Recovery for Samsung Galaxy A7 2018 (`SM-A750F` / `a7y18lte`)

<p align="center">
  <img src="https://gitlab.com/OrangeFox/misc/theme/-/raw/master/portrait_hdpi/images/main/fox.png" width="160" alt="OrangeFox Logo"/>
</p>

An unofficial build of **OrangeFox Recovery Project** for the **Samsung Galaxy A7 2018 (SM-A750FN / SM-A750F / SM-A750G)**.

---

## 📱 Device Specifications

| Feature | Specification |
| :--- | :--- |
| **Device Model** | Samsung Galaxy A7 2018 (`SM-A750F` / `SM-A750FN` / `SM-A750G`) |
| **Codename** | `a7y18lte` |
| **SoC** | Samsung Exynos 7885 Octa (2x Cortex-A73 @ 2.2GHz + 6x Cortex-A53 @ 1.6GHz) |
| **GPU** | Mali-G71 MP2 |
| **Kernel** | Linux 4.4.x (arm64) |
| **Display** | 1080 x 2220 pixels, 18.5:9 ratio Super AMOLED |
| **Base Android** | Android 9.0 Pie (Omni 9.0 Base) |
| **Maintainer** | **[eyge102](https://github.com/eyge102)** |

---

## ✨ Features & Highlights

- **Custom OrangeFox UI:** Beautiful, smooth touch UI with full theme engine and customizable accent colors.
- **Root ADB Out-of-the-Box:** Includes custom kernel patch bypassing Samsung's `SEC_RESTRICT_FORK` security restriction which forces `adbd` into unprivileged `uid=2000` (shell). Full root shell in recovery.
- **Storage & Partitions:**
  - Full support for Internal Storage, MicroSD, and USB-OTG drives.
  - Native ext4 and f2fs file system support.
  - Complete partition backup & restore: `System`, `Vendor`, `Boot`, `Recovery`, `EFS`, `Data`, `Cache`.
- **Flash Engines:**
  - Built-in Magiskboot v24+ for seamless Magisk patching and root persistence.
  - AromaFM replaced with native OrangeFox touch file manager.
  - Built-in terminal, nano editor, bash shell, tar, sed, and xz utilities.
- **Calibrated for A7 2018:**
  - Exact 2220x1080 display geometry and notch/status bar spacing.
  - Hardware button shortcuts and proper power/reboot control.

---

## 📥 Installation

### Method 1: From Existing TWRP / Recovery (Recommended)
1. Download the latest `recovery.img` or `OrangeFox-*.zip` from the [Releases](https://github.com/eyge102/a750f-orangefox/releases) tab or [Actions](https://github.com/eyge102/a750f-orangefox/actions).
2. Boot into your current recovery.
3. If using `OrangeFox-*.zip`:
   - Select **Install**, choose the zip, and swipe to flash.
4. If using `recovery.img`:
   - Select **Install** -> **Install Image**, select `recovery.img`, choose partition **Recovery**, and swipe to flash.
5. Reboot to Recovery:
   - Select **Reboot** -> **Recovery**.

### Method 2: Via Samsung Odin (PC)
1. Download `OrangeFox-a7y18lte-Odin.tar` from [Releases](https://github.com/eyge102/a750f-orangefox/releases).
2. Boot your Galaxy A7 2018 into **Download Mode** (Turn off device, hold **Volume Up + Volume Down** and plug in USB connected to PC).
3. Open **Odin3 v3.14+** on PC.
4. Put `OrangeFox-a7y18lte-Odin.tar` into the **AP** slot.
5. In Options, uncheck **Auto Reboot**.
6. Click **Start**.
7. Once finished (**PASS!**), disconnect cable and hold **Volume Down + Power** for 7 seconds to force reboot; as soon as the screen goes black, immediately switch to holding **Volume Up + Power** (while keeping USB plugged in) to boot directly into OrangeFox!

### Method 3: Via Root Terminal / ADB in Recovery
```bash
adb push recovery.img /tmp/recovery.img
adb shell "dd if=/tmp/recovery.img of=/dev/block/by-name/RECOVERY bs=4096 && sync"
```

---

## 🛠️ Building From Source

This project compiles automatically using **GitHub Actions CI**. 

To trigger a build:
1. Fork this repository.
2. Go to the **Actions** tab.
3. Select **Build OrangeFox Recovery for Galaxy A7 2018 (a7y18lte)**.
4. Click **Run workflow**.

Artifacts will be available under the workflow run summary upon completion.

---

## 📜 Credits & Acknowledgements

- **[OrangeFox Recovery Project](https://gitlab.com/OrangeFox)** - For the amazing recovery project and sources.
- **[TeamWin (TWRP)](https://github.com/TeamWin)** - For TWRP recovery base and minimal manifest.
- **[Samsung Electronics](https://opensource.samsung.com/)** - For the Exynos 7885 kernel source code.
- **[AKSharma87](https://github.com/AKSharma87)** - For initial A7 2018 recovery tree base.
- **[SebaUbuntu](https://github.com/SebaUbuntu)** - For TWRP device tree generator.
- **[eyge102](https://github.com/eyge102)** - Maintainer, CI Builder, and kernel adb patcher.

---

## ⚖️ License
Licensed under the GNU General Public License v3 (GPLv3).
