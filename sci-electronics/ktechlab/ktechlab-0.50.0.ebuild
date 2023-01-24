# Distributed under the terms of the GNU General Public License v2

EAPI=7

KDE_EXAMPLES="true"
KDE_HANDBOOK="forceoptional"
KDE_TEST="true"
FRAMEWORKS_MINIMAL=5.98.0
QT_MINIMAL=5.15.1
inherit kde5

DESCRIPTION="IDE for microcontrollers and electronics"
HOMEPAGE="https://userbase.kde.org/KTechlab"
SRC_URI="mirror://kde/unstable/${PN}/${P}.tar.xz"

LICENSE="GPL-2"
SLOT="5"
KEYWORDS="*"
IUSE="+gpsim"

DEPEND="
	$(add_qt_dep qtdbus)
	$(add_qt_dep qtgui)
	$(add_qt_dep qtprintsupport)
	$(add_qt_dep qtwidgets)
	$(add_qt_dep qtxml)
	$(add_frameworks_dep kcompletion)
	$(add_frameworks_dep kconfig)
	$(add_frameworks_dep kconfigwidgets)
	$(add_frameworks_dep kcoreaddons)
	$(add_frameworks_dep ki18n)
	$(add_frameworks_dep kiconthemes)
	$(add_frameworks_dep kio)
	$(add_frameworks_dep kjobwidgets)
	$(add_frameworks_dep kparts)
	$(add_frameworks_dep ktexteditor)
	$(add_frameworks_dep ktextwidgets)
	$(add_frameworks_dep kwidgetsaddons)
	$(add_frameworks_dep kwindowsystem)
	$(add_frameworks_dep kxmlgui)
	gpsim? ( dev-embedded/gpsim )
"
RDEPEND="${DEPEND}"

PATCHES=( "${FILESDIR}"/${P}-deps.patch )
