# Distributed under the terms of the GNU General Public License v2

EAPI=7

KDE_QTHELP="false"
KDE_TEST="false"
QT_MINIMAL=5.15.1
inherit kde5

DESCRIPTION="Framework providing KDE integration of QtWebKit"
LICENSE="LGPL-2+"
KEYWORDS="*"
IUSE="designer"

RDEPEND="
	>=dev-qt/qtwebkit-5.212.0_pre20180120:5
	$(add_qt_dep qtgui)
	$(add_qt_dep qtnetwork)
	$(add_qt_dep qtwidgets)
	$(add_frameworks_dep kconfig)
	$(add_frameworks_dep kcoreaddons)
	$(add_frameworks_dep kio)
	$(add_frameworks_dep kjobwidgets)
	$(add_frameworks_dep kparts)
	$(add_frameworks_dep kservice)
	$(add_frameworks_dep kwallet)
	designer? ( $(add_frameworks_dep kdesignerplugin) )
"
DEPEND="${RDEPEND}
	$(add_qt_dep qtnetwork)
"

src_configure() {
	local mycmakeargs=(
		-DBUILD_DESIGNERPLUGIN=$(usex designer)
	)
	kde5_src_configure
}
