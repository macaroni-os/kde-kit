# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit cmake

DESCRIPTION="KDE utility to translate DocBook XML files using gettext po files"
HOMEPAGE="https://invent.kde.org/"
SRC_URI="https://download.kde.org/stable/release-service/25.12.2/src/poxml-25.12.2.tar.xz -> poxml-25.12.2.tar.xz"
SLOT="6"
KEYWORDS="*"
BDEPEND="sys-devel/gettext
	
"
RDEPEND="virtua/kde-seed
	
"
DEPEND="${RDEPEND}
"

# vim: filetype=ebuild
