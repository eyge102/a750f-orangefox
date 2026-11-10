#!/sbin/sh
echo 0 > /sys/fs/selinux/enforce
setenforce 0
