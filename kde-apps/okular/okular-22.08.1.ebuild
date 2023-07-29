# Distributed under the terms of the GNU General Public License v2

EAPI=7

KDE_HANDBOOK="forceoptional"
KDE_TEST="forceoptional"
FRAMEWORKS_MINIMAL=5.98.0
QT_MINIMAL=5.15.1
VIRTUALX_REQUIRED="test"
inherit kde5

DESCRIPTION="Universal document viewer based on KDE Frameworks"
HOMEPAGE="https://okular.kde.org https://apps.kde.org/en/okular"
LICENSE="GPL-2" # TODO: CHECK
SLOT="5"
KEYWORDS="*"
IUSE="chm djvu epub +image-backend markdown mobi +pdf +plucker +postscript qml share speech +tiff"

DEPEND="
	$(add_qt_dep qtdbus)
	$(add_qt_dep qtgui)
	$(add_qt_dep qtprintsupport)
	$(add_qt_dep qtsvg)
	$(add_qt_dep qtwidgets)
	$(add_frameworks_dep kactivities)
	$(add_frameworks_dep karchive)
	$(add_frameworks_dep kbookmarks)
	$(add_frameworks_dep kcompletion)
	$(add_frameworks_dep kconfig)
	$(add_frameworks_dep kconfigwidgets)
	$(add_frameworks_dep kcoreaddons)
	$(add_frameworks_dep kcrash)
	$(add_frameworks_dep ki18n)
	$(add_frameworks_dep kio)
	$(add_frameworks_dep kjs)
	$(add_frameworks_dep kparts)
	$(add_frameworks_dep kpty)
	$(add_frameworks_dep ktextwidgets)
	$(add_frameworks_dep kwallet)
	$(add_frameworks_dep threadweaver)
	media-libs/freetype
	>=media-libs/phonon-4.11.0
	sys-libs/zlib
	chm? (
		dev-libs/chmlib
		dev-libs/libzip:=
		$(add_frameworks_dep khtml)
	)
	djvu? ( app-text/djvu )
	epub? ( app-text/ebook-tools )
	image-backend? (
		$(add_qt_dep qtgui gif,jpeg,png)
		$(add_kdeapps_dep libkexiv2)
	)
	markdown? ( app-text/discount )
	mobi? ( $(add_kdeapps_dep kdegraphics-mobipocket) )
	pdf? ( app-text/poppler[qt5] )
	plucker? ( virtual/jpeg:0 )
	postscript? ( app-text/libspectre )
	share? ( $(add_frameworks_dep purpose) )
	speech? ( $(add_qt_dep qtspeech) )
	tiff? ( media-libs/tiff:0 )
"
RDEPEND="${DEPEND}
	image-backend? ( $(add_frameworks_dep kimageformats) )
	qml? (
		$(add_qt_dep qtquickcontrols2)
		$(add_frameworks_dep kirigami)
	)
"

PATCHES=(
	"${FILESDIR}/${PN}-21.11.80-tests.patch" # bug 734138
	"${FILESDIR}/${PN}-20.08.2-hide-mobile-app.patch" # avoid same-name entry
)

src_prepare() {
	kde5_src_prepare

	sed -i -e 's/set(CMAKE_CXX_STANDARD 14)/set(CMAKE_CXX_STANDARD 17)/g' CMakeLists.txt || die
}

src_configure() {
	local mycmakeargs=(
		-DOKULAR_UI=$(usex qml "both" "desktop")
		$(cmake-utils_use_find_package chm CHM)
		$(cmake-utils_use_find_package chm KF5KHtml)
		$(cmake-utils_use_find_package chm LibZip)
		$(cmake-utils_use_find_package djvu DjVuLibre)
		$(cmake-utils_use_find_package epub EPub)
		$(cmake-utils_use_find_package image-backend KF5KExiv2)
		$(cmake-utils_use_find_package markdown Discount)
		$(cmake-utils_use_find_package mobi QMobipocket)
		$(cmake-utils_use_find_package pdf Poppler)
		$(cmake-utils_use_find_package plucker JPEG)
		$(cmake-utils_use_find_package postscript LibSpectre)
		$(cmake-utils_use_find_package share KF5Purpose)
		$(cmake-utils_use_find_package speech Qt5TextToSpeech)
		$(cmake-utils_use_find_package tiff TIFF)
	)
	kde5_src_configure
}

src_test() {
	# mainshelltest hangs, chmgeneratortest fails, bug #603116
	# parttest hangs, bug #641728, annotationtoolbartest fails, KDE-Bug #429640
	local myctestargs=(
		-E "(mainshelltest|chmgeneratortest|parttest|annotationtoolbartest)"
	)

	kde5_src_test
}
