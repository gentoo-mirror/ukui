# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="Manager for biometric authentication"
HOMEPAGE="https://github.com/ukui/ukui-biometric-manager"
SRC_URI="https://github.com/ukui/ukui-biometric-manager/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	dev-qt/qtcore
	dev-qt/qtgui
	dev-qt/qtdbus
	dev-qt/qtx11extras
	kde-frameworks/kwindowsystem
	media-libs/opencv
	x11-libs/gsettings-qt
	"
RDEPEND="${DEPEND}
	!ukui-base/ukui-biometric-auth
	ukui-extra/biometric-authentication
	"
