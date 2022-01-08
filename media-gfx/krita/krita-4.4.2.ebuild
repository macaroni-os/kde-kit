# Distributed under the terms of the GNU General Public License v2

EAPI=7

KDE_TEST="forceoptional"
PYTHON_COMPAT=( python3+ )
FRAMEWORKS_MINIMAL=5.74.0
QT_MINIMAL=5.15.1
VIRTUALX_REQUIRED="test"
inherit kde5 python-single-r1

DESCRIPTION="Free digital painting application. Digital Painting, Creative Freedom!"
HOMEPAGE="https://apps.kde.org/en/krita https://krita.org/en/"
SRC_URI="mirror://kde/stable/${PN}/${PV}/${P}.tar.xz
	https://dev.gentoo.org/~asturm/distfiles/${PN}-4.2.9-patchset.tar.xz"

LICENSE="GPL-3"
SLOT="5"
KEYWORDS="*"
IUSE="color-management fftw gif +gsl heif +jpeg openexr pdf qtmedia +raw tiff vc"
REQUIRED_USE="${PYTHON_REQUIRED_USE}"

BDEPEND="
	dev-cpp/eigen:3
	dev-lang/perl
	sys-devel/gettext
"
RDEPEND="${PYTHON_DEPS}
	dev-libs/boost:=
	dev-libs/quazip
	$(python_gen_cond_dep '
		dev-python/PyQt5[${PYTHON_MULTI_USEDEP}]
		dev-python/sip[${PYTHON_MULTI_USEDEP}]
	')
	$(add_qt_dep qtconcurrent)
	$(add_qt_dep qtdbus)
	$(add_qt_dep qtdeclarative)
	$(add_qt_dep qtgui)=[-gles2-only]
	$(add_qt_dep qtnetwork)
	$(add_qt_dep qtprintsupport)
	$(add_qt_dep qtsvg)
	$(add_qt_dep qtwidgets)
	$(add_qt_dep qtx11extras)
	$(add_qt_dep qtxml)
	$(add_frameworks_dep kcompletion)
	$(add_frameworks_dep kconfig)
	$(add_frameworks_dep kcoreaddons)
	$(add_frameworks_dep kcrash)
	$(add_frameworks_dep kguiaddons)
	$(add_frameworks_dep ki18n)
	$(add_frameworks_dep kiconthemes)
	$(add_frameworks_dep kitemmodels)
	$(add_frameworks_dep kitemviews)
	$(add_frameworks_dep kwidgetsaddons)
	$(add_frameworks_dep kwindowsystem)
	$(add_frameworks_dep kxmlgui)
	media-gfx/exiv2:=
	media-libs/lcms
	media-libs/libpng:0=
	sys-libs/zlib
	virtual/opengl
	x11-libs/libX11
	x11-libs/libXi
	color-management? ( media-libs/opencolorio )
	fftw? ( sci-libs/fftw:3.0= )
	gif? ( media-libs/giflib )
	gsl? ( sci-libs/gsl:= )
	jpeg? ( virtual/jpeg:0 )
	heif? ( media-libs/libheif:= )
	openexr? (
		|| (
			media-libs/ilmbase:=
			media-libs/imath:=
		)
		media-libs/openexr
	)
	pdf? ( app-text/poppler[qt5] )
	qtmedia? ( $(add_qt_dep qtmultimedia) )
	raw? ( media-libs/libraw:= )
	tiff? ( media-libs/tiff:0 )
"
DEPEND="${RDEPEND}
	vc? ( >=dev-libs/vc-1.1.0 )
"

# bug 630508
RESTRICT+=" test"

PATCHES=(
	"${FILESDIR}"/${PN}-4.3.1-tests-optional.patch
	"${WORKDIR}"/${PN}-4.2.9-patchset/${PN}-4.2.9-ecm-findopenexr.patch
)

pkg_setup() {
	python-single-r1_pkg_setup
	kde5_pkg_setup
}

src_prepare() {
	kde5_src_prepare
	sed -e "/CMAKE_CXX_STANDARD/s/11/14/" -i CMakeLists.txt || die
}

src_configure() {
	# Prevent sandbox violation from FindPyQt5.py module
	# See Gentoo-bug 655918
	addpredict /dev/dri

	local mycmakeargs=(
		-DCMAKE_DISABLE_FIND_PACKAGE_KSeExpr=ON # not packaged
		$(cmake-utils_use_find_package color-management OCIO)
		$(cmake-utils_use_find_package fftw FFTW3)
		$(cmake-utils_use_find_package gif GIF)
		$(cmake-utils_use_find_package gsl GSL)
		$(cmake-utils_use_find_package heif HEIF)
		$(cmake-utils_use_find_package jpeg JPEG)
		$(cmake-utils_use_find_package openexr OpenEXR)
		$(cmake-utils_use_find_package pdf Poppler)
		$(cmake-utils_use_find_package qtmedia Qt5Multimedia)
		$(cmake-utils_use_find_package raw LibRaw)
		$(cmake-utils_use_find_package tiff TIFF)
		$(cmake-utils_use_find_package vc Vc)
	)

	kde5_src_configure
}
