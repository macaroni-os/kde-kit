# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit cmake

DESCRIPTION="Frontend for Cachegrind by KDE"
HOMEPAGE="https://apps.kde.org/kcachegrind/"
SRC_URI="https://download.kde.org/stable/release-service/25.12.2/src/kcachegrind-25.12.2.tar.xz -> kcachegrind-25.12.2.tar.xz"
SLOT="6"
KEYWORDS="*"
BDEPEND="dev-qt/qttools:6[linguist]
	
"
RDEPEND="virtual/kde-seed[gui]
	kde-frameworks/karchive:6
	kde-frameworks/kconfig:6
	kde-frameworks/kconfigwidgets:6
	kde-frameworks/kcoreaddons:6
	kde-frameworks/kdbusaddons:6
	kde-frameworks/ki18n:6
	kde-frameworks/kio:6
	kde-frameworks/kjobwidgets:6
	kde-frameworks/kwidgetsaddons:6
	kde-frameworks/kxmlgui:6
	media-gfx/graphviz
	
"
DEPEND="${RDEPEND}
"

# vim: filetype=ebuild
