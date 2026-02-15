# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit cmake

DESCRIPTION="Library to deal with Apple Wallet pass files"
HOMEPAGE="https://apps.kde.org/kontact/"
SRC_URI="https://download.kde.org/stable/release-service/25.12.2/src/kpkpass-25.12.2.tar.xz -> kpkpass-25.12.2.tar.xz"
SLOT="6"
KEYWORDS="*"
RDEPEND="virtual/kde-seed[gui]
	kde-frameworks/karchive:6
	>=x11-misc/shared-mime-info-1.8
	
"
DEPEND="${RDEPEND}
"

# vim: filetype=ebuild
