# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit cmake

DESCRIPTION="Graphical File Differences Tool"
HOMEPAGE="https://apps.kde.org/kompare/"
SRC_URI="https://download.kde.org/stable/release-service/25.12.2/src/kompare-25.12.2.tar.xz -> kompare-25.12.2.tar.xz"
SLOT="6"
KEYWORDS="*"
RDEPEND="virtual/kde-seed[gui]
	kde-apps/libkomparediff2:6
	kde-frameworks/kcompletion:6
	kde-frameworks/kcodecs:6
	kde-frameworks/kconfig:6
	kde-frameworks/kconfigwidgets:6
	kde-frameworks/kcoreaddons:6
	kde-frameworks/ki18n:6
	kde-frameworks/kiconthemes:6
	kde-frameworks/kio:6
	kde-frameworks/kjobwidgets:6
	kde-frameworks/kparts:6
	kde-frameworks/kservice:6
	kde-frameworks/ktexteditor:6
	kde-frameworks/kwidgetsaddons:6
	kde-frameworks/kxmlgui:6
	
"
DEPEND="${RDEPEND}
"

# vim: filetype=ebuild
