# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit cmake

DESCRIPTION="Framework to let applications perform actions as a privileged user"
HOMEPAGE="https://invent.kde.org/frameworks/"
SRC_URI="https://download.kde.org/stable/frameworks/6.22/kauth-6.22.0.tar.xz -> kauth-6.22.0.tar.xz"
LICENSE="GPL-2"
SLOT="6"
KEYWORDS="*"
IUSE="+policykit"
BDEPEND="dev-qt/qttools:6[linguist]
	
"
RDEPEND="virtual/kde-seed[gui]
	kde-frameworks/kcoreaddons:6
	policykit? (
	    kde-frameworks/kwindowsystem:6[wayland]
	    >=sys-auth/polkit-qt-0.175.0[qt6(+)]
	)
	
"
DEPEND="${RDEPEND}
"
PDEPEND="policykit? ( kde-plasma/polkit-kde-agent:* )
	
"
src_prepare() {
	cmake_src_prepare
}
src_configure() {
	local mycmakeargs=(
	  $(cmake_use_find_package policykit PolkitQt6-1)
	)
	cmake_src_configure
}


# vim: filetype=ebuild
