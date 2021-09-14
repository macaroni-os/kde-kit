# Distributed under the terms of the GNU General Public License v2

EAPI=7

KDE_QTHELP="false"
QT_MINIMAL=5.15.1
VIRTUALX_REQUIRED="test"
inherit kde5

DESCRIPTION="Framework providing additional format plugins for Qt's image I/O system"
LICENSE="LGPL-2+"
KEYWORDS="*"
IUSE="avif eps openexr"

DEPEND="
	$(add_qt_dep qtgui)
	$(add_frameworks_dep karchive)
	avif? ( >=media-libs/libavif-0.8.2 )
	eps? ( $(add_qt_dep qtprintsupport) )
	openexr? (
		media-libs/ilmbase:=
		media-libs/openexr:=
	)
"
RDEPEND="${DEPEND}"

DOCS=( src/imageformats/AUTHORS )

src_configure() {
	local mycmakeargs=(
		$(cmake-utils_use_find_package avif libavif)
		$(cmake-utils_use_find_package eps Qt5PrintSupport)
		$(cmake-utils_use_find_package openexr OpenEXR)
	)

	kde5_src_configure
}