# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit gnome.org

DESCRIPTION="keep password and other secrets for users.(deprecated)"
HOMEPAGE="https://gitlab.gnome.org/GNOME/libgnome-keyring"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"

IUSE="debug +introspection"

DEPEND="
		dev-libs/glib
		dev-libs/libgcrypt
		dev-util/gtk-doc-am
		dev-util/intltool
		virtual/pkgconfig
		"
RDEPEND="
		introspection? ( dev-libs/gobject-introspection )
		gnome-base/gnome-keyring
		sys-apps/dbus
		"
BDEPEND=""

src_prepare() {
	eapply_user
	NOCONFIGURE=1 ./autogen.sh
}

src_configure() {
	local myconf
	if ! use debug; then
		myconf+=" --disable-debug"
	fi
	econf \
		--prefix=/usr \
		--sysconfdir=/etc \
		--localstatedir=/var \
		--disable-static \
		--libexecdir=/usr/lib \
		${myconf}
}

src_compile() {
	emake
}

src_install() {
	emake DESTDIR="${D}" install
}
