# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit meson

DESCRIPTION="some wallpapers of ubuntukylin-wallpapers"
HOMEPAGE="https://github.com/ukui/ukui-wallpapers"
SRC_URI="https://github.com/ukui/ukui-wallpapers/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="CC-BY-SA-3.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
