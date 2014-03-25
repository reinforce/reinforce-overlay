# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit git-2

EGIT_REPO_URI="https://github.com/linux-sunxi/u-boot-sunxi.git"
EGIT_BRANCH="sunxi"

DESCRIPTION="u-boot for Allwinner sunxi series of SoCs (A10, A13, A10s, and A20)"
HOMEPAGE="https://github.com/linux-sunxi/u-boot-sunxi"

SLOT="0"
KEYWORDS="~arm"

# List of sunxi boards. See boards.cfg
SUNXI_BOARDS="
	A10_MID_1GB
	A10-OLinuXino-Lime
	A10s-OLinuXino-M
	A10s-OLinuXino-M_FEL
	A13-OLinuXino
	A13-OLinuXino_FEL
	A13-OLinuXino_FEL_sdcon
	A13-OLinuXinoM
	A13-OLinuXinoM_FEL
	A13_MID
	A20-OLinuXino_MICRO
	A20-OLinuXino_MICRO_FEL
	Auxtek-T003
	Auxtek-T004
	ba10_tv_box
	Coby_MID7042
	Coby_MID8042
	Coby_MID9742
	Iteaduino_Plus_A10
	Iteaduino_Plus_A20
	Cubieboard
	Cubieboard2
	Cubieboard2_FEL
	Cubietruck
	Cubietruck_FEL
	Cubieboard_512
	Cubieboard_FEL
	DNS_M82
	EOMA68_A10
	EOMA68_A10_FEL
	EOMA68_A20
	EOMA68_A20_FEL
	EU3000
	Gooseberry_A721
	H6
	Hackberry
	HCore_HC860
	Hyundai_A7HD
	Interra-3
	INet_86VZ
	INet_86VZ_FEL
	INet97F-II
	INet_K70HC
	Jesurun-Q5
	K1001L1C
	Marsboard_A10
	Marsboard_A20
	Marsboard_A20_debug
	Megafeis_A08
	Mele_A1000
	Mele_A1000_FEL
	Mele_A1000G
	Mele_A3700
	Mini-X
	Mini-X-1Gb
	Mini-X_A10s
	mk802
	mk802-1gb
	mk802_a10s
	mk802ii_A20
	mk802ii
	pcDuino
	pengpod1000
	pengpod700
	PoV_ProTab2_IPS9
	PoV_ProTab2_IPS_3g
	PoV_ProTab2_XXL
	r7-tv-dongle
	Sanei_N90
	sun4i
	sun4i_sdcon
	sun5i
	sun5i_sdcon
	sun5i_uart1
	uhost_u1a
	Wexler_TAB_7200
	wobo-i5
	xzpad700
	zatab
"

for board in ${SUNXI_BOARDS}; do
	IUSE_SUNXI_BOARDS+=" sunxi_boards_${board}"
done

IUSE="${IUSE_SUNXI_BOARDS}"
REQUIRED_USE="^^ ( ${IUSE_SUNXI_BOARDS} )"

src_configure() {
	# u-boot doesn't handle LDFLAGS properly
        unset LDFLAGS

        for board in ${SUNXI_BOARDS}; do
                use "sunxi_boards_${board}" && make "${board}"_config
        done
}

src_install() {
	insinto "/usr/share/${PF}" && doins u-boot.img

	# Some boards doesn't have SPL loader, so check it before installing
	if [[ -f spl/sunxi-spl.bin ]] ; then
		insinto "/usr/share/${PF}" && doins u-boot-sunxi-with-spl.bin
		insinto "/usr/share/${PF}/spl" && doins spl/sunxi-spl.bin
	fi

	dodoc doc/README.*

	ewarn "This build allows booting from SD, over USB and over ethernet,"
	ewarn "but it still lacks support for booting off the NAND."

	elog
	elog "The u-boot has been installed into /usr/share/${PF}"
	elog
	elog "A10 & A13 boots the SPL loader from block 8. This then loads"
	elog "actual u-boot from block 40 onwards, counted in 1KB blocks."
	elog "Replace /dev/sdX with the device name of your media"
	elog
	elog "  dd if=u-boot-sunxi-with-spl.bin of=/dev/sdX bs=1024 seek=8"
	elog
	elog "or if you prefer to install the components separately"
	elog
	elog "  dd if=spl/sunxi-spl.bin of=/dev/sdX bs=1024 seek=8"
	elog "  dd if=u-boot.img of=/dev/sdX bs=1024 seek=40"
	elog
	elog "Note that some boards doesn't have SPL loader."
	elog
}
