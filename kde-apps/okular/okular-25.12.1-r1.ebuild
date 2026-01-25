# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit kde6 xdg

DESCRIPTION="Universal document viewer based on KDE Frameworks"
HOMEPAGE="https://okular.kde.org https://apps.kde.org/okular/"
SRC_URI="https://download.kde.org/stable/release-service/25.12.1/src/okular-25.12.1.tar.xz -> okular-25.12.1.tar.xz"
SLOT="6"
KEYWORDS="*"
IUSE="crypt djvu epub markdown mobi +pdf phonon +postscript qml share speech +tiff"
RDEPEND="kde-frameworks/kimageformats:6
	qml? ( kde-frameworks/kirigami:6 )
	
"
DEPEND="${RDEPEND}
	dev-qt/qtbase:6=[gui,X]
	dev-qt/qtdeclarative:6
	dev-qt/qtsvg:6
	kde-apps/libkexiv2:6
	kde-frameworks/karchive:6
	kde-frameworks/kbookmarks:6
	kde-frameworks/kcolorscheme:6
	kde-frameworks/kcompletion:6
	kde-frameworks/kconfig:6
	kde-frameworks/kconfigwidgets:6
	kde-frameworks/kcoreaddons:6
	kde-frameworks/kcrash:6
	kde-frameworks/ki18n:6
	kde-frameworks/kiconthemes:6
	kde-frameworks/kio:6
	kde-frameworks/kitemviews:6
	kde-frameworks/kparts:6
	kde-frameworks/kpty:6
	kde-frameworks/ktextwidgets:6
	kde-frameworks/kwidgetsaddons:6
	kde-frameworks/kwindowsystem:6[X]
	kde-frameworks/kxmlgui:6
	kde-frameworks/threadweaver:6
	kde-plasma/plasma-activities:6
	media-libs/freetype
	sys-libs/zlib
	crypt? ( kde-frameworks/kwallet:6 )
	djvu? ( app-text/djvu )
	epub? ( app-text/ebook-tools )
	markdown? ( >=app-text/discount-2.2.7-r1:= )
	mobi? ( kde-apps/kdegraphics-mobipocket:6 )
	pdf? ( >=app-text/poppler-24.10.0[nss,qt6] )
	phonon? ( >=media-libs/phonon-4.12.0[qt6(+)] )
	postscript? ( app-text/libspectre )
	share? ( kde-frameworks/purpose:6 )
	speech? ( dev-qt/qtspeech:6 )
	tiff? ( media-libs/tiff:= )
	
"
src_prepare() {
	  kde6_src_prepare
}

src_configure() {
	  local mycmakeargs=(
	      -DFORCE_NOT_REQUIRED_DEPENDENCIES="KF6DocTools;KF6Wallet;DjVuLibre;EPub;Discount;QMobipocket6;Poppler;LibSpectre;KF6Purpose;Qt6TextToSpeech;TIFF;KExiv2Qt6;"
	      -DOKULAR_UI=$(usex qml "both" "desktop")
	      $(cmake_use_find_package crypt KF6Wallet)
	      $(cmake_use_find_package djvu DjVuLibre)
	      $(cmake_use_find_package epub EPub)
	      $(cmake_use_find_package markdown Discount)
	      $(cmake_use_find_package mobi QMobipocket6)
	      $(cmake_use_find_package pdf Poppler)
	      $(cmake_use_find_package phonon Phonon4Qt6)
	      $(cmake_use_find_package postscript LibSpectre)
	      $(cmake_use_find_package share KF6Purpose)
	      $(cmake_use_find_package speech Qt6TextToSpeech)
	      $(cmake_use_find_package tiff TIFF)
	  )
	  kde6_src_configure
}


# vim: filetype=ebuild
