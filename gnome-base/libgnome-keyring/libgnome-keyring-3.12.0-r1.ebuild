# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit gnome.org vala

DESCRIPTION="gnome-keyring is a program that keep password and other secrets for users.(deprecated)"
HOMEPAGE="https://gitlab.gnome.org/GNOME/libgnome-keyring"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
		dev-libs/glib
		dev-libs/libgcrypt
		sys-apps/dbus
		gnome-base/gnome-keyring
		dev-libs/gobject-introspection
		dev-util/gtk-doc-am
		dev-util/intltool
		sys-devel/gettext
		virtual/pkgconfig
		"
RDEPEND="${DEPEND}"
BDEPEND=""

src_prepare() {
	eapply_user
	NOCONFIGURE=1 ./autogen.sh
}

src_configure() {
	econf \
		--prefix=/usr \
		--sysconfdir=/etc \
		--localstatedir=/var \
		--disable-static \
		--libexecdir=/usr/lib
}

src_compile() {
	emake
}

src_install() {
	emake DESTDIR="${D}" install
}
