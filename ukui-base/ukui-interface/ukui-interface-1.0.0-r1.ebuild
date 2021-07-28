# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit autotools

mytag="mentors-${PV}-1"

DESCRIPTION="ukui interface"
HOMEPAGE="https://github.com/ukui/ukui-interface"
SRC_URI="https://github.com/ukui/ukui-interface/archive/${mytag}.tar.gz -> ${P}.tar.gz"

echo ${P}

S="${WORKDIR}/${PN}-${mytag}"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
		dev-qt/qtcore
		dev-qt/qtchooser
		dev-qt/qtgui
		dev-qt/qtscript
		dev-qt/qtsensors
		dev-qt/qtsvg
		dev-qt/qtwidgets
		dev-qt/qtx11extras
		"
RDEPEND="${DEPEND}"
BDEPEND=""

src_prepare() {
	default
	eautoreconf
}
