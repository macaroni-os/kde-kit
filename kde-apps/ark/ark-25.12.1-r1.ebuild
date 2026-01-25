# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit kde6 optfeature xdg

DESCRIPTION="File archiver by KDE"
HOMEPAGE="https://apps.kde.org/ark/"
SRC_URI="https://download.kde.org/stable/release-service/25.12.1/src/ark-25.12.1.tar.xz -> ark-25.12.1.tar.xz"
SLOT="6"
KEYWORDS="*"
IUSE="test zip"
BDEPEND="sys-devel/gettext
	elibc_glibc? ( test? ( amd64? ( app-arch/rar ) x86? ( app-arch/rar ) ) )
	
"
RDEPEND=">=app-arch/libarchive-3.5.3:=[bzip2,lzma]
	dev-qt/qtbase:6[gui]
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
	sys-libs/zlib
	zip? ( >=dev-libs/libzip-1.6.0:= )
	
"
DEPEND="${RDEPEND}
	kde-frameworks/kiconthemes:6
	dev-qt/qtbase:6
	test? ( >=dev-libs/libzip-1.6.0:= )
	
"
src_prepare() {
	  kde6_src_prepare
}

src_configure() {
	  local mycmakeargs=(
	      $(cmake_use_find_package zip LibZip)
	  )
	   kde6_src_configure
}

src_test() {
	  local myctestargs=(
	      # bug 822177: kerfuffle-addtoarchivetest: may segfault or hang indefinitely
	      # bug 827840: plugins-clirartest: continuously broken with translations installed
	      -E "(kerfuffle-addtoarchivetest|plugins-clirartest)"
	  )
	   kde6_src_test
}

pkg_postinst() {
	  if [[ -z "${REPLACING_VERSIONS}" ]]; then
	      optfeature "rar archive creation/extraction" "app-arch/rar"
	      optfeature "rar archive extraction only" "app-arch/unar" "app-arch/unrar"
	      optfeature "7-Zip archive support" ">=app-arch/7zip-24.09[symlink(+)]" "app-arch/p7zip"
	      optfeature "lrz archive support" "app-arch/lrzip"
	      optfeature "Markdown support in text previews" "kde-misc/markdownpart:${SLOT}"
	  fi
	  xdg_pkg_postinst
}


# vim: filetype=ebuild
