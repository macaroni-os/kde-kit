# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit kde6

DESCRIPTION="Library to deal with Apple Wallet pass files"
HOMEPAGE="https://apps.kde.org/kontact/"
SRC_URI="https://download.kde.org/stable/release-service/25.12.1/src/kpkpass-25.12.1.tar.xz -> kpkpass-25.12.1.tar.xz"
SLOT="6"
KEYWORDS="*"
RDEPEND="dev-qt/qtbase:6[gui]
	kde-frameworks/karchive:6
	>=x11-misc/shared-mime-info-1.8
	
"
DEPEND="${RDEPEND}
	
"
src_prepare() {
	  kde6_src_prepare
}


# vim: filetype=ebuild
