# Distributed under the terms of the GNU General Public License v2

EAPI=7

QT_MINIMAL=5.15.2
VIRTUALX_REQUIRED="test"
inherit kde5

DESCRIPTION="Framework to let applications perform actions as a privileged user"
LICENSE="LGPL-2.1+"
KEYWORDS="*"
IUSE="nls +policykit"

BDEPEND="
	nls? ( $(add_qt_dep linguist-tools) )
"
DEPEND="
	$(add_qt_dep qtdbus)
	$(add_qt_dep qtgui)
	$(add_qt_dep qtwidgets)
	$(add_frameworks_dep kcoreaddons)
	policykit? ( >=sys-auth/polkit-qt-0.113.0 )
"
RDEPEND="${DEPEND}"
PDEPEND="policykit? ( kde-plasma/polkit-kde-agent )"

src_configure() {
	local mycmakeargs=(
		-DCMAKE_DISABLE_FIND_PACKAGE_PythonModuleGeneration=ON # bug 746866
		$(cmake-utils_use_find_package policykit PolkitQt5-1)
	)

	kde5_src_configure
}

src_test() {
	# KAuthHelperTest test fails, bug 654842
	local myctestargs=(
		-E "(KAuthHelperTest)"
	)

	kde5_src_test
}