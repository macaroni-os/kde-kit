# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit cmake

DESCRIPTION="Various packaging tools and scripts for LXQt applications"
HOMEPAGE="https://lxqt-project.org"
SRC_URI="https://api.github.com/repos/lxqt/lxqt-build-tools/tarball/2.3.0 -> lxqt-build-tools-2.3.0-1708c06.tar.gz"
LICENSE="BSD"
SLOT="0"
KEYWORDS="*"
RDEPEND="dev-libs/glib:2
	dev-qt/qtbase:6
	
"
DEPEND="${RDEPEND}
"

post_src_unpack() {
	mv lxqt-lxqt-build-tools-* ${S}
}



# vim: filetype=ebuild
