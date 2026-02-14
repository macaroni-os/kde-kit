# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit cmake

DESCRIPTION="Sound editor built on KDE Frameworks that can edit many types of audio files"
HOMEPAGE="https://apps.kde.org/kwave/"
SRC_URI="https://download.kde.org/stable/release-service/25.12.2/src/kwave-25.12.2.tar.xz -> kwave-25.12.2.tar.xz"
SLOT="6"
KEYWORDS="*"
IUSE="alsa flac mp3 opus oss pulseaudio +multimedia vorbis"
BDEPEND="sys-devel/gettext
	
"
RDEPEND="virtual/kde-seed[gui,multimedia?]
	kde-frameworks/kcompletion:6
	kde-frameworks/kconfig:6
	kde-frameworks/kconfigwidgets:6
	kde-frameworks/kcoreaddons:6
	kde-frameworks/kcrash:6
	kde-frameworks/kdbusaddons:6
	kde-frameworks/ki18n:6
	kde-frameworks/kiconthemes:6
	kde-frameworks/kio:6
	kde-frameworks/ktextwidgets:6
	kde-frameworks/kwidgetsaddons:6
	kde-frameworks/kxmlgui:6
	media-libs/audiofile:=
	sci-libs/fftw-3:=
	media-libs/libsamplerate
	alsa? ( media-libs/alsa-lib )
	flac? ( media-libs/flac:=[cxx] )
	mp3? (
	  media-libs/id3lib
	  media-libs/libmad
	|| (
	  media-sound/lame
	  media-sound/toolame
	  media-sound/twolame
	)
	)
	opus? (
	  media-libs/libogg
	  media-libs/opus
	)
	pulseaudio? ( media-libs/libpulse )
	vorbis? (
	  media-libs/libogg
	  media-libs/libvorbis
	)
	
"
DEPEND="${RDEPEND}
"

# vim: filetype=ebuild
