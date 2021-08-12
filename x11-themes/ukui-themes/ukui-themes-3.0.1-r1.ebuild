# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit meson

DESCRIPTION="The theme collections of UKUI."
HOMEPAGE="https://github.com/ukui/ukui-themes"
SRC_URI="https://github.com/ukui/ukui-themes/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="dev-ruby/sass:="
RDEPEND="${DEPEND}"
BDEPEND=""
