# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit cmake

DESCRIPTION="FFmpeg based thumbnail generator for video files"
HOMEPAGE="https://invent.kde.org/"
SRC_URI="https://download.kde.org/stable/release-service/25.12.2/src/ffmpegthumbs-25.12.2.tar.xz -> ffmpegthumbs-25.12.2.tar.xz"
SLOT="6"
KEYWORDS="*"
BDEPEND="virtual/pkgconfig
	
"
RDEPEND="virtual/kde-seed[gui]
	kde-frameworks/kconfig:6
	kde-frameworks/kio:6
	kde-frameworks/kcoreaddons:6
	media-video/ffmpeg:=
	
"
DEPEND="${RDEPEND}
"

# vim: filetype=ebuild
