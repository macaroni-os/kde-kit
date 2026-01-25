# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit kde6

DESCRIPTION="FFmpeg based thumbnail generator for video files"
HOMEPAGE="https://invent.kde.org/"
SRC_URI="https://download.kde.org/stable/release-service/25.12.1/src/ffmpegthumbs-25.12.1.tar.xz -> ffmpegthumbs-25.12.1.tar.xz"
SLOT="6"
KEYWORDS="*"
BDEPEND="kde-frameworks/kcoreaddons:6
	virtual/pkgconfig
	
"
RDEPEND="!<kde-apps/ffmpegthumbs-23.08.5-r1:5
	!kde-apps/ffmpegthumbs-common
	
"
DEPEND="${RDEPEND}
	dev-qt/qtbase:6[gui]
	kde-frameworks/kconfig:6
	kde-frameworks/kio:6
	media-video/ffmpeg:0=
	
"
src_prepare() {
	  kde6_src_prepare
}


# vim: filetype=ebuild
