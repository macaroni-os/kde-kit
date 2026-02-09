# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit cmake

DESCRIPTION="KIO worker for accessing audio CDs"
HOMEPAGE="https://invent.kde.org/"
SRC_URI="https://download.kde.org/stable/release-service/25.12.2/src/audiocd-kio-25.12.2.tar.xz -> audiocd-kio-25.12.2.tar.xz"
SLOT="6"
KEYWORDS="*"
IUSE="flac vorbis"
RDEPEND="virtual/kde-seed[gui]
	kde-apps/libkcddb:6=
	kde-apps/libkcompactdisc:6=
	kde-frameworks/kcmutils:6
	kde-frameworks/kconfig:6
	kde-frameworks/kconfigwidgets:6
	kde-frameworks/kcoreaddons:6
	kde-frameworks/ki18n:6
	kde-frameworks/kio:6
	media-sound/cdparanoia
	flac? ( >=media-libs/flac-1.1.2:= )
	vorbis? (
	    media-libs/libogg
	    media-libs/libvorbis
	)
	
"
DEPEND="${RDEPEND}
"
src_configure() {
	local mycmakeargs=(
	  $(cmake_use_find_package flac FLAC)
	  $(cmake_use_find_package vorbis OggVorbis)
	)
	cmake_src_configure
}


# vim: filetype=ebuild
