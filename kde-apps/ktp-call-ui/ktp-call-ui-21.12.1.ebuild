# Distributed under the terms of the GNU General Public License v2

EAPI=7

FRAMEWORKS_MINIMAL=5.75.0
QT_MINIMAL=5.15.2
inherit kde5

DESCRIPTION="KDE Telepathy audio/video conferencing UI"
HOMEPAGE="https://community.kde.org/KTp"
LICENSE="GPL-2"
SLOT="5"
KEYWORDS="*"
IUSE=""

RDEPEND="
	dev-libs/glib:2
	$(add_qt_dep qtdbus)
	$(add_qt_dep qtdeclarative)
	$(add_qt_dep qtgui)
	$(add_qt_dep qtwidgets)
	$(add_kdeapps_dep ktp-common-internals)
	$(add_frameworks_dep kcompletion)
	$(add_frameworks_dep kconfig)
	$(add_frameworks_dep kconfigwidgets)
	$(add_frameworks_dep kcoreaddons)
	$(add_frameworks_dep kdeclarative)
	$(add_frameworks_dep ki18n)
	$(add_frameworks_dep kiconthemes)
	$(add_frameworks_dep knotifications)
	$(add_frameworks_dep kwidgetsaddons)
	$(add_frameworks_dep kxmlgui)
	>=media-libs/phonon-4.11.0
	>=media-libs/qt-gstreamer-1.2.0-r4
	net-libs/farstream:0.2
	net-libs/telepathy-farstream
	>=net-libs/telepathy-qt-0.9.8[farstream]
"
# TODO: dep leak suspect
DEPEND="${RDEPEND}
	$(add_frameworks_dep kcmutils)
"