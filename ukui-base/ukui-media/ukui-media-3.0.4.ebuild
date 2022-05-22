# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit gnome2-utils qmake-utils xdg

DESCRIPTION="media tools for UKUI"
HOMEPAGE="https://github.com/ukui/ukui-media"
SRC_URI="https://github.com/ukui/ukui-media/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	dev-libs/libxml2
	dev-qt/qtmultimedia
	dev-qt/qtsvg
	dev-util/intltool
	kde-frameworks/kwindowsystem
	mate-base/mate-common
	mate-base/mate-desktop
	media-libs/libcanberra
	media-libs/libmatemixer
	media-sound/pulseaudio
	x11-libs/gsettings-qt
	x11-libs/gtk+:3
	"
RDEPEND="ukui-base/ukui-interface"
BDEPEND=""

src_prepare() {
	NOCONFIGURE=1 ./autogen.sh || die
	default
	# QA issuse
	sed -i 's,OnlyShowIn=UKUI,OnlyShowIn=X-UKUI,g' "${S}/data/ukui-volume-control.desktop.in.in" || die
}

src_configure() {
	econf --prefix="/usr" --libexecdir="/usr/lib/${PN}"  --sysconfdir="/etc"
	cd ukui-volume-control-applet-qt || die
	eqmake5 PREFIX="/usr/share/${PN}"
}
src_compile(){
	emake "$@"
	cd ukui-volume-control-applet-qt || die
	emake
}

src_install() {
	emake DESTDIR="${D}" install
	cd ukui-volume-control-applet-qt || die
	emake INSTALL_ROOT="${D}" install
	mv "${D}/usr/share/ukui-media/org.ukui.audio.gschema.xml" "${D}/usr/share/glib-2.0/schemas" || die
	mv "${D}/usr/share/ukui-media/org.ukui.sound.gschema.xml" "${D}/usr/share/glib-2.0/schemas" || die
}

pkg_postinst() {
	xdg_pkg_postinst
	gnome2_schemas_update
}

pkg_postrm() {
	xdg_pkg_postrm
	gnome2_schemas_update
}
