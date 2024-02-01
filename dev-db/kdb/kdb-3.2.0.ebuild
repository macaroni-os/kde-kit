# Distributed under the terms of the GNU General Public License v2

EAPI=7

KDE_QTHELP="true"
KDE_TEST="true"
PYTHON_COMPAT=( python3+ )
FRAMEWORKS_MINIMAL=5.98.0
QT_MINIMAL=5.12.3
inherit kde5 python-any-r1

DESCRIPTION="Database connectivity and creation framework for various vendors"
HOMEPAGE="https://community.kde.org/KDb"
SRC_URI="mirror://kde/stable/${PN}/src/${P}.tar.xz"

LICENSE="LGPL-2+"
SLOT="5/4"
KEYWORDS="*"
IUSE="debug mysql postgres sqlite"

BDEPEND="${PYTHON_DEPS}
	$(add_qt_dep linguist-tools)
"
DEPEND="
	dev-libs/icu:=
	$(add_qt_dep qtgui)
	$(add_qt_dep qtnetwork)
	$(add_qt_dep qtwidgets)
	$(add_qt_dep qtxml)
	$(add_frameworks_dep kcoreaddons)
	mysql? ( virtual/libmysqlclient )
	postgres? (
		$(add_qt_dep qtnetwork)
		dev-db/postgresql:*
	)
	sqlite? ( dev-db/sqlite:3 )
"
RDEPEND="${DEPEND}"

PATCHES=(
	"${FILESDIR}"/${P}-cmake-pg12.patch
	"${FILESDIR}"/${P}-build-w-pg12.patch
)

pkg_setup() {
	python-any-r1_pkg_setup
	kde5_pkg_setup
}

src_configure() {
	local mycmakeargs=(
		-DKDB_DEBUG_GUI=$(usex debug)
		$(cmake-utils_use_find_package mysql MySQL)
		$(cmake-utils_use_find_package postgres PostgreSQL)
		$(cmake-utils_use_find_package sqlite Sqlite)
	)

	kde5_src_configure
}
