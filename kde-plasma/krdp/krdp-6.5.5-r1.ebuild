# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit kde6

DESCRIPTION="Library and examples for creating an RDP server"
HOMEPAGE="https://invent.kde.org/plasma/"
SRC_URI="https://download.kde.org/stable/plasma/6.5.5/krdp-6.5.5.tar.xz -> krdp-6.5.5.tar.xz"
SLOT="6"
KEYWORDS="*"
RDEPEND="dev-qt/qtbase:6
	dev-qt/qtwayland:6
	kde-frameworks/kcoreaddons:6
	kde-plasma/kpipewire:6
	dev-libs/wayland
	media-libs/libglvnd[X]
	net-misc/freerdp:3=
	
"
DEPEND="${RDEPEND}
	
"
src_prepare() {
	  kde6_src_prepare
}


# vim: filetype=ebuild
