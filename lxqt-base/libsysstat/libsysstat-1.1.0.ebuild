# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit cmake

DESCRIPTION="Library used to query system info and statistics"
HOMEPAGE="https://lxqt-project.org"
SRC_URI="https://api.github.com/repos/lxqt/libsysstat/tarball/1.1.0 -> libsysstat-1.1.0-3d3431d.tar.gz"
LICENSE="GPL-2+ LGPL-2.1+"
SLOT="0"
KEYWORDS="*"
RDEPEND="dev-qt/qtbase:6
	
"
DEPEND="${RDEPEND}
	dev-util/lxqt-build-tools
	
"

post_src_unpack() {
	mv lxqt-libsysstat-* ${S}
}



# vim: filetype=ebuild
