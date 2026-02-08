# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit kde6 xdg

DESCRIPTION="Image viewer by KDE"
HOMEPAGE="https://apps.kde.org/gwenview/ https://userbase.kde.org/Gwenview"
SRC_URI="https://download.kde.org/stable/release-service/25.12.2/src/gwenview-25.12.2.tar.xz -> gwenview-25.12.2.tar.xz"
SLOT="6"
KEYWORDS="*"
IUSE="activities fits +mpris raw semantic-desktop share X"
RESTRICT="test"
BDEPEND="dev-qt/qtbase:6[wayland]
	dev-util/wayland-scanner
	
"
RDEPEND="dev-qt/qtimageformats:6
	kde-frameworks/kimageformats:6
	
"
DEPEND="${RDEPEND}
	dev-libs/wayland
	dev-qt/qtbase:6=[wayland]
	dev-qt/qtmultimedia:6
	dev-qt/qtsvg:6
	kde-frameworks/kcompletion:6
	kde-frameworks/kconfig:6
	kde-frameworks/kconfigwidgets:6
	kde-frameworks/kcoreaddons:6
	kde-frameworks/kcrash:6
	kde-frameworks/kguiaddons:6
	kde-frameworks/ki18n:6
	kde-frameworks/kiconthemes:6
	kde-frameworks/kio:6
	kde-frameworks/kitemmodels:6
	kde-frameworks/kitemviews:6
	kde-frameworks/kjobwidgets:6
	kde-frameworks/knotifications:6
	kde-frameworks/kparts:6
	kde-frameworks/kservice:6
	kde-frameworks/kwidgetsaddons:6
	kde-frameworks/kxmlgui:6
	kde-frameworks/solid:6
	media-gfx/exiv2:=
	>=media-libs/kcolorpicker-0.3.1
	>=media-libs/kimageannotator-0.7.1
	media-libs/lcms:2
	media-libs/libjpeg-turbo:=
	media-libs/libpng:0=
	media-libs/tiff:=
	activities? ( kde-plasma/plasma-activities:6 )
	fits? ( sci-libs/cfitsio )
	mpris? ( dev-qt/qtbase:6 )
	raw? ( kde-apps/libkdcraw:6 )
	semantic-desktop? (
	kde-frameworks/baloo:6
	kde-frameworks/kfilemetadata:6
	)
	share? ( kde-frameworks/purpose:6 )
	X? (
	dev-qt/qtbase:6=[X]
	x11-libs/libX11
	)
	
"
src_prepare() {
	  kde6_src_prepare
}


# vim: filetype=ebuild
