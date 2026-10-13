platform_check_image() {
	local board=$(board_name)

	case "$board" in
	tplink,archer-c5v|\
	tplink,ex20v)
		# UBI sysupgrade image (sysupgrade-tar); validation is handled by
		# the firmware metadata check and nand_do_upgrade.
		return 0
		;;
	chinamobile,gs3101)
		return 0
		;;
	esac

	return 1
}

platform_do_upgrade() {
	local board=$(board_name)

	case "$board" in
	tplink,archer-c5v|\
	tplink,ex20v)
		# UBI layout: raw kernel slot + UBI rootfs. nand_do_upgrade writes
		# the kernel (CI_KERNPART, with the free-bootbase 55aa tag so the
		# vendor bootloader can still decompress it) and updates the UBI
		# volumes. On the EX20v the "kernel" mtd is the slave slot 0x2980000,
		# which is exactly where boot flag=1 makes the bootbase read the tag.
		CI_KERNPART="kernel"
		nand_do_upgrade "$1"
		;;
	chinamobile,gs3101)
		CI_KERNPART="tclinux_kernel"
		nand_do_upgrade "$1"
		;;
	esac
}
