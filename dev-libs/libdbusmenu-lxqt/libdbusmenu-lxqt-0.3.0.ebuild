# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit cmake

DESCRIPTION=""
HOMEPAGE="https://lxqt-project.org"
SRC_URI="https://api.github.com/repos/lxqt/libdbusmenu-lxqt/tarball/0.3.0 -> libdbusmenu-lxqt-0.3.0-ee669ce.tar.gz"
LICENSE="LGPL-2"
SLOT="0"
KEYWORDS="*"
RDEPEND="dev-qt/qtbase:6
	
"
DEPEND="${RDEPEND}
"

post_src_unpack() {
	mv lxqt-libdbusmenu-lxqt-* ${S}
}



# vim: filetype=ebuild
