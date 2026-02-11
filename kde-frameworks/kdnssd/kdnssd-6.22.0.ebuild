# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit cmake

DESCRIPTION="Framework for network service discovery using Zeroconf"
HOMEPAGE="https://invent.kde.org/frameworks/"
SRC_URI="https://download.kde.org/stable/frameworks/6.22/kdnssd-6.22.0.tar.xz -> kdnssd-6.22.0.tar.xz"
LICENSE="GPL-2"
SLOT="6"
KEYWORDS="*"
IUSE="zeroconf"
BDEPEND="dev-qt/qttools:6[linguist]
	
"
RDEPEND="virtual/kde-seed
	zeroconf? (
	    net-dns/avahi[mdnsresponder-compat]
	)
	
"
DEPEND="${RDEPEND}
"
src_configure() {
	local mycmakeargs=(
	  $(cmake_use_find_package zeroconf Avahi)
	)
	use zeroconf || mycmakeargs+=( -DCMAKE_DISABLE_FIND_PACKAGE_DNSSD=ON )
	cmake_src_configure
}


# vim: filetype=ebuild
