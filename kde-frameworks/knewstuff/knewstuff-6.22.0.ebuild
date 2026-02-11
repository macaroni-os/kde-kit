# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit cmake

DESCRIPTION="Framework for downloading and sharing additional application data"
HOMEPAGE="https://invent.kde.org/frameworks/"
SRC_URI="https://download.kde.org/stable/frameworks/6.22/knewstuff-6.22.0.tar.xz -> knewstuff-6.22.0.tar.xz"
LICENSE="GPL-2"
SLOT="6"
KEYWORDS="*"
IUSE="opds"
RDEPEND="virtual/kde-seed[gui,declarative]
	kde-frameworks/kcmutils:6
	kde-frameworks/kirigami:6
	kde-frameworks/attica:6
	kde-frameworks/karchive:6
	kde-frameworks/kconfig:6
	kde-frameworks/kcoreaddons:6
	kde-frameworks/ki18n:6
	kde-frameworks/kpackage:6
	kde-frameworks/kwidgetsaddons:6
	opds? ( kde-frameworks/syndication:6 )
	
"
DEPEND="${RDEPEND}
"
src_configure() {
	local mycmakeargs=(
	  $(cmake_use_find_package opds KF6Syndication)
	)
	cmake_src_configure
}


# vim: filetype=ebuild
