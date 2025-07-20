# Distributed under the terms of the GNU General Public License v2

EAPI=7

KDE_QTHELP="true"
FRAMEWORKS_MINIMAL=5.105.0
QT_MINIMAL=5.15.2
inherit kde5

DESCRIPTION="Templated convergent controls and multiplatform utilities for Maui applications"
SRC_URI="https://invent.kde.org/libraries/ktextaddons/-/archive/v${PV}/ktextaddons-v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="5"
KEYWORDS="*"
IUSE="speech"

S="${WORKDIR}/${PN}-v${PV}"

DEPEND="
	dev-libs/qtkeychain
	$(add_qt_dep qtgui)
	$(add_qt_dep qtnetwork)
	$(add_qt_dep qtwidgets)
	$(add_frameworks_dep karchive)
	$(add_frameworks_dep kconfig)
	$(add_frameworks_dep kconfigwidgets)
	$(add_frameworks_dep kcoreaddons)
	$(add_frameworks_dep ki18n)
	$(add_frameworks_dep kio)
	$(add_frameworks_dep kwidgetsaddons)
	$(add_frameworks_dep kxmlgui)
	$(add_frameworks_dep sonnet)
	$(add_frameworks_dep syntax-highlighting)
	speech? ( $(add_qt_dep qtspeech) )
"
RDEPEND="${DEPEND}"

src_configure() {
	local mycmakeargs=(
		$(cmake_use_find_package speech Qt5TextToSpeech)
	)
	kde5_src_configure
}
