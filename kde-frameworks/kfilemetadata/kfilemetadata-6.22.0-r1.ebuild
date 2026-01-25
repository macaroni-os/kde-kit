# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
PYTHON_COMPAT=( python3+ )
inherit kde6 optfeature python-any-r1

DESCRIPTION="Library for extracting file metadata"
HOMEPAGE="https://invent.kde.org/frameworks/"
SRC_URI="https://download.kde.org/stable/frameworks/6.22/kfilemetadata-6.22.0.tar.xz -> kfilemetadata-6.22.0.tar.xz"
SLOT="6"
KEYWORDS="*"
IUSE="epub exif ffmpeg mobi pdf taglib"
BDEPEND="test? ( ${PYTHON_DEPS} )
	
"
RDEPEND="dev-qt/qtbase:6[gui]
	kde-frameworks/karchive:6
	kde-frameworks/kcodecs:6
	kde-frameworks/kcoreaddons:6
	kde-frameworks/ki18n:6
	epub? ( app-text/ebook-tools )
	exif? ( media-gfx/exiv2:= )
	ffmpeg? ( media-video/ffmpeg:0= )
	mobi? ( kde-apps/kdegraphics-mobipocket:6 )
	pdf? ( app-text/poppler[qt6(-)] )
	taglib? ( media-libs/taglib:= )
	
"
DEPEND="${RDEPEND}
	kernel_linux? ( sys-apps/attr )
	
"
CMAKE_SKIP_TESTS=(
	  # FIXME: bug 644650, fails on tmpfs (but not for everyone)
	  usermetadatawritertest
)

pkg_setup() {
	  use test && python-any-r1_pkg_setup
}

src_configure() {
	  local mycmakeargs=(
	      $(cmake_use_find_package epub EPub)
	      $(cmake_use_find_package exif LibExiv2)
	      $(cmake_use_find_package ffmpeg FFmpeg)
	      $(cmake_use_find_package mobi QMobipocket6)
	      -DENABLE_MOBIPOCKET_TEXT_EXTRACTION=OFF
	      $(cmake_use_find_package pdf Poppler)
	      $(cmake_use_find_package taglib Taglib)
	  )
	   kde6_src_configure
}

pkg_postinst() {
	  if [[ -z "${REPLACING_VERSIONS}" ]]; then
	      optfeature "Microsoft Word/Powerpoint file indexing" app-text/catdoc
	      optfeature "Microsoft Excel file indexing" dev-libs/libxls
	  fi
}


# vim: filetype=ebuild
