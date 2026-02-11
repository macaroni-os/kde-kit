# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit cmake

DESCRIPTION="Plasma integration for controlling Thunderbolt devices"
HOMEPAGE="https://invent.kde.org/plasma/plasma-thunderbolt"
SRC_URI="https://download.kde.org/stable/plasma/6.5.5/plasma-thunderbolt-6.5.5.tar.xz -> plasma-thunderbolt-6.5.5.tar.xz"
LICENSE="|| ( GPL-2 GPL-3+ )"
SLOT="6"
KEYWORDS="~amd64 ~loong ~riscv ~x86"
BDEPEND="kde-frameworks/kcmutils:6
	
"
RDEPEND="virtual/kde-seed[gui,declarative]
	kde-frameworks/kirigami:6
	kde-frameworks/kcoreaddons:6
	kde-frameworks/kdbusaddons:6
	kde-frameworks/ki18n:6
	kde-frameworks/knotifications:6
	kde-frameworks/kservice:6
	sys-apps/bolt
	
"
DEPEND="${RDEPEND}
"

# vim: filetype=ebuild
