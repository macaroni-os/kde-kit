# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit cmake

DESCRIPTION="Qt process viewer and manager"
HOMEPAGE="https://lxqt-project.org"
SRC_URI="https://api.github.com/repos/lxqt/qps/tarball/2.12.0 -> qps-2.12.0-aafedf2.tar.gz"
LICENSE="GPL-2 GPL-2+ LGPL-2.1+ QPL-1.0"
SLOT="0"
KEYWORDS="*"
RDEPEND="dev-qt/qtbase:6[gui]
	lxqt-base/liblxqt
	
"
DEPEND="${RDEPEND}
	dev-util/lxqt-build-tools
	dev-qt/qttools:6[linguist]
	
"

post_src_unpack() {
	mv lxqt-qps-* ${S}
}



# vim: filetype=ebuild
