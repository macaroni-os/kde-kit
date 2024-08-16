# Distributed under the terms of the GNU General Public License v2

EAPI=7

QT_MINIMAL=5.15.1
inherit kde5

DESCRIPTION="Framework for solving common problems such as caching, randomisation, and more"
LICENSE="LGPL-2+"
KEYWORDS="*"
IUSE="dbus fam nls"

BDEPEND="
	nls? ( $(add_qt_dep linguist-tools) )
"
DEPEND="
	$(add_qt_dep qtcore icu)
	fam? ( virtual/fam )
	dbus? ( $(add_qt_dep qtdbus) )
"
RDEPEND="${DEPEND}"

src_configure() {
	local mycmakeargs=(
		-D_KDE4_DEFAULT_HOME_POSTFIX=4
		-DENABLE_PROCSTAT=OFF # silence FreeBSD spam
		-DCMAKE_DISABLE_FIND_PACKAGE_PythonModuleGeneration=ON # bug 746866
		$(cmake-utils_use_find_package fam FAM)
		$(cmake_use_find_package dbus Qt5DBus)
	)

	kde5_src_configure
}

src_test() {
	# bugs: 619656, 632398, 647414, 665682
	local myctestargs=(
		-j1
		-E "(kautosavefiletest|kdirwatch_qfswatch_unittest|kdirwatch_stat_unittest|kformattest)"
	)

	kde5_src_test
}
