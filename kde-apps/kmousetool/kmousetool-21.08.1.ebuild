# Distributed under the terms of the GNU General Public License v2

EAPI=7

KDE_HANDBOOK="forceoptional"
FRAMEWORKS_MINIMAL=5.75.0
QT_MINIMAL=5.15.1
inherit kde5

DESCRIPTION="KDE program that clicks the mouse for you"
HOMEPAGE="https://apps.kde.org/en/kmousetool"
LICENSE="GPL-2" # TODO: CHECK
SLOT="5"
KEYWORDS="*"
IUSE=""

RDEPEND="
	$(add_qt_dep qtgui)
	$(add_qt_dep qtwidgets)
	$(add_frameworks_dep kcoreaddons)
	$(add_frameworks_dep kdbusaddons)
	$(add_frameworks_dep ki18n)
	$(add_frameworks_dep kiconthemes)
	$(add_frameworks_dep knotifications)
	$(add_frameworks_dep kwidgetsaddons)
	$(add_frameworks_dep kxmlgui)
	>=media-libs/phonon-4.11.0
	x11-libs/libX11
	x11-libs/libXtst
"
DEPEND="${RDEPEND}
	x11-base/xorg-proto
	x11-libs/libXext
	x11-libs/libXt
"