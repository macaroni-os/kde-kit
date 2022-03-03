# Distributed under the terms of the GNU General Public License v2

EAPI=7

KDE_HANDBOOK="optional"
FRAMEWORKS_MINIMAL=5.75.0
QT_MINIMAL=5.15.1
inherit kde5

DESCRIPTION="MathML-based 2D and 3D graph calculator by KDE"
HOMEPAGE="https://apps.kde.org/en/kalgebra https://edu.kde.org/kalgebra/"
LICENSE="GPL-2" # TODO: CHECK
SLOT="5"
KEYWORDS="*"
IUSE="readline"

DEPEND="
	$(add_qt_dep qtdeclarative)
	$(add_qt_dep qtgui)
	$(add_qt_dep qtprintsupport)
	$(add_qt_dep qtwebengine widgets)
	$(add_qt_dep qtwidgets)
	$(add_kdeapps_dep analitza)
	$(add_frameworks_dep kconfig)
	$(add_frameworks_dep kconfigwidgets)
	$(add_frameworks_dep kcoreaddons)
	$(add_frameworks_dep ki18n)
	$(add_frameworks_dep kio)
	$(add_frameworks_dep kwidgetsaddons)
	$(add_frameworks_dep kxmlgui)
	readline? ( sys-libs/readline:0= )
"
RDEPEND="${DEPEND}
	$(add_qt_dep qtquickcontrols)
	$(add_frameworks_dep kirigami)
"

src_configure() {
	local mycmakeargs=(
		$(cmake-utils_use_find_package readline Readline)
	)

	kde5_src_configure
}