# Distributed under the terms of the GNU General Public License v2

EAPI=7

KDE_HANDBOOK="forceoptional"
FRAMEWORKS_MINIMAL=5.75.0
QT_MINIMAL=5.15.1
inherit kde5 flag-o-matic

DESCRIPTION="Periodic table of the elements"
HOMEPAGE="https://apps.kde.org/en/kalzium https://edu.kde.org/kalzium/"
LICENSE="GPL-2" # TODO: CHECK
SLOT="5"
KEYWORDS="*"
IUSE="editor solver"

DEPEND="
	$(add_qt_dep qtgui)
	$(add_qt_dep qtscript)
	$(add_qt_dep qtsvg)
	$(add_qt_dep qtwidgets)
	$(add_qt_dep qtxml)
	$(add_frameworks_dep kcompletion)
	$(add_frameworks_dep kconfig)
	$(add_frameworks_dep kconfigwidgets)
	$(add_frameworks_dep kcoreaddons)
	$(add_frameworks_dep ki18n)
	$(add_frameworks_dep kio)
	$(add_frameworks_dep kitemviews)
	$(add_frameworks_dep kparts)
	$(add_frameworks_dep kplotting)
	$(add_frameworks_dep ktextwidgets)
	$(add_frameworks_dep kunitconversion)
	$(add_frameworks_dep kwidgetsaddons)
	$(add_frameworks_dep kxmlgui)
	editor? (
		dev-cpp/eigen:3
		$(add_qt_dep qtopengl)
		$(add_frameworks_dep knewstuff)
		sci-chemistry/openbabel
		>=sci-libs/avogadrolibs-1.93[qt5]
	)
	solver? ( dev-ml/facile[ocamlopt] )
"
RDEPEND="${DEPEND}
	sci-chemistry/chemical-mime-data
"

PATCHES=( "${FILESDIR}/${PN}-21.03.90-cmake.patch" )

src_configure(){
	# Fix missing finite()
	[[ ${CHOST} == *-solaris* ]] && append-cppflags -DHAVE_IEEEFP_H

	local mycmakeargs=(
		$(cmake-utils_use_find_package editor Eigen3)
		$(cmake-utils_use_find_package editor AvogadroLibs)
		$(cmake-utils_use_find_package editor OpenBabel2)
		$(cmake-utils_use_find_package solver OCaml)
		$(cmake-utils_use_find_package solver Libfacile)
	)

	kde5_src_configure
}