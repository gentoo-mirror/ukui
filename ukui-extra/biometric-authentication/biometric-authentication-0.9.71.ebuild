# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit autotools

DESCRIPTION="A biometric identification framework for UKUI"
HOMEPAGE="https://github.com/ukui/biometric-authentication"
SRC_URI="https://github.com/ukui/biometric-authentication/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	dev-db/sqlite
	dev-libs/glib
	x11-libs/gtk+:3
	sys-auth/libfprint:2
	sys-auth/polkit[gtk]
	virtual/libusb:1
	"
RDEPEND="${DEPEND}
	dev-python/dbus-python
	dev-python/prettytable
	dev-python/pygobject
	"

src_prepare() {
	default
	eautoreconf
}
