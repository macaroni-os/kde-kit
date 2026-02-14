# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit cmake

DESCRIPTION="Library for accessing MBox format mail storages"
HOMEPAGE="https://invent.kde.org/"
SRC_URI="https://download.kde.org/stable/release-service/25.12.2/src/kmbox-25.12.2.tar.xz -> kmbox-25.12.2.tar.xz"
SLOT="6"
KEYWORDS="*"
RDEPEND="kde-apps/kmime:6=
	
"
DEPEND="${RDEPEND}
"

# vim: filetype=ebuild
