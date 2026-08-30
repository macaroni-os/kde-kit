# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit cmake

DESCRIPTION="libqtxdg user tools"
HOMEPAGE="https://lxqt-project.org"
SRC_URI="https://api.github.com/repos/lxqt/qtxdg-tools/tarball/4.4.0 -> qtxdg-tools-4.4.0-900e14a.tar.gz"
LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="*"
RDEPEND="dev-libs/libqtxdg
	dev-qt/qtbase:6
	
"
DEPEND="${RDEPEND}
	dev-util/lxqt-build-tools
	
"

post_src_unpack() {
	mv lxqt-qtxdg-tools-* ${S}
}



# vim: filetype=ebuild
