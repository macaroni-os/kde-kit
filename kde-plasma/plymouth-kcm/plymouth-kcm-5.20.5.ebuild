# Distributed under the terms of the GNU General Public License v2

EAPI=7

BOGUS=1
FRAMEWORKS_MINIMAL=5.74.0
QT_MINIMAL=5.15.1
inherit kde5

DESCRIPTION="KDE Plasma control module for Plymouth"
HOMEPAGE="https://invent.kde.org/plasma/plymouth-kcm"

LICENSE="GPL-2+"
SLOT="5"
KEYWORDS="*"
IUSE=""

DEPEND="
	$(add_qt_dep qtdeclarative)
	$(add_qt_dep qtgui)
	$(add_qt_dep qtquickcontrols)
	$(add_qt_dep qtwidgets)
	$(add_frameworks_dep karchive)
	$(add_frameworks_dep kauth)
	$(add_frameworks_dep kconfig)
	$(add_frameworks_dep kcoreaddons)
	$(add_frameworks_dep kdeclarative)
	$(add_frameworks_dep ki18n)
	$(add_frameworks_dep kio)
	$(add_frameworks_dep knewstuff)
	$(add_frameworks_dep kwidgetsaddons)
	sys-boot/plymouth
"
RDEPEND="${DEPEND}
	$(add_plasma_dep kde-cli-tools)
"

DOCS=( CONTRIBUTORS )
