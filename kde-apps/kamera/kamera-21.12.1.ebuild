# Distributed under the terms of the GNU General Public License v2

EAPI=7

KDE_HANDBOOK="forceoptional"
FRAMEWORKS_MINIMAL=5.75.0
QT_MINIMAL=5.15.2
inherit kde5

DESCRIPTION="Plasma integration for gphoto2 cameras"
HOMEPAGE="https://apps.kde.org/en/kamera"
LICENSE="GPL-2+ handbook? ( FDL-1.2 )"
SLOT="5"
KEYWORDS="*"
IUSE=""

BDEPEND="
	sys-devel/gettext
"
DEPEND="
	$(add_qt_dep qtgui)
	$(add_qt_dep qtwidgets)
	$(add_frameworks_dep kconfig)
	$(add_frameworks_dep kconfigwidgets)
	$(add_frameworks_dep kcoreaddons)
	$(add_frameworks_dep kxmlgui)
	$(add_frameworks_dep ki18n)
	$(add_frameworks_dep kio)
	$(add_frameworks_dep kwidgetsaddons)
	media-libs/libgphoto2:=
"
RDEPEND="${DEPEND}"