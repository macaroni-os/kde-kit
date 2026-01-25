# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit kde6 xdg

DESCRIPTION="Full-featured burning and ripping application based on KDE Frameworks"
HOMEPAGE="https://apps.kde.org/k3b/ https://userbase.kde.org/K3b"
SRC_URI="https://download.kde.org/stable/release-service/25.12.1/src/k3b-25.12.1.tar.xz -> k3b-25.12.1.tar.xz"
SLOT="6"
KEYWORDS="*"
IUSE="dvd ffmpeg flac lame mad musepack sndfile sox taglib vcd vorbis webengine"
RDEPEND="app-cdr/cdrdao
	app-cdr/cdrtools
	dev-libs/libburn
	media-sound/cdparanoia
	dvd? ( >=app-cdr/dvd+rw-tools-7 )
	sox? ( media-sound/sox )
	vcd? ( media-video/vcdimager )
	
"
DEPEND="${RDEPEND}
	dev-qt/qtbase:6[gui]
	kde-apps/libkcddb:6
	kde-frameworks/karchive:6
	kde-frameworks/kauth:6
	kde-frameworks/kbookmarks:6
	kde-frameworks/kcmutils:6
	kde-frameworks/kcompletion:6
	kde-frameworks/kconfig:6
	kde-frameworks/kconfigwidgets:6
	kde-frameworks/kcoreaddons:6
	kde-frameworks/kfilemetadata:6[taglib?]
	kde-frameworks/ki18n:6
	kde-frameworks/kiconthemes:6
	kde-frameworks/kio:6
	kde-frameworks/kjobwidgets:6
	kde-frameworks/knewstuff:6
	kde-frameworks/knotifications:6
	kde-frameworks/knotifyconfig:6
	kde-frameworks/kwidgetsaddons:6
	kde-frameworks/kxmlgui:6
	kde-frameworks/solid:6
	media-libs/libsamplerate
	dvd? ( media-libs/libdvdread:= )
	ffmpeg? ( >=media-video/ffmpeg-4.4.0:0= )
	flac? ( >=media-libs/flac-1.2:=[cxx] )
	lame? ( media-sound/lame )
	mad? ( media-libs/libmad )
	musepack? ( >=media-sound/musepack-tools-444 )
	sndfile? ( media-libs/libsndfile )
	taglib? ( >=media-libs/taglib-1.5:= )
	vorbis? (
	media-libs/libogg
	media-libs/libvorbis
	)
	webengine? ( dev-qt/qtwebengine:6 )
	
"
src_prepare() {
	  kde6_src_prepare
}


# vim: filetype=ebuild
