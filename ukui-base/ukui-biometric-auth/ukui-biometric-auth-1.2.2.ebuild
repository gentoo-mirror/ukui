# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="biometric authentication ui of UKUI"
HOMEPAGE="https://github.com/ukui/ukui-biometric-auth"
SRC_URI="https://github.com/ukui/ukui-biometric-auth/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

CDEPEND="
	dev-qt/qdbus
	dev-qt/qtcore
	dev-qt/qtwidgets
	media-libs/opencv
	sys-libs/pam
	sys-auth/polkit-qt
	"

DEPEND="
	${CDEPEND}
	dev-qt/linguist-tools
	"
RDEPEND="
	${CDEPEND}
	"
