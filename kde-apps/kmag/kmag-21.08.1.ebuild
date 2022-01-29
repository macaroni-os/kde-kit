# Distributed under the terms of the GNU General Public License v2

EAPI=7

KDE_HANDBOOK="forceoptional"
FRAMEWORKS_MINIMAL=5.75.0
QT_MINIMAL=5.15.1
inherit kde5

DESCRIPTION="KDE screen magnifier"
HOMEPAGE="https://apps.kde.org/en/kmag"
LICENSE="GPL-2" # TODO: CHECK
SLOT="5"
KEYWORDS="*"
IUSE="keyboardfocus"

DEPEND="
	$(add_qt_dep qtgui)
	$(add_qt_dep qtprintsupport)
	$(add_qt_dep qtwidgets)
	$(add_frameworks_dep kconfig)
	$(add_frameworks_dep kconfigwidgets)
	$(add_frameworks_dep kcoreaddons)
	$(add_frameworks_dep ki18n)
	$(add_frameworks_dep kio)
	$(add_frameworks_dep kwidgetsaddons)
	$(add_frameworks_dep kxmlgui)
	keyboardfocus? ( >=media-libs/libqaccessibilityclient-0.4:5 )
"
RDEPEND="${DEPEND}"

src_configure() {
	local mycmakeargs=(
		$(cmake-utils_use_find_package keyboardfocus QAccessibilityClient)
	)

	kde5_src_configure
}