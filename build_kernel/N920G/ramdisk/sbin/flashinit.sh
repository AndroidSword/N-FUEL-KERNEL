#!/system/bin/sh
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Busybox
if [ -e /su/xbin/busybox ]; then
	BB=/su/xbin/busybox;
else if [ -e /sbin/busybox ]; then
	BB=/sbin/busybox;
else
	BB=/system/xbin/busybox;
fi;
fi;

# Mount
$BB mount -t rootfs -o remount,rw rootfs;
$BB mount -o remount,rw /system;
$BB mount -o remount,rw /data;
$BB mount -o remount,rw /;

# Don't treat storage as rotational
	echo "0" > /sys/block/mmcblk0/queue/rotational
	echo "0" > /sys/block/loop0/queue/rotational
	echo "0" > /sys/block/loop1/queue/rotational
	echo "0" > /sys/block/loop2/queue/rotational
	echo "0" > /sys/block/loop3/queue/rotational
	echo "0" > /sys/block/loop4/queue/rotational
	echo "0" > /sys/block/loop5/queue/rotational
	echo "0" > /sys/block/loop6/queue/rotational
	echo "0" > /sys/block/loop7/queue/rotational
	echo "0" > /sys/block/ram0/queue/rotational
	echo "0" > /sys/block/ram1/queue/rotational
	echo "0" > /sys/block/ram2/queue/rotational
	echo "0" > /sys/block/ram3/queue/rotational
	echo "0" > /sys/block/ram4/queue/rotational
	echo "0" > /sys/block/ram5/queue/rotational
	echo "0" > /sys/block/ram6/queue/rotational
	echo "0" > /sys/block/ram7/queue/rotational
	echo "0" > /sys/block/ram8/queue/rotational
	echo "0" > /sys/block/ram9/queue/rotational
	echo "0" > /sys/block/ram10/queue/rotational
	echo "0" > /sys/block/ram11/queue/rotational
	echo "0" > /sys/block/ram12/queue/rotational
	echo "0" > /sys/block/ram13/queue/rotational
	echo "0" > /sys/block/ram14/queue/rotational
	echo "0" > /sys/block/ram15/queue/rotational

# Fix SafetyNet by Repulsa
$BB chmod 640 /sys/fs/selinux/enforce

# Unmount
$BB mount -t rootfs -o remount,rw rootfs;
$BB mount -o remount,ro /system;
$BB mount -o remount,rw /data;
$BB mount -o remount,ro /;
