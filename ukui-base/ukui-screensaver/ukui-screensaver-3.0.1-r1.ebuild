# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake

DESCRIPTION="Screensaver for UKUI desktop environment"
HOMEPAGE="https://github.com/ukui/ukui-screensaver"
SRC_URI="https://github.com/ukui/ukui-screensaver/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
		dev-qt/qtx11extras
		gnome-base/dconf
		x11-libs/gsettings-qt
		x11-libs/libXtst"
RDEPEND="${DEPEND}"
BDEPEND=""

CMAKE_IN_SOURCE_BUILD="yes"

src_prepare() {
	default
	mkdir build
	BUILD_DIR="${S}/build"
	cmake_src_prepare
}

src_configure() {
	cd build
	pwd
	cmake ../ -DCMAKE_INSTALL_PREFIX=/usr
	S="${S}/build"
}

src_compile() {
	emake
}

src_install() {
	emake DESTDIR="${D}" install
}
