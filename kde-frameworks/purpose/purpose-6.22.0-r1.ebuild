# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit cmake xdg-utils

DESCRIPTION="Library for providing abstractions to get the developer's purposes fulfilled"
HOMEPAGE="https://invent.kde.org/frameworks/"
SRC_URI="https://download.kde.org/stable/frameworks/6.22/purpose-6.22.0.tar.xz -> purpose-6.22.0.tar.xz"
LICENSE="GPL-2"
SLOT="6"
KEYWORDS="*"
IUSE="bluetooth kaccounts"
# Commons depends
CDEPEND="virtual/kde-seed[gui,declarative]
	kde-frameworks/kconfig:6
	kde-frameworks/kcoreaddons:6
	kde-frameworks/ki18n:6
	kde-frameworks/kio:6
	kde-frameworks/kirigami:6
	kde-frameworks/knotifications:6
	kde-frameworks/kservice:6
	kde-frameworks/prison:6[qml]
	
"
RDEPEND="${CDEPEND}
	kde-frameworks/kdeclarative:6
	bluetooth? ( dev-qt/qtconnectivity:6 )
	kaccounts? (
	    kde-apps/kaccounts-integration:6
	    net-libs/accounts-qt:=
	)
	
"
DEPEND="${CDEPEND}
"
src_configure() {
	local mycmakeargs=(
	  $(cmake_use_find_package bluetooth Qt6Bluetooth)
	  $(cmake_use_find_package kaccounts KAccounts6)
	)
	cmake_src_configure
}


# vim: filetype=ebuild
