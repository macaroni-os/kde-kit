# Distributed under the terms of the GNU General Public License v2

EAPI=7

KDE_TEST="true"
FRAMEWORKS_MINIMAL=5.75.0
QT_MINIMAL=5.15.1
inherit kde5

DESCRIPTION="Calendar viewer for KDE PIM"
LICENSE="GPL-2+ LGPL-2.1+"
SLOT="5"
KEYWORDS="*"
IUSE=""

DEPEND="
	dev-libs/kdiagram:5
	dev-libs/libical
	$(add_qt_dep qtcore)
	$(add_qt_dep qtgui)
	$(add_qt_dep qtwidgets)
	$(add_kdeapps_dep akonadi)
	$(add_kdeapps_dep akonadi-calendar)
	$(add_kdeapps_dep calendarsupport)
	$(add_kdeapps_dep kcalutils)
	$(add_kdeapps_dep kmime)
	$(add_kdeapps_dep libkdepim)
	$(add_frameworks_dep kcalendarcore)
	$(add_frameworks_dep kcodecs)
	$(add_frameworks_dep kcompletion)
	$(add_frameworks_dep kconfig)
	$(add_frameworks_dep kconfigwidgets)
	$(add_frameworks_dep kcontacts)
	$(add_frameworks_dep kcoreaddons)
	$(add_frameworks_dep kguiaddons)
	$(add_frameworks_dep ki18n)
	$(add_frameworks_dep kiconthemes)
	$(add_frameworks_dep kitemmodels)
	$(add_frameworks_dep kservice)
	$(add_frameworks_dep kwidgetsaddons)
"
RDEPEND="${DEPEND}"