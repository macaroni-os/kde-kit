# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit cmake

DESCRIPTION="The terminal widget for QTerminal"
HOMEPAGE="https://lxqt-project.org"
SRC_URI="https://api.github.com/repos/lxqt/qtermwidget/tarball/2.3.0 -> qtermwidget-2.3.0-d6f891a.tar.gz"
LICENSE="BSD GPL-2 LGPL-2+"
SLOT="0"
KEYWORDS="*"
RDEPEND="dev-qt/qtbase:6[gui]
	
"
DEPEND="${RDEPEND}
	dev-util/lxqt-build-tools
	dev-qt/qttools:6[linguist]
	
"

post_src_unpack() {
	mv lxqt-qtermwidget-* ${S}
}



# vim: filetype=ebuild
