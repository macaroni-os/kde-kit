# Distributed under the terms of the GNU General Public License v2

EAPI=7

KDE_HANDBOOK="forceoptional"
KDE_TEST="true"
FRAMEWORKS_MINIMAL=5.75.0
QT_MINIMAL=5.15.1
inherit kde5

DESCRIPTION="KDE library for CDDB"

LICENSE="GPL-2+ handbook? ( FDL-1.2 )"
SLOT="5"
KEYWORDS="*"
IUSE="musicbrainz"

DEPEND="
	$(add_qt_dep qtgui)
	$(add_qt_dep qtnetwork)
	$(add_qt_dep qtwidgets)
	$(add_frameworks_dep kconfig)
	$(add_frameworks_dep kconfigwidgets)
	$(add_frameworks_dep kcoreaddons)
	$(add_frameworks_dep ki18n)
	$(add_frameworks_dep kio)
	$(add_frameworks_dep kwidgetsaddons)
	musicbrainz? ( media-libs/musicbrainz:5 )
"
RDEPEND="${DEPEND}"

# tests require network access and compare static data with online data
# bug 280996
RESTRICT+=" test"

PATCHES=( "${FILESDIR}/${PN}-20.12.1-unused-dep.patch" )

src_prepare() {
	kde5_src_prepare
	use handbook || cd kcmcddb && cmake_comment_add_subdirectory doc
}

src_configure() {
	local mycmakeargs=(
		$(cmake-utils_use_find_package musicbrainz MusicBrainz5)
	)

	kde5_src_configure
}
