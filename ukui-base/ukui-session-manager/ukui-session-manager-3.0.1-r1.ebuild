# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake-utils

DESCRIPTION="ukui-session-manager"
HOMEPAGE="https://github.com/ukui/ukui-session-manager"
SRC_URI="https://github.com/ukui/ukui-session-manager/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
		dev-qt/linguist-tools
		dev-qt/qtcore
		dev-qt/qtdbus
		dev-qt/qtmultimedia
		dev-qt/qtwidgets
		dev-qt/qtx11extras
		kde-frameworks/kidletime
		x11-libs/gsettings-qt
		x11-libs/libxcb
		x11-libs/libXtst"
RDEPEND="${DEPEND}"
BDEPEND=""
