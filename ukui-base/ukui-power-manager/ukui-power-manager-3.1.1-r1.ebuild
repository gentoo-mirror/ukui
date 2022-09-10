# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit gnome2-utils xdg qmake-utils

DESCRIPTION="UKUI session daemon that acts as a policy agent on top of UPower"
HOMEPAGE="https://github.com/ukui/ukui-power-manager"
SRC_URI="https://github.com/ukui/ukui-power-manager/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	app-text/xmlto
	app-text/yelp-tools
	dev-qt/qtx11extras
	dev-util/intltool
	kde-frameworks/kwindowsystem
	mate-base/mate-common
	media-libs/libcanberra[gtk3]
	sys-power/upower
	ukui-base/ukui-interface
	x11-libs/libnotify
	x11-libs/libXrandr
	x11-libs/gtk+:3
	x11-libs/gsettings-qt
	"
RDEPEND="
	sys-auth/polkit
	sys-apps/dbus[X]
	|| ( x11-misc/ukui-notification-daemon x11-misc/notification-daemon x11-misc/mate-notification-daemon )
	|| ( sys-apps/systemd sys-auth/elogind )
	"

src_prepare() {
	eapply_user
	default
	# QA issue
	sed -i 's/OnlyShowIn=UKUI/OnlyShowIn=X-UKUI/g' "${S}/data/ukui-power-preferences.desktop.in.in" || die
}

src_configure() {
	eqmake5
}

src_install() {
	emake INSTALL_ROOT="${D}" install
}

pkg_postinst() {
	xdg_pkg_postinst
	gnome2_schemas_update
}

pkg_postrm() {
	xdg_pkg_postrm
	gnome2_schemas_update
}
