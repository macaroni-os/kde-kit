# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit cmake

DESCRIPTION="Themes, graphics and icons for LXQt"
HOMEPAGE="https://lxqt-project.org"
SRC_URI="https://api.github.com/repos/lxqt/lxqt-themes/tarball/2.3.0 -> lxqt-themes-2.3.0-470a495.tar.gz"
LICENSE="LGPL-2.1+"
SLOT="0"
KEYWORDS="*"
DEPEND="${RDEPEND}
	dev-util/lxqt-build-tools
	
"

post_src_unpack() {
	mv lxqt-lxqt-themes-* ${S}
}



# vim: filetype=ebuild
