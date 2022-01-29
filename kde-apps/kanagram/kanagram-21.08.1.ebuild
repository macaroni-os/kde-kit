# Distributed under the terms of the GNU General Public License v2

EAPI=7

KDE_HANDBOOK="forceoptional"
FRAMEWORKS_MINIMAL=5.75.0
QT_MINIMAL=5.15.1
inherit kde5

DESCRIPTION="Game based on anagrams of words"
HOMEPAGE="https://apps.kde.org/en/kanagram https://edu.kde.org/kanagram/"
LICENSE="GPL-2" # TODO: CHECK
SLOT="5"
KEYWORDS="*"
IUSE="speech"

DEPEND="
	$(add_qt_dep qtdeclarative)
	$(add_qt_dep qtgui)
	$(add_qt_dep qtwidgets)
	$(add_kdeapps_dep libkeduvocdocument)
	$(add_frameworks_dep kconfig)
	$(add_frameworks_dep kconfigwidgets)
	$(add_frameworks_dep kcoreaddons)
	$(add_frameworks_dep kcrash)
	$(add_frameworks_dep ki18n)
	$(add_frameworks_dep knewstuff)
	$(add_frameworks_dep kwidgetsaddons)
	$(add_frameworks_dep kxmlgui)
	$(add_frameworks_dep sonnet)
	>=media-libs/phonon-4.11.0
	speech? ( $(add_qt_dep qtspeech) )
"
RDEPEND="${DEPEND}
	$(add_qt_dep qtmultimedia qml)
	$(add_qt_dep qtquickcontrols)
	$(add_kdeapps_dep kdeedu-data)
"

src_configure() {
	local mycmakeargs=(
		$(cmake-utils_use_find_package speech Qt5TextToSpeech)
	)

	kde5_src_configure
}