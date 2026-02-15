# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit cmake xdg

DESCRIPTION="File archiver by KDE"
HOMEPAGE="https://apps.kde.org/ark/"
SRC_URI="https://download.kde.org/stable/release-service/25.12.2/src/ark-25.12.2.tar.xz -> ark-25.12.2.tar.xz"
SLOT="6"
KEYWORDS="*"
IUSE="zip"
BDEPEND="sys-devel/gettext
	
"
RDEPEND="virtual/kde-seed[gui]
	>=app-arch/libarchive-3.5.3:=[bzip2,lzma]
	kde-frameworks/kcompletion:6
	kde-frameworks/kconfig:6
	kde-frameworks/kconfigwidgets:6
	kde-frameworks/kcoreaddons:6
	kde-frameworks/kcrash:6
	kde-frameworks/kdbusaddons:6
	kde-frameworks/kfilemetadata:6
	kde-frameworks/ki18n:6
	kde-frameworks/kio:6
	kde-frameworks/kjobwidgets:6
	kde-frameworks/kparts:6
	kde-frameworks/kpty:6
	kde-frameworks/kservice:6
	kde-frameworks/kwidgetsaddons:6
	kde-frameworks/kwindowsystem:6
	kde-frameworks/kxmlgui:6
	kde-frameworks/kiconthemes:6
	sys-libs/zlib
	zip? ( >=dev-libs/libzip-1.6.0:= )
	
"
DEPEND="${RDEPEND}
"
src_prepare() {
	cmake_src_prepare
}
src_configure() {
	local mycmakeargs=(
	  $(cmake_use_find_package zip LibZip)
	)
	cmake_src_configure
}
pkg_postinst() {
	xdg_pkg_postinst
}


# vim: filetype=ebuild
