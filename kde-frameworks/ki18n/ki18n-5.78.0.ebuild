# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3+ )
QT_MINIMAL=5.15.1
inherit kde5 python-single-r1

DESCRIPTION="Framework based on Gettext for internationalizing user interface text"
LICENSE="LGPL-2+"
KEYWORDS="*"
IUSE=""

REQUIRED_USE="${PYTHON_REQUIRED_USE}"

RDEPEND="${PYTHON_DEPS}
	$(add_qt_dep qtdeclarative)
	sys-devel/gettext
	virtual/libintl
"
DEPEND="${RDEPEND}
	test? ( $(add_qt_dep qtconcurrent) )
"

PATCHES=( "${FILESDIR}/${PN}-5.57.0-python.patch" )

pkg_setup() {
	kde5_pkg_setup
	python-single-r1_pkg_setup
}

src_configure() {
	local mycmakeargs=(
		-DCMAKE_DISABLE_FIND_PACKAGE_PythonModuleGeneration=ON # bug 746866
		-DPYTHON_EXECUTABLE="${PYTHON}"
	)
	kde5_src_configure
}
