# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="The window manager for UKUI desktop environment."
HOMEPAGE="https://github.com/ukui/ukui-kwin"
SRC_URI="https://github.com/ukui/ukui-kwin/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE="multimedia"

# Do not specify KF5 and Qt version, add patches

COMMON_DEPEND="
	dev-qt/qtcore
	dev-qt/qtconcurrent
	dev-qt/qtdeclarative
	dev-qt/designer
	dev-qt/qtdbus
	dev-qt/qtscript
	dev-qt/qtsensors
	dev-qt/qtx11extras
	kde-frameworks/kcmutils
	kde-frameworks/kconfig
	kde-frameworks/kconfigwidgets
	kde-frameworks/kcrash
	kde-frameworks/kdeclarative
	kde-frameworks/kglobalaccel
	kde-frameworks/ki18n
	kde-frameworks/kidletime
	kde-frameworks/knewstuff
	kde-frameworks/kwayland
	kde-frameworks/kwidgetsaddons
	kde-frameworks/plasma
	kde-plasma/kdecoration
	kde-plasma/kscreenlocker
	kde-plasma/kwin
	x11-libs/gsettings-qt
	"

RDEPEND="${COMMON_DEPEND}
	multimedia? ( dev-qt/qtmultimedia )
	"

DEPEND="${COMMON_DEPEND}
	"

PATCHES=(
	"${FILESDIR}/requestShowWindowMenu_deprecated.patch"
	"${FILESDIR}/plugins_kdecorations_ukui_test.patch"
	"${FILESDIR}/5.23.patch"
	"${FILESDIR}/5.24.patch"

)

src_configure() {
	local mycmakeargs=(
		"-Wno-dev"
	)
	cmake_src_configure "$@"
}

src_install() {
	cmake_src_install "$@"
	#conflict with kwin
	rm "${D}/usr/share/locale/tr/LC_MESSAGES/kwin.mo" || die
}
