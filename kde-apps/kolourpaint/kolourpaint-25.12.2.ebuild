# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit cmake

DESCRIPTION="Paint Program by KDE"
HOMEPAGE="https://apps.kde.org/kolourpaint/"
SRC_URI="https://download.kde.org/stable/release-service/25.12.2/src/kolourpaint-25.12.2.tar.xz -> kolourpaint-25.12.2.tar.xz"
SLOT="6"
KEYWORDS="*"
IUSE="scanner"
RDEPEND="virtual/kde-seed[gui]
	kde-frameworks/kconfig:6
	kde-frameworks/kconfigwidgets:6
	kde-frameworks/kcoreaddons:6
	kde-frameworks/kcrash:6
	kde-frameworks/kguiaddons:6
	kde-frameworks/ki18n:6
	kde-frameworks/kio:6
	kde-frameworks/kjobwidgets:6
	kde-frameworks/kservice:6
	kde-frameworks/kwidgetsaddons:6
	kde-frameworks/kxmlgui:6
	scanner? ( kde-apps/libksane:6 )
	
"
DEPEND="${RDEPEND}
"

# vim: filetype=ebuild
