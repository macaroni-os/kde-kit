# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit cmake

DESCRIPTION="Qt GUI for System Statistics"
HOMEPAGE="https://lxqt.github.io/"
SRC_URI="https://api.github.com/repos/lxqt/libsysstat/tarball/0.4.6 -> libsysstat-0.4.6.tar.gz"
LICENSE="GPL-2+ LGPL-2.1+"
SLOT="0"
KEYWORDS="*"
BDEPEND="dev-util/lxqt-build-tools
"
RDEPEND="dev-qt/qtcore:5
	
"
DEPEND="${RDEPEND}
"

post_src_unpack() {
	mv lxqt-libsysstat-* ${S}
}



# vim: filetype=ebuild
