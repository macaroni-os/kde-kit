# Distributed under the terms of the GNU General Public License v2

EAPI=7

QT_MINIMAL=5.15.1
inherit kde5

DESCRIPTION="Framework to install and load packages of non binary content"
LICENSE="LGPL-2+"
KEYWORDS="*"
IUSE="man"

BDEPEND="
	man? ( $(add_frameworks_dep kdoctools) )
"
DEPEND="
	$(add_qt_dep qtdbus)
	$(add_frameworks_dep karchive)
	$(add_frameworks_dep kcoreaddons)
	$(add_frameworks_dep ki18n)
"
RDEPEND="${DEPEND}"

src_configure() {
	local mycmakeargs=(
		$(cmake-utils_use_find_package man KF5DocTools)
	)

	kde5_src_configure
}

src_test() {
	#bug 650214
	local myctestargs=( -E "(plasma-plasmoidpackagetest)" )
	kde5_src_test
}