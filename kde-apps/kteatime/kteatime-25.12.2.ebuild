# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit cmake

DESCRIPTION="KDE timer for making a fine cup of tea"
HOMEPAGE="https://apps.kde.org/kteatime/"
SRC_URI="https://download.kde.org/stable/release-service/25.12.2/src/kteatime-25.12.2.tar.xz -> kteatime-25.12.2.tar.xz"
SLOT="6"
KEYWORDS="*"
RDEPEND="virtual/kde-seed[gui]
	kde-frameworks/kconfig:6
	kde-frameworks/kconfigwidgets:6
	kde-frameworks/kcoreaddons:6
	kde-frameworks/kcrash:6
	kde-frameworks/kguiaddons:6
	kde-frameworks/ki18n:6
	kde-frameworks/kiconthemes:6
	kde-frameworks/knotifications:6
	kde-frameworks/knotifyconfig:6
	kde-frameworks/kstatusnotifieritem:6
	kde-frameworks/ktextwidgets:6
	kde-frameworks/kxmlgui:6
	
"
DEPEND="${RDEPEND}
"

# vim: filetype=ebuild
