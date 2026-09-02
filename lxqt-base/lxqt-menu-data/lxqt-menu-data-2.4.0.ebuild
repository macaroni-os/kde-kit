# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit cmake

DESCRIPTION="Menu files for LXQt Panel, Configuration Center and PCManFM-Qt/libfm-qt"
HOMEPAGE="https://lxqt-project.org"
SRC_URI="https://api.github.com/repos/lxqt/lxqt-menu-data/tarball/2.4.0 -> lxqt-menu-data-2.4.0-5045c6b.tar.gz"
LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="*"
DEPEND="${RDEPEND}
	dev-util/lxqt-build-tools
	dev-qt/qttools:6[linguist]
	
"

post_src_unpack() {
	mv lxqt-lxqt-menu-data-* ${S}
}



# vim: filetype=ebuild
