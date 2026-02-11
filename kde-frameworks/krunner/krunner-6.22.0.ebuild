# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit cmake

DESCRIPTION="Framework for providing different actions given a string query"
HOMEPAGE="https://invent.kde.org/frameworks/"
SRC_URI="https://download.kde.org/stable/frameworks/6.22/krunner-6.22.0.tar.xz -> krunner-6.22.0.tar.xz"
LICENSE="GPL-2"
SLOT="6"
KEYWORDS="*"
IUSE="wayland"
RDEPEND="virtual/kde-seed[gui,wayland?]
	kde-frameworks/kconfig:6
	kde-frameworks/kcoreaddons:6
	kde-frameworks/ki18n:6
	kde-frameworks/kitemmodels:6
	kde-frameworks/kwindowsystem:6[wayland?]
	
"
DEPEND="${RDEPEND}
"

# vim: filetype=ebuild
