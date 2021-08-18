# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit gnome2-utils xdg

DESCRIPTION="UKUI session daemon that acts as a policy agent on top of UPower"
HOMEPAGE="https://github.com/ukui/ukui-power-manager"
SRC_URI="https://github.com/ukui/ukui-power-manager/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
		app-text/xmlto
		app-text/yelp-tools
		dev-libs/libgcrypt
		dev-libs/glib
		dev-perl/libxml-perl
		dev-qt/qtcharts
		dev-qt/qtcore
		dev-qt/qtx11extras
		dev-util/intltool
		kde-frameworks/kwindowsystem
		gnome-base/libgnome-keyring
		mate-base/mate-common
		media-libs/libcanberra[gtk3]
		sys-devel/libtool
		sys-power/upower
		x11-libs/libnotify
		x11-libs/libwnck:3
		x11-libs/libX11
		x11-libs/libXext
		x11-libs/libXrandr
		x11-libs/gtk+:3
		x11-libs/gsettings-qt
		"
RDEPEND="
		sys-auth/polkit
		sys-apps/dbus[X]
		|| ( x11-misc/ukui-notification-daemon x11-misc/notification-daemon x11-misc/mate-notification-daemon )
		|| ( sys-apps/systemd sys-auth/elogind )"
BDEPEND=""

src_prepare() {
	eapply_user
	NOCONFIGURE=1 ./autogen.sh || die
	econf --prefix=/usr --libexecdir=/usr/lib/${PN} --sbindir=/usr/bin --sysconfdir=/etc
	xdg_src_prepare
}

src_compile() {
	emake "$@"
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
