# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit gnome2-utils xdg cmake

DESCRIPTION="Screensaver for UKUI desktop environment"
HOMEPAGE="https://github.com/ukui/ukui-screensaver"
SRC_URI="https://github.com/ukui/ukui-screensaver/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

CDEPEND="
	dev-qt/qtdbus
	dev-qt/qtsvg
	dev-qt/qtxml
	dev-qt/qtx11extras
	dev-qt/qtwidgets
	media-libs/opencv
	x11-libs/gsettings-qt
	"
DEPEND="dev-qt/linguist-tools
	${CDEPEND}"
RDEPEND="${CDEPEND}"

src_prepare() {
	#According to https://github.com/ukui/ukui-screensaver/issues/65, but depending on distro
	cp /etc/pam.d/login "${S}/data/ukui-screensaver-qt" || die
	cmake_src_prepare
}

src_configure() {
	cmake \
		-S "${CMAKE_USE_DIR}" \
		-B "${BUILD_DIR}" \
		-DCMAKE_BUILD_TYPE="Release" \
		-DCMAKE_INSTALL_PREFIX=/usr
	S="${BUILD_DIR}"
}

src_compile() {
	emake
}

src_install() {
	emake DESTDIR="${D}" install
}

pkg_postinst() {
	xdg_pkg_postinst
	gnome2_schemas_update
}

pkg_postrm() {
	xdg_pkg_postrm
	gnome2_schemas_update
}
