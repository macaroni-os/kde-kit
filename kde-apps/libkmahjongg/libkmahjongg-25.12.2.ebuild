# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit cmake

DESCRIPTION="Mahjongg library based on Qt/KDE Frameworks"
HOMEPAGE="https://invent.kde.org/"
SRC_URI="https://download.kde.org/stable/release-service/25.12.2/src/libkmahjongg-25.12.2.tar.xz -> libkmahjongg-25.12.2.tar.xz"
SLOT="6"
KEYWORDS="*"
BDEPEND="app-arch/gzip
	
"
RDEPEND="virtual/kde-seed[gui,svg]
	kde-frameworks/kconfig:6
	kde-frameworks/kconfigwidgets:6
	kde-frameworks/ki18n:6
	kde-frameworks/kwidgetsaddons:6
	
"
DEPEND="${RDEPEND}
"

# vim: filetype=ebuild
