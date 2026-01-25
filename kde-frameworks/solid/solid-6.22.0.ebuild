# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit kde6 optfeature

DESCRIPTION="Provider for platform independent hardware discovery, abstraction and management"
HOMEPAGE="https://invent.kde.org/frameworks/"
SRC_URI="https://download.kde.org/stable/frameworks/6.22/solid-6.22.0.tar.xz -> solid-6.22.0.tar.xz"
SLOT="6"
KEYWORDS="*"
IUSE="ios"
BDEPEND="sys-devel/bison
	sys-devel/flex
	dev-qt/qttools:6[linguist]
	
"
RDEPEND="dev-qt/qtbase:6[gui]
	dev-qt/qtdeclarative:6
	sys-apps/util-linux
	sys-fs/udisks:2
	virtual/libudev:=
	ios? (
	    app-pda/libimobiledevice:=
	    app-pda/libplist:=
	)
	
"
DEPEND="${RDEPEND}
	test? ( dev-qt/qtbase:6 )
	
"
src_prepare() {
	  kde6_src_prepare
}

src_configure() {
	  local mycmakeargs=(
	      $(cmake_use_find_package ios IMobileDevice)
	      $(cmake_use_find_package ios PList)
	  )
	  kde6_src_configure
}

pkg_postinst() {
	  if [[ -z "${REPLACING_VERSIONS}" ]]; then
	      optfeature "media player devices support" app-misc/media-player-info
	  fi
}


# vim: filetype=ebuild
