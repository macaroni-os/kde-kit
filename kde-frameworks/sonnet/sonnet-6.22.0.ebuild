# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit cmake

DESCRIPTION="Framework for providing spell-checking through abstraction of popular backends"
HOMEPAGE="https://invent.kde.org/frameworks/"
SRC_URI="https://download.kde.org/stable/frameworks/6.22/sonnet-6.22.0.tar.xz -> sonnet-6.22.0.tar.xz"
LICENSE="GPL-2"
SLOT="6"
KEYWORDS="*"
IUSE="aspell +hunspell qml"
BDEPEND="dev-qt/qttools:6[linguist]
	
"
RDEPEND="virtual/kde-seed[gui]
	aspell? ( app-text/aspell )
	hunspell? ( app-text/hunspell:= )
	qml? ( dev-qt/qtdeclarative:6 )
	
"
DEPEND="${RDEPEND}
"
src_configure() {
	local mycmakeargs=(
	  $(cmake_use_find_package aspell ASPELL)
	  $(cmake_use_find_package hunspell HUNSPELL)
	  -DSONNET_USE_QML=$(usex qml)
	)
	if ! use aspell && ! use hunspell; then
	  mycmakeargs+=( -DSONNET_NO_BACKENDS=ON )
	fi
	cmake_src_configure
}


# vim: filetype=ebuild
