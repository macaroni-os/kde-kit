# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
PYTHON_COMPAT=( python3+ )
inherit kde6 python-single-r1

DESCRIPTION="Free digital painting application. Digital Painting, Creative Freedom!"
HOMEPAGE="https://apps.kde.org/krita/ https://krita.org/en/"
SRC_URI="https://download.kde.org/stable//krita/6.0.3/krita-6.0.3.tar.xz -> krita-6.0.3.tar.xz"
LICENSE="GPL-3"
SLOT="0"
KEYWORDS="*"
IUSE="color-management debug fftw gif +gsl heif jpeg2k jpegxl media +mypaint-brush-engine openexr pdf +raw wayland webp"
REQUIRED_USE="${PYTHON_REQUIRED_USE}"
BDEPEND="dev-lang/perl
	sys-devel/gettext
	
"
RDEPEND="${PYTHON_DEPS}
	dev-cpp/eigen:3
	>=dev-cpp/xsimd-13.0.0
	dev-libs/boost:=
	dev-libs/libunibreak:=
	>=dev-libs/quazip-1.3:0=[qt6(+)]
	$(python_gen_cond_dep '
	  dev-python/PyQt6[${PYTHON_USEDEP}]
	  dev-python/sip:=[${PYTHON_USEDEP}]
	')
	dev-qt/qt5compat:6
	dev-qt/qtbase:6=[gui,sql,wayland?,X]
	dev-qt/qtdeclarative:6
	dev-qt/qtsvg:6
	kde-frameworks/kcolorscheme:6
	kde-frameworks/kcompletion:6
	kde-frameworks/kconfig:6
	kde-frameworks/kcoreaddons:6
	kde-frameworks/kcrash:6
	kde-frameworks/kguiaddons:6
	kde-frameworks/ki18n:6
	kde-frameworks/kiconthemes:6
	kde-frameworks/kitemviews:6
	kde-frameworks/kwidgetsaddons:6
	kde-frameworks/kxmlgui:6
	media-gfx/exiv2:=
	media-libs/fontconfig
	media-libs/freetype
	media-libs/harfbuzz:=
	media-libs/lcms
	media-libs/libjpeg-turbo:=
	media-libs/libpng:=
	media-libs/tiff:=
	sys-libs/zlib
	virtual/opengl
	x11-libs/libX11
	x11-libs/libXi
	color-management? ( >=media-libs/opencolorio-2.0.0 )
	fftw? ( sci-libs/fftw:3.0= )
	gif? ( media-libs/giflib )
	gsl? ( sci-libs/gsl:= )
	heif? ( >=media-libs/libheif-1.11:=[x265] )
	jpeg2k? ( >=media-libs/openjpeg-2.3.0:= )
	jpegxl? ( >=media-libs/libjxl-0.7.0:= )
	media? (
	  media-libs/mlt:=
	  media-libs/libsdl2
	)
	mypaint-brush-engine? ( >=media-libs/libmypaint-1.4.0:= )
	openexr? ( media-libs/openexr:= )
	pdf? ( app-text/poppler[qt6(-)] )
	raw? ( kde-apps/libkdcraw:6 )
	webp? ( >=media-libs/libwebp-1.2.0:= )
	!media-gfx/krita:5
	
"
DEPEND="${RDEPEND}
	dev-libs/immer
	dev-libs/lager
	dev-libs/zug
	
"
pkg_setup() {
	python-single-r1_pkg_setup
	kde6_pkg_setup
}

src_prepare() {
	# only used for the macOS/Windows
	rm -r packaging || die

	kde6_src_prepare
}

src_configure() {
	addpredict /dev/dri

	local mycmakeargs=(
		-DBUILD_WITH_QT6=ON
		-DALLOW_UNSTABLE=QT6
		-DBUILD_TESTING=OFF
		-DENABLE_UPDATERS=OFF
		-DKRITA_ENABLE_PCH=OFF
		-DCMAKE_DISABLE_FIND_PACKAGE_KSeExpr=ON

		$(cmake_use_find_package color-management OpenColorIO)
		$(cmake_use_find_package fftw FFTW3)
		$(cmake_use_find_package gif GIF)
		$(cmake_use_find_package gsl GSL)
		$(cmake_use_find_package heif HEIF)
		$(cmake_use_find_package jpeg2k OpenJPEG)
		$(cmake_use_find_package jpegxl JPEGXL)
		$(cmake_use_find_package media Mlt7)
		$(cmake_use_find_package mypaint-brush-engine LibMyPaint)
		$(cmake_use_find_package openexr OpenEXR)
		$(cmake_use_find_package pdf Poppler)
		$(cmake_use_find_package raw KDcrawQt6)
		$(cmake_use_find_package wayland Qt6WaylandClient)
		$(cmake_use_find_package webp WebP)
	)

	kde6_src_configure
}

src_install() {
	python_optimize "${ED}/usr/$(get_libdir)/krita-python-libs"

	kde6_src_install
}


# vim: filetype=ebuild
