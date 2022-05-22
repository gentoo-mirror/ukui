# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit autotools qmake-utils gnome2-utils

DESCRIPTION="ukui interface"
HOMEPAGE="https://github.com/ukui/ukui-interface"
SRC_URI="https://github.com/ukui/ukui-interface/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	dev-libs/iniparser:4
	dev-qt/qtcore
	virtual/libcrypt
	x11-libs/gsettings-qt
	"
RDEPEND="${DEPEND}"
BDEPEND=""

src_prepare() {
	default
	eautoreconf
	#iniparser: lose version
	sed -i "s,iniparser/iniparser,iniparser4/iniparser,g" "${S}/src/common/kylin-com4c.c" || die
	sed -i "s,iniparser/iniparser,iniparser4/iniparser,g" "${S}/src/common/kylin-com4cxx.cpp" || die
	sed -i "s,liniparser,liniparser4,g" "${S}/src/common/Makefile.am" || die
	# lib location
	sed -i 's,usr/lib,usr/lib64,g' "${S}/src/log4qt/ukui-log4qt.pro" || die
}

src_configure() {
	econf
	cd src/log4qt || die
	eqmake5 "$@"
}

src_compile() {
	emake "$@"
	cd src/log4qt || die
	emake
}

src_install() {
	emake DESTDIR="${D}" install
	cd src/log4qt || die
	emake INSTALL_ROOT="${D}" install
	mkdir "${D}/usr/include/ukuisdk" || die
	mv "${D}"/usr/include/kylin* "${D}/usr/include/ukuisdk" || die
}

pkg_postinst() {
	gnome2_schemas_update
}

pkg_postrm() {
	gnome2_schemas_update
}
