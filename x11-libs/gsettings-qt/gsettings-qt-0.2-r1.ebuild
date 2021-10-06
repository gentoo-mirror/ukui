# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit qmake-utils

DESCRIPTION="Qml bindings for GSettings."
HOMEPAGE="https://launchpad.net/gsettings-qt"
SRC_URI="https://launchpad.net/ubuntu/+archive/primary/+sourcefiles/${PN}/${PV}-${PR#r}/${PN}_${PV}.orig.tar.gz -> ${P}.tar.gz
		https://launchpad.net/ubuntu/+archive/primary/+sourcefiles/${PN}/${PV}-${PR#r}/${PN}_${PV}-${PR#r}.debian.tar.xz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEPEND="dev-libs/glib:2
		dev-qt/qtcore:5
		dev-qt/qtdeclarative:5
		test? ( dev-qt/qttest:5 )"
RESTRICT="!test? ( test )"

unset QT_QPA_PLATFORMTHEME
S="${WORKDIR}/${PN}-v${PV}"

PATCHDIR="${WORKDIR}/debian/patches"
PATCHES=(
	"${PATCHDIR}/0001_Fix-link-path-error.patch"
	"${PATCHDIR}/0002_Add-ordered-config.patch"
	"${PATCHDIR}/0003_Fix-make-check-failed.patch"
	"${PATCHDIR}/0004_Increase-test-timeout.patch"
	"${PATCHDIR}/0005_bugfix-about-test-cases.patch"
	"${PATCHDIR}/2001_keep-com.canonical-DBus-namespace.patch"
)

src_prepare() {
	default
	eapply_user

	# Don't pre-strip
	echo "CONFIG+=nostrip" >> "${S}"/GSettings/gsettings-qt.pro
	echo "CONFIG+=nostrip" >> "${S}"/src/gsettings-qt.pro
	echo "CONFIG+=nostrip" >> "${S}"/tests/tests.pro

	use test || \
		sed -i \
			-e "s:\(GSettings/gsettings-qt.pro\) \\\:\1:" \
			-e "/tests.pro/d" \
			-e "/cpptest.pro/d" \
			"${S}"/gsettings-qt.pro
}

src_configure() {
	eqmake5
}

src_install () {
	emake INSTALL_ROOT="${ED}" install
}
