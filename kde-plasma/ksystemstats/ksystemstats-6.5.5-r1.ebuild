# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit kde6 xdg

DESCRIPTION="Plugin based system monitoring daemon"
HOMEPAGE="https://invent.kde.org/plasma/"
SRC_URI="https://download.kde.org/stable/plasma/6.5.5/ksystemstats-6.5.5.tar.xz -> ksystemstats-6.5.5.tar.xz"
SLOT="6"
KEYWORDS="*"
IUSE="networkmanager"
RDEPEND="dev-qt/qtbase:6
	dev-qt/qtdeclarative:6
	kde-frameworks/kauth:6
	kde-frameworks/kcoreaddons:6
	kde-frameworks/kcrash:6
	kde-frameworks/kdbusaddons:6
	kde-frameworks/ki18n:6
	kde-frameworks/kio:6
	kde-frameworks/kservice:6
	kde-frameworks/solid:6
	kde-plasma/libksysguard:6
	sys-libs/libcap
	virtual/libudev:=
	networkmanager? ( kde-frameworks/networkmanager-qt:6 )
	
"
DEPEND="${RDEPEND}
	
"
src_prepare() {
	  kde6_src_prepare
}

src_configure() {
	  local mycmakeargs=(
	      $(cmake_use_find_package networkmanager KF6NetworkManagerQt)
	  )
	  kde6_src_configure
}


# vim: filetype=ebuild
