# Distributed under the terms of the GNU General Public License v2

EAPI=7

FRAMEWORKS_MINIMAL=5.60.0
QT_MINIMAL=5.12.3
inherit kde5 toolchain-funcs

MY_P=${PN}-${PV/_/-}

DESCRIPTION="Digital photo management application"
HOMEPAGE="https://www.digikam.org/"
SRC_URI="mirror://kde/stable/${PN}/${PV}/${MY_P}.tar.xz"

LICENSE="GPL-2"
SLOT="5"
KEYWORDS="*"
IUSE="addressbook calendar gphoto2 heif +imagemagick +lensfun marble mediaplayer mysql opengl openmp +panorama scanner semantic-desktop X"

BDEPEND="
	>=dev-util/cmake-3.14.3
	sys-devel/gettext
	panorama? (
		sys-devel/bison
		sys-devel/flex
	)
"
COMMON_DEPEND="
	dev-libs/expat
	$(add_qt_dep qtconcurrent)
	$(add_qt_dep qtdbus)
	$(add_qt_dep qtgui -gles2-only)
	$(add_qt_dep qtnetwork)
	$(add_qt_dep qtprintsupport)
	$(add_qt_dep qtsql 'mysql?')
	$(add_qt_dep qtwebengine widgets)
	$(add_qt_dep qtwidgets)
	$(add_qt_dep qtxml)
	$(add_qt_dep qtxmlpatterns)
	$(add_frameworks_dep kconfig)
	$(add_frameworks_dep kconfigwidgets)
	$(add_frameworks_dep kcoreaddons)
	$(add_frameworks_dep ki18n)
	$(add_frameworks_dep kiconthemes)
	$(add_frameworks_dep kio)
	$(add_frameworks_dep knotifications)
	$(add_frameworks_dep knotifyconfig)
	$(add_frameworks_dep kservice)
	$(add_frameworks_dep kwidgetsaddons)
	$(add_frameworks_dep kwindowsystem)
	$(add_frameworks_dep kxmlgui)
	$(add_frameworks_dep solid)
	>=media-gfx/exiv2-0.27:=
	media-libs/lcms:2
	media-libs/liblqr
	media-libs/libpng:0=
	>=media-libs/opencv-3.3.0:=[contrib,contribdnn]
	media-libs/tiff:0
	virtual/jpeg:0
	addressbook? (
		$(add_kdeapps_dep akonadi-contacts)
		$(add_frameworks_dep kcontacts)
	)
	calendar? ( $(add_frameworks_dep kcalendarcore) )
	gphoto2? ( media-libs/libgphoto2:= )
	heif? ( media-libs/x265:= )
	imagemagick? ( media-gfx/imagemagick:= )
	lensfun? ( media-libs/lensfun )
	marble? (
		$(add_qt_dep qtconcurrent)
		$(add_kdeapps_dep marble)
		$(add_frameworks_dep kbookmarks)
	)
	mediaplayer? (
		media-libs/qtav[opengl(+)]
		media-video/ffmpeg:=
	)
	opengl? (
		$(add_qt_dep qtopengl)
		virtual/opengl
	)
	panorama? ( $(add_frameworks_dep threadweaver) )
	scanner? ( $(add_kdeapps_dep libksane) )
	semantic-desktop? ( $(add_frameworks_dep kfilemetadata) )
	X? (
		$(add_qt_dep qtx11extras)
		x11-libs/libX11
	)
"
DEPEND="${COMMON_DEPEND}
	dev-cpp/eigen:3
	dev-libs/boost[threads]
"
RDEPEND="${COMMON_DEPEND}
	mysql? ( virtual/mysql[server(+)] )
	panorama? ( media-gfx/hugin )
"

RESTRICT+=" test"
# bug 366505

S="${WORKDIR}/${MY_P}"

pkg_pretend() {
	[[ ${MERGE_TYPE} != binary ]] && use openmp && tc-check-openmp
	kde5_pkg_pretend
}

pkg_setup() {
	[[ ${MERGE_TYPE} != binary ]] && use openmp && tc-check-openmp
	kde5_pkg_setup
}

# FIXME: Unbundle libraw (libs/rawengine/libraw)
src_configure() {
	local mycmakeargs=(
		-DBUILD_TESTING=OFF # bug 698192
		-DENABLE_APPSTYLES=ON
		-DCMAKE_DISABLE_FIND_PACKAGE_Jasper=ON
		-DENABLE_QWEBENGINE=ON
		-DENABLE_AKONADICONTACTSUPPORT=$(usex addressbook)
		$(cmake-utils_use_find_package calendar KF5CalendarCore)
		$(cmake-utils_use_find_package gphoto2 Gphoto2)
		$(cmake-utils_use_find_package heif X265)
		$(cmake-utils_use_find_package imagemagick ImageMagick)
		$(cmake-utils_use_find_package lensfun LensFun)
		$(cmake-utils_use_find_package marble Marble)
		-DENABLE_MEDIAPLAYER=$(usex mediaplayer)
		$(cmake-utils_use_find_package mediaplayer QtAV)
		-DENABLE_MYSQLSUPPORT=$(usex mysql)
		-DENABLE_INTERNALMYSQL=$(usex mysql)
		$(cmake-utils_use_find_package opengl OpenGL)
		$(cmake-utils_use_find_package panorama KF5ThreadWeaver)
		$(cmake-utils_use_find_package scanner KF5Sane)
		$(cmake-utils_use_find_package semantic-desktop KF5FileMetaData)
		$(cmake-utils_use_find_package X X11)
	)

	kde5_src_configure
}
