# Distributed under the terms of the GNU General Public License v2

EAPI=7

KDE_TEST="true"
FRAMEWORKS_MINIMAL=5.75.0
QT_MINIMAL=5.15.1
VIRTUALX_REQUIRED="test"
inherit kde5

DESCRIPTION="Library for gravatar integration"
LICENSE="GPL-2+"
SLOT="5"
KEYWORDS="*"
IUSE=""

DEPEND="
	$(add_qt_dep qtgui)
	$(add_qt_dep qtnetwork)
	$(add_qt_dep qtwidgets)
	$(add_kdeapps_dep pimcommon)
	$(add_frameworks_dep kconfig)
	$(add_frameworks_dep ki18n)
	$(add_frameworks_dep kio)
	$(add_frameworks_dep ktextwidgets)
	$(add_frameworks_dep kwidgetsaddons)
"
RDEPEND="${DEPEND}"

src_test() {
	# bug 624584 - needs internet connection
	local myctestargs=(
		-E "(gravatar-gravatarresolvurljobtest)"
	)
	kde5_src_test
}