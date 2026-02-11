# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit cmake

DESCRIPTION="Dedicated search application built on top of Baloo"
HOMEPAGE="https://invent.kde.org/plasma/"
SRC_URI="https://download.kde.org/stable/plasma/6.5.5/milou-6.5.5.tar.xz -> milou-6.5.5.tar.xz"
SLOT="6"
KEYWORDS="*"
RDEPEND="virtual/kde-seed[gui,declarative]
	kde-frameworks/kcoreaddons:6
	kde-frameworks/ki18n:6
	kde-frameworks/kservice:6
	kde-frameworks/krunner:6
	kde-plasma/libplasma:6
	
"
DEPEND="${RDEPEND}
"

# vim: filetype=ebuild
