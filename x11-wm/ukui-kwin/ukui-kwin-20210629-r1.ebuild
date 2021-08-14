# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake

MY_COMMIT="17cc806fadde24275980043c8062965282d8ed39"
DESCRIPTION="The window manager for UKUI desktop environment."
HOMEPAGE="https://github.com/ukui/ukui-kwin"
SRC_URI="https://github.com/ukui/ukui-kwin/archive/${MY_COMMIT}.tar.gz -> ${P}.tar.gz"
S="${WORKDIR}/${PN}-${MY_COMMIT}"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"

IUSE="test"

KFMIN=5.66.0
QTV5=5.18.3
QTMIN=5.9.0

COMMON_DEPEND="
	>=dev-libs/libinput-1.9
	>=dev-libs/wayland-1.2
	>=dev-qt/qtdbus-${QTMIN}:5
	>=dev-qt/qtdeclarative-${QTMIN}:5
	>=dev-qt/qtgui-${QTMIN}:5
	>=dev-qt/qtscript-${QTMIN}:5
	>=dev-qt/qtsensors-${QTMIN}:5
	>=dev-qt/qtwidgets-${QTMIN}:5
	>=dev-qt/qtx11extras-${QTMIN}:5
	>=kde-frameworks/kactivities-${KFMIN}:5
	>=kde-frameworks/kauth-${KFMIN}:5
	>=kde-frameworks/kcmutils-${KFMIN}:5
	>=kde-frameworks/kcompletion-${KFMIN}:5
	>=kde-frameworks/kconfig-${KFMIN}:5
	>=kde-frameworks/kconfigwidgets-${KFMIN}:5
	>=kde-frameworks/kcoreaddons-${KFMIN}:5
	>=kde-frameworks/kcrash-${KFMIN}:5
	>=kde-frameworks/kdeclarative-${KFMIN}:5
	>=kde-frameworks/kdoctools-${KFMIN}:5
	>=kde-frameworks/kglobalaccel-${KFMIN}:5=
	>=kde-frameworks/kguiaddons-${KFMIN}:5
	>=kde-frameworks/ki18n-${KFMIN}:5
	>=kde-frameworks/kiconthemes-${KFMIN}:5
	>=kde-frameworks/kidletime-${KFMIN}:5=
	>=kde-frameworks/kinit-${KFMIN}:5=
	>=kde-frameworks/kio-${KFMIN}:5
	>=kde-frameworks/knewstuff-${KFMIN}:5
	>=kde-frameworks/knotifications-${KFMIN}:5
	>=kde-frameworks/kpackage-${KFMIN}:5
	>=kde-frameworks/kservice-${KFMIN}:5
	>=kde-frameworks/ktextwidgets-${KFMIN}:5
	>=kde-frameworks/kwayland-${KFMIN}:5
	>=kde-frameworks/kwidgetsaddons-${KFMIN}:5
	>=kde-frameworks/kwindowsystem-${KFMIN}:5[X]
	>=kde-frameworks/kxmlgui-${KFMIN}:5
	>=kde-frameworks/plasma-${KFMIN}:5
	>=kde-plasma/breeze-${QTV5}:5
	>=kde-plasma/kdecoration-${QTV5}:5
	>=kde-plasma/kscreenlocker-${QTV5}:5
	>=kde-plasma/kwayland-server-${QTV5}:5
	>=kde-plasma/kwin-${QTV5}:5
	media-libs/fontconfig
	media-libs/freetype
	media-libs/lcms:2
	media-libs/libepoxy
	media-libs/mesa[egl,gbm,wayland,X(+)]
	sys-libs/libcap
	virtual/libudev:=
	x11-libs/gsettings-qt
	x11-libs/libdrm
	x11-libs/libICE
	x11-libs/libSM
	x11-libs/libX11
	x11-libs/libXi
	>=x11-libs/libxcb-1.10
	>=x11-libs/libxkbcommon-0.7.0
	x11-libs/xcb-util-cursor
	x11-libs/xcb-util-image
	x11-libs/xcb-util-keysyms
	x11-libs/xcb-util-wm
"
# TODO: sys-apps/hwdata? not packaged yet; commit 33a1777a, Gentoo-bug 717216
RDEPEND="${COMMON_DEPEND}
	>=dev-qt/qtquickcontrols-${QTMIN}:5
	>=dev-qt/qtquickcontrols2-${QTMIN}:5
	>=dev-qt/qtvirtualkeyboard-${QTMIN}:5
	>=kde-frameworks/kirigami-${KFMIN}:5
	>=kde-frameworks/kitemmodels-${KFMIN}:5[qml]
	>=dev-qt/qtmultimedia-${QTMIN}:5[gstreamer,qml]
"
DEPEND="${COMMON_DEPEND}
	>=dev-qt/designer-${QTMIN}:5
	>=dev-qt/qtconcurrent-${QTMIN}:5
	x11-base/xorg-proto
	test? (
		>=dev-libs/wayland-protocols-1.19
		>=dev-qt/qtwayland-${QTMIN}:5
	)
"

PDEPEND="
	>=kde-plasma/kde-cli-tools-${QTV5}:5
"

PATCHES=(
	"${FILESDIR}/requestShowWindowMenu_deprecated.patch"
	"${FILESDIR}/plugins_kdecorations_ukui_test.patch"
)

src_install() {
	cmake_src_install "$@"
	rm "${D}/usr/share/locale/tr/LC_MESSAGES/kwin.mo"
}
