# Distributed under the terms of the GNU General Public License v2

EAPI=7

KDE_TEST="forceoptional"
FRAMEWORKS_MINIMAL=5.98.0
QT_MINIMAL=5.12.3
VIRTUALX_REQUIRED="test"
inherit kde5

DESCRIPTION="Framework to collect user feedback for applications via telemetry and surveys"
SRC_URI="mirror://kde/stable/${PN}/${P}.tar.xz"

LICENSE="MIT"
SLOT="5"
KEYWORDS="*"
IUSE="doc"

BDEPEND="
	sys-devel/bison
	sys-devel/flex
	doc? (
		$(add_qt_dep qdoc)
		$(add_qt_dep qthelp)
	)
"
DEPEND="
	$(add_qt_dep qtcharts)
	$(add_qt_dep qtdeclarative)
	$(add_qt_dep qtgui)
	$(add_qt_dep qtnetwork)
	$(add_qt_dep qtprintsupport)
	$(add_qt_dep qtsql)
	$(add_qt_dep qtsvg)
	$(add_qt_dep qtwidgets)
	$(add_frameworks_dep kconfig)
	$(add_frameworks_dep kcoreaddons)
	$(add_frameworks_dep kdeclarative)
	$(add_frameworks_dep kguiaddons)
	$(add_frameworks_dep kwidgetsaddons)
"
RDEPEND="${DEPEND}"

src_configure() {
	local mycmakeargs=(
		# disable server application
		-DENABLE_PHP=NO
		-DENABLE_PHP_UNIT=NO
		-DENABLE_SURVEY_TARGET_EXPRESSIONS=YES
		-DENABLE_DOCS=$(usex doc)
	)

	kde5_src_configure
}
