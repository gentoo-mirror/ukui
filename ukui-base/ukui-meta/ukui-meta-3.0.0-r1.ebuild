# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="UKUI desktop environment(meta package)"
HOMEPAGE="https://www.ukui.org/"
SRC_URI=""

LICENSE="metapackage"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
		ukui-base/peony
		ukui-base/ukui-control-center
		ukui-base/ukui-biometric-auth
		ukui-base/ukui-media
		ukui-base/ukui-menu
		ukui-base/ukui-panel
		ukui-base/ukui-power-manager
		ukui-base/ukui-screensaver
		ukui-base/ukui-session-manager
		ukui-base/ukui-settings-daemon
		ukui-base/ukui-sidebar
		ukui-base/ukui-window-switch
		x11-misc/ukui-greeter
		x11-wm/ukui-kwin
		x11-themes/qt5-ukui-platformtheme
		x11-themes/ukui-themes
		x11-themes/ukui-wallpapers
		"
# waiting for port
# ukui-panel plugin calendar
