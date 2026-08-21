# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit cmake

DESCRIPTION="BitTorrent library based on KDE Frameworks"
HOMEPAGE="https://apps.kde.org/en/ktorrent https://userbase.kde.org/KTorrent"
SRC_URI="https://download.kde.org/Attic//release-service/25.12.2/src/libktorrent-25.12.2.tar.xz -> libktorrent-25.12.2.tar.xz"
LICENSE="GPL-2+"
SLOT="6"
KEYWORDS="*"
IUSE="xfs"
BDEPEND="sys-devel/gettext
	
"
RDEPEND="app-crypt/qca:2
	dev-libs/gmp:=
	dev-libs/openssl:=
	dev-libs/libgcrypt:=
	dev-qt/qtbase:6
	kde-frameworks/karchive:6
	kde-frameworks/kconfig:6
	kde-frameworks/kcoreaddons:6
	kde-frameworks/kcrash:6
	kde-frameworks/ki18n:6
	kde-frameworks/kio:6
	kde-frameworks/solid:6
	xfs? ( sys-fs/xfsprogs )
	
"
DEPEND="${RDEPEND}
	dev-libs/boost
	
"
src_prepare() {
	cmake_src_prepare
	sed -i -e "/^find_package/ s/\"\${LibGMP_MIN_VERSION}\" //" \
		CMakeLists.txt || die
	sed -i -e "/^find_dependency/ s/ \"@LibGMP_MIN_VERSION@\"//" \
		KTorrent6Config.cmake.in || die
}
src_configure() {
	local mycmakeargs=(
		-DUSE_CRYPTO_BACKEND=OpenSSL
		-DWITH_XFS=$(usex xfs)
	)
	cmake_src_configure
}


# vim: filetype=ebuild
