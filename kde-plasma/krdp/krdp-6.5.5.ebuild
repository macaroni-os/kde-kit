# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit cmake

DESCRIPTION="Library and examples for creating an RDP server"
HOMEPAGE="https://invent.kde.org/plasma/"
SRC_URI="https://download.kde.org/stable/plasma/6.5.5/krdp-6.5.5.tar.xz -> krdp-6.5.5.tar.xz"
SLOT="6"
KEYWORDS="*"
IUSE="wayland"
RDEPEND="virtual/kde-seed[wayland?]
	kde-frameworks/kcoreaddons:6
	kde-plasma/kpipewire:6
	media-libs/libglvnd[X]
	net-misc/freerdp:3=
	
"
DEPEND="${RDEPEND}
"

# vim: filetype=ebuild
