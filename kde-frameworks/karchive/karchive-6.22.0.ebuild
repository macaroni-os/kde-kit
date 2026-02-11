# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit cmake

DESCRIPTION="Framework for reading, creation, and manipulation of various archive formats"
HOMEPAGE="https://invent.kde.org/frameworks/"
SRC_URI="https://download.kde.org/stable/frameworks/6.22/karchive-6.22.0.tar.xz -> karchive-6.22.0.tar.xz"
LICENSE="GPL-2"
SLOT="6"
KEYWORDS="*"
IUSE="crypt +zstd"
BDEPEND="dev-qt/qttools:6[linguist]
	zstd? ( virtual/pkgconfig )
	
"
RDEPEND="virtual/kde-seed
	app-arch/bzip2
	app-arch/xz-utils
	sys-libs/zlib
	crypt? ( dev-libs/openssl:= )
	zstd? ( app-arch/zstd:= )
	
"
DEPEND="${RDEPEND}
"
src_prepare() {
	cmake_src_prepare
	# TODO: try to get a build switch upstreamed
	if ! use zstd; then
	  sed -e "s/^pkg_check_modules.*LibZstd/#&/" -i CMakeLists.txt || die
	fi
}
src_configure() {
	local mycmakeargs=(
	  -DWITH_OPENSSL=$(usex crypt)
	  -DWITH_LIBZSTD=$(usex zstd)
	)
	cmake_src_configure
}


# vim: filetype=ebuild
