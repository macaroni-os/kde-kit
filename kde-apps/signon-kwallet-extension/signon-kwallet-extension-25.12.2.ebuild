# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit kde6

DESCRIPTION="KWallet extension for signond"
HOMEPAGE="https://accounts-sso.gitlab.io/"
SRC_URI="https://download.kde.org/stable/release-service/25.12.2/src/signon-kwallet-extension-25.12.2.tar.xz -> signon-kwallet-extension-25.12.2.tar.xz"
SLOT="6"
KEYWORDS="*"
RDEPEND="kde-frameworks/kwallet:6
	>=net-libs/signond-8.61-r100[qt6(+)]
	
"
DEPEND="${RDEPEND}
	
"
src_prepare() {
	  kde6_src_prepare
}


# vim: filetype=ebuild
