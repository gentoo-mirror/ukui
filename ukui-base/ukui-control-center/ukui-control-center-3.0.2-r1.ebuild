# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit qmake-utils

DESCRIPTION="media tools for UKUI"
HOMEPAGE="https://github.com/ukui/ukui-control-center"
SRC_URI="https://github.com/ukui/ukui-control-center/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
		dev-libs/boost
		dev-libs/glib
		dev-libs/libxml2
		dev-qt/qtsvg
		dev-qt/qtx11extras
		dev-qt/qtmultimedia
		gnome-base/dconf
		kde-frameworks/bluez-qt
		kde-frameworks/kconfig
		kde-frameworks/kconfigwidgets
		kde-frameworks/kcoreaddons
		kde-frameworks/kdeclarative
		kde-frameworks/kguiaddons
		kde-frameworks/ki18n
		kde-frameworks/kwindowsystem
		kde-plasma/libkscreen
		mate-base/libmatekbd
		mate-base/mate-desktop
		media-libs/libcanberra
		media-libs/libmatemixer
		media-sound/pulseaudio
		virtual/libcrypt
		x11-libs/libxcb
		x11-libs/libxklavier
		x11-libs/libxkbfile
		x11-libs/libX11
		sys-auth/polkit-qt"
RDEPEND="${DEPEND}"
BDEPEND=""

PATCHES=(
	${FILESDIR}/cLinkage.patch
)

src_prepare() {
	eqmake5 PREFIX=/usr
	default
}

src_install() {
	emake INSTALL_ROOT="${D}" install
}

