# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit kde6

DESCRIPTION="Framework to work with KDE System Settings modules"
HOMEPAGE="https://invent.kde.org/frameworks/"
SRC_URI="https://download.kde.org/stable/frameworks/6.22/kcmutils-6.22.0.tar.xz -> kcmutils-6.22.0.tar.xz"
SLOT="6"
KEYWORDS="*"
RDEPEND="dev-qt/qtbase:6[gui]
	dev-qt/qtdeclarative:6
	kde-frameworks/kconfig:6
	kde-frameworks/kconfigwidgets:6
	kde-frameworks/kcoreaddons:6
	kde-frameworks/kguiaddons:6
	kde-frameworks/ki18n:6
	kde-frameworks/kio:6
	kde-frameworks/kitemviews:6
	kde-frameworks/kwidgetsaddons:6
	kde-frameworks/kxmlgui:6
	
"
DEPEND="${RDEPEND}
	
"

# vim: filetype=ebuild
