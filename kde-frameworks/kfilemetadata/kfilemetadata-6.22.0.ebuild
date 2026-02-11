# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
PYTHON_COMPAT=( python3+ )
inherit cmake

DESCRIPTION="Library for extracting file metadata"
HOMEPAGE="https://invent.kde.org/frameworks/"
SRC_URI="https://download.kde.org/stable/frameworks/6.22/kfilemetadata-6.22.0.tar.xz -> kfilemetadata-6.22.0.tar.xz"
LICENSE="GPL-2"
SLOT="6"
KEYWORDS="*"
IUSE="epub exif ffmpeg mobi pdf taglib"
RDEPEND="virtual/kde-seed[gui]
	kde-frameworks/karchive:6
	kde-frameworks/kcodecs:6
	kde-frameworks/kcoreaddons:6
	kde-frameworks/ki18n:6
	epub? ( app-text/ebook-tools )
	exif? ( media-gfx/exiv2:= )
	ffmpeg? ( media-video/ffmpeg:= )
	mobi? ( kde-apps/kdegraphics-mobipocket:6 )
	pdf? ( app-text/poppler[qt6(-)] )
	taglib? ( media-libs/taglib:= )
	
"
DEPEND="${RDEPEND}
	sys-apps/attr
	
"
src_configure() {
	local mycmakeargs=(
	  -DENABLE_MOBIPOCKET_TEXT_EXTRACTION=OFF
	  $(cmake_use_find_package epub EPub)
	  $(cmake_use_find_package exif LibExiv2)
	  $(cmake_use_find_package ffmpeg FFmpeg)
	  $(cmake_use_find_package mobi QMobipocket6)
	  $(cmake_use_find_package pdf Poppler)
	  $(cmake_use_find_package taglib Taglib)
	)
	cmake_src_configure
}


# vim: filetype=ebuild
