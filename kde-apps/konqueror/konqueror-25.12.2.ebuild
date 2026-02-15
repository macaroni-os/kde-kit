# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit cmake

DESCRIPTION="Web browser and file manager based on KDE Frameworks"
HOMEPAGE="https://apps.kde.org/konqueror/"
SRC_URI="https://download.kde.org/stable/release-service/25.12.2/src/konqueror-25.12.2.tar.xz -> konqueror-25.12.2.tar.xz"
SLOT="6"
KEYWORDS="*"
IUSE="activities speech"
DEPEND="${RDEPEND}
"

# vim: filetype=ebuild
