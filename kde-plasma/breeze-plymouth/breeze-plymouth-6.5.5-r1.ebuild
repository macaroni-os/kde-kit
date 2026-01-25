# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit kde6

DESCRIPTION="Breeze theme for Plymouth"
HOMEPAGE="https://invent.kde.org/plasma/"
SRC_URI="https://download.kde.org/stable/plasma/6.5.5/breeze-plymouth-6.5.5.tar.xz -> breeze-plymouth-6.5.5.tar.xz"
SLOT="6"
KEYWORDS="*"
RDEPEND="sys-boot/plymouth
	
"
DEPEND="${RDEPEND}
	
"
src_prepare() {
	  kde6_src_prepare
}

src_configure() {
	  local mycmakeargs=(
	      -DDISTRO_NAME="Macaroni Linux"
	      -DDISTRO_VERSION=
	  )
	  kde6_src_configure
}


# vim: filetype=ebuild
