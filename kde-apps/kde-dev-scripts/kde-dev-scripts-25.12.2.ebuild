# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit cmake

DESCRIPTION="KDE Development Scripts"
HOMEPAGE="https://invent.kde.org/"
SRC_URI="https://download.kde.org/stable/release-service/25.12.2/src/kde-dev-scripts-25.12.2.tar.xz -> kde-dev-scripts-25.12.2.tar.xz"
SLOT="6"
KEYWORDS="*"
RDEPEND="app-arch/advancecomp
	dev-perl/XML-DOM
	media-gfx/optipng
	
"
DEPEND="${RDEPEND}
"

# vim: filetype=ebuild
