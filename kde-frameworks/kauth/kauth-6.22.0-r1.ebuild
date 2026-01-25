# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit kde6

DESCRIPTION="Framework to let applications perform actions as a privileged user"
HOMEPAGE="https://invent.kde.org/frameworks/"
SRC_URI="https://download.kde.org/stable/frameworks/6.22/kauth-6.22.0.tar.xz -> kauth-6.22.0.tar.xz"
SLOT="6"
KEYWORDS="*"
IUSE="+policykit"
BDEPEND="dev-qt/qttools:6[linguist]
	
"
RDEPEND="dev-qt/qtbase:6[gui]
	kde-frameworks/kcoreaddons:6
	policykit? (
	    dev-qt/qtbase:6
	    kde-frameworks/kwindowsystem:6[wayland]
	    >=sys-auth/polkit-qt-0.175.0[qt6(+)]
	)
	
"
DEPEND="${RDEPEND}
	test? ( dev-qt/qtbase:6 )
	
"
PDEPEND="policykit? ( kde-plasma/polkit-kde-agent:* )
	
"
CMAKE_SKIP_TESTS=(
	  # fails, bug 654842
	  KAuthHelperTest
	  # needs DBus, bug 938505
	  KAuthFdTest
)

src_prepare() {
	  kde6_src_prepare
}

src_configure() {
	  local mycmakeargs=(
	      $(cmake_use_find_package policykit PolkitQt6-1)
	  )
	   kde6_src_configure
}


# vim: filetype=ebuild
