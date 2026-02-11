# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit cmake

DESCRIPTION="Breeze theme for Plymouth"
HOMEPAGE="https://invent.kde.org/plasma/"
SRC_URI="https://download.kde.org/stable/plasma/6.5.5/breeze-plymouth-6.5.5.tar.xz -> breeze-plymouth-6.5.5.tar.xz"
SLOT="6"
KEYWORDS="*"
RDEPEND="sys-boot/plymouth
	
"
DEPEND="${RDEPEND}
"
src_configure() {
	local mycmakeargs=(
	  -DDISTRO_NAME="MacaroniOS Linux"
	  -DDISTRO_VERSION=
	)
	cmake_src_configure
}


# vim: filetype=ebuild
