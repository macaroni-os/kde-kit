# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit cmake

DESCRIPTION="Screen ruler for Plasma"
HOMEPAGE="https://apps.kde.org/kruler/"
SRC_URI="https://download.kde.org/stable/release-service/25.12.2/src/kruler-25.12.2.tar.xz -> kruler-25.12.2.tar.xz"
SLOT="6"
KEYWORDS="*"
IUSE="X"
RDEPEND="virtual/kde-seed[gui,X?]
	kde-frameworks/kconfig:6
	kde-frameworks/kconfigwidgets:6
	kde-frameworks/kcoreaddons:6
	kde-frameworks/kcrash:6
	kde-frameworks/ki18n:6
	kde-frameworks/knotifications:6
	kde-frameworks/kstatusnotifieritem:6
	kde-frameworks/kwidgetsaddons:6
	kde-frameworks/kwindowsystem:6[X?]
	kde-frameworks/kxmlgui:6
	X? (
	  x11-libs/libxcb
	)
	
"
DEPEND="${RDEPEND}
"

# vim: filetype=ebuild
