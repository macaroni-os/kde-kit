# Distributed under the terms of the GNU General Public License v2

EAPI=7

QT_MINIMAL=5.15.1
VIRTUALX_REQUIRED="test"
inherit kde5

DESCRIPTION="Framework providing data models to help with tasks such as sorting and filtering"

LICENSE="LGPL-2+"
KEYWORDS="*"
IUSE="qml"

RDEPEND="
	qml? ( $(add_qt_dep qtdeclarative) )
"
DEPEND="${RDEPEND}
	test? ( $(add_qt_dep qtwidgets) )
"

src_configure() {
	local mycmakeargs=(
		-DCMAKE_DISABLE_FIND_PACKAGE_PythonModuleGeneration=ON # bug 746866
		$(cmake-utils_use_find_package qml Qt5Qml)
	)
	kde5_src_configure
}

src_test() {
	LC_NUMERIC="C" kde5_src_test # bug 708820
}
