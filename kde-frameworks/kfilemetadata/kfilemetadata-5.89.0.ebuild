# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3+ )
QT_MINIMAL=5.15.2
inherit eutils kde5 python-any-r1

DESCRIPTION="Library for extracting file metadata"
LICENSE="LGPL-2+"
KEYWORDS="*"
IUSE="epub exif ffmpeg kernel_linux office pdf taglib"

BDEPEND="
	test? ( ${PYTHON_DEPS} )
"
RDEPEND="
	$(add_qt_dep qtxml)
	$(add_frameworks_dep kcoreaddons)
	$(add_frameworks_dep ki18n)
	epub? ( app-text/ebook-tools )
	exif? ( media-gfx/exiv2:= )
	ffmpeg? ( media-video/ffmpeg:0= )
	office? ( $(add_frameworks_dep karchive) )
	pdf? ( app-text/poppler[qt5] )
	taglib? ( media-libs/taglib )
"
DEPEND="${RDEPEND}
	kernel_linux? ( sys-apps/attr )
"

RESTRICT+=" test"

pkg_setup() {
	use test && python-any-r1_pkg_setup
	kde5_pkg_setup
}

src_configure() {
	local mycmakeargs=(
		$(cmake-utils_use_find_package epub EPub)
		$(cmake-utils_use_find_package exif LibExiv2)
		$(cmake-utils_use_find_package ffmpeg FFmpeg)
		$(cmake-utils_use_find_package office KF5Archive)
		$(cmake-utils_use_find_package pdf Poppler)
		$(cmake-utils_use_find_package taglib Taglib)
	)

	kde5_src_configure
}

src_test() {
	# FIXME: bug 644650, fails on tmpfs (but not for everyone)
	local myctestargs=( -E "(usermetadatawritertest)" )
	kde5_src_test
}

pkg_postinst() {
	if [[ -z "${REPLACING_VERSIONS}" ]]; then
		elog "Optional dependencies:"
		optfeature "Microsoft Word/Powerpoint file indexing" app-text/catdoc
		optfeature "Microsoft Excel file indexing" dev-libs/libxls
	fi
	kde5_pkg_postinst
}