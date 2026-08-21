# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit cmake

DESCRIPTION="Simple image scanning application based on libksane and KDE Frameworks"
HOMEPAGE="https://apps.kde.org/skanlite/"
SRC_URI="https://download.kde.org/Attic//release-service/25.12.2/src/skanlite-25.12.2.tar.xz -> skanlite-25.12.2.tar.xz"
LICENSE="|| ( GPL-2 GPL-3 )"
SLOT="6"
KEYWORDS="*"
RDEPEND="dev-qt/qtbase:6[gui]
	kde-apps/libksane:6
	kde-frameworks/kconfig:6
	kde-frameworks/kconfigwidgets:6
	kde-frameworks/kcoreaddons:6
	kde-frameworks/kcrash:6
	kde-frameworks/ki18n:6
	kde-frameworks/kio:6
	kde-frameworks/kjobwidgets:6
	kde-frameworks/kwidgetsaddons:6
	kde-frameworks/kxmlgui:6
	
"
DEPEND="${RDEPEND}
"

# vim: filetype=ebuild
