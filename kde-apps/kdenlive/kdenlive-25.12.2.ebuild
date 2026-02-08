# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit kde6 xdg

DESCRIPTION="Non-linear video editing suite by KDE"
HOMEPAGE="https://kdenlive.org/en/"
SRC_URI="https://download.kde.org/stable/release-service/25.12.2/src/kdenlive-25.12.2.tar.xz -> kdenlive-25.12.2.tar.xz"
SLOT="6"
KEYWORDS="*"
IUSE="gles2-only semantic-desktop v4l"
RESTRICT="test"
BDEPEND="sys-devel/gettext
	
"
RDEPEND="kde-frameworks/qqc2-desktop-style:6
	media-video/ffmpeg[encode(+),libass,sdl,X]
	media-video/mediainfo
	
"
DEPEND="${RDEPEND}
	dev-qt/qtbase:6[gles2-only=,gui]
	dev-qt/qtdeclarative:6[widgets]
	dev-qt/qtmultimedia:6
	dev-qt/qtnetworkauth:6
	dev-qt/qtsvg:6
	kde-frameworks/karchive:6
	kde-frameworks/kbookmarks:6
	kde-frameworks/kcodecs:6
	kde-frameworks/kcompletion:6
	kde-frameworks/kconfig:6
	kde-frameworks/kconfigwidgets:6
	kde-frameworks/kcoreaddons:6
	kde-frameworks/kcrash:6
	kde-frameworks/kdbusaddons:6
	kde-frameworks/kfilemetadata:6
	kde-frameworks/kguiaddons:6
	kde-frameworks/ki18n:6
	kde-frameworks/kiconthemes:6
	kde-frameworks/kio:6
	kde-frameworks/kitemviews:6
	kde-frameworks/kjobwidgets:6
	kde-frameworks/knewstuff:6
	kde-frameworks/knotifications:6
	kde-frameworks/knotifyconfig:6
	kde-frameworks/kservice:6
	kde-frameworks/ktextwidgets:6
	kde-frameworks/kwidgetsaddons:6
	kde-frameworks/kxmlgui:6
	kde-frameworks/purpose:6
	kde-frameworks/solid:6
	>=media-libs/mlt-7.28.0[ffmpeg,frei0r,qt6,sdl,xml]
	media-libs/opentimelineio:=
	v4l? ( media-libs/libv4l )
	
"
src_prepare() {
	  kde6_src_prepare
}


# vim: filetype=ebuild
