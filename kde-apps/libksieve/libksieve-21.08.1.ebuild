# Distributed under the terms of the GNU General Public License v2

EAPI=7

KDE_HANDBOOK="forceoptional"
KDE_TEST="true"
FRAMEWORKS_MINIMAL=5.75.0
QT_MINIMAL=5.15.1
VIRTUALX_REQUIRED="test"
inherit kde5

DESCRIPTION="Common PIM libraries"
LICENSE="GPL-2+ LGPL-2.1+"
SLOT="5"
KEYWORDS="*"
IUSE=""

RDEPEND="
	dev-libs/cyrus-sasl
	$(add_qt_dep qtdbus)
	$(add_qt_dep qtgui)
	$(add_qt_dep qtnetwork)
	$(add_qt_dep qtprintsupport)
	$(add_qt_dep qtwebengine widgets)
	$(add_qt_dep qtwidgets)
	$(add_kdeapps_dep kidentitymanagement)
	$(add_kdeapps_dep kmime)
	$(add_kdeapps_dep kpimtextedit)
	$(add_kdeapps_dep libkdepim)
	$(add_kdeapps_dep pimcommon)
	$(add_frameworks_dep karchive)
	$(add_frameworks_dep kcompletion)
	$(add_frameworks_dep kconfig)
	$(add_frameworks_dep kconfigwidgets)
	$(add_frameworks_dep kcoreaddons)
	$(add_frameworks_dep ki18n)
	$(add_frameworks_dep kio)
	$(add_frameworks_dep knewstuff)
	$(add_frameworks_dep kwidgetsaddons)
	$(add_frameworks_dep sonnet)
	$(add_frameworks_dep syntax-highlighting)
"
DEPEND="${RDEPEND}
	$(add_kdeapps_dep kimap)
	$(add_kdeapps_dep kmailtransport)
"

RESTRICT+=" test"

src_prepare() {
	kde5_src_prepare
	cd kioslave && cmake_comment_add_subdirectory doc
}