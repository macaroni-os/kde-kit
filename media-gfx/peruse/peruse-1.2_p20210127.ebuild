# Distributed under the terms of the GNU General Public License v2

EAPI=7

COMMIT="945abe4daa5c49870a7492bf3806ee62fdaabc0a"
FRAMEWORKS_MINIMAL=5.74.0
inherit kde5

DESCRIPTION="Comic book reader"
HOMEPAGE="https://peruse.kde.org/"
SRC_URI="https://github.com/KDE/${PN}/archive/${COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="LGPL-2.1+"
SLOT="5"
KEYWORDS=""
IUSE="+semantic-desktop"

DEPEND="
	$(add_qt_dep qtdeclarative)
	$(add_qt_dep qtgui)
	$(add_qt_dep qtopengl)
	$(add_qt_dep qtsql)
	$(add_qt_dep qtwidgets)
	$(add_frameworks_dep karchive)
	$(add_frameworks_dep kconfig)
	$(add_frameworks_dep kcoreaddons)
	$(add_frameworks_dep kcrash)
	$(add_frameworks_dep kdeclarative)
	$(add_frameworks_dep kfilemetadata)
	$(add_frameworks_dep ki18n)
	$(add_frameworks_dep kiconthemes)
	$(add_frameworks_dep kio)
	$(add_frameworks_dep kitemmodels)
	$(add_frameworks_dep knewstuff)
	sys-libs/zlib
	semantic-desktop? ( $(add_frameworks_dep baloo) )
"
RDEPEND="${DEPEND}
	$(add_qt_dep qtquickcontrols2)
	$(add_kdeapps_dep okular qml)
	$(add_frameworks_dep kirigami)
"

S="${WORKDIR}/${PN}-${COMMIT}"

src_configure() {
	local mycmakeargs=(
		$(cmake-utils_use_find_package semantic-desktop KF5Baloo)
	)
	kde5_src_configure
}
