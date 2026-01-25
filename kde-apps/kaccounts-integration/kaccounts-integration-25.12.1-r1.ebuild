# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit kde6

DESCRIPTION="Administer web accounts for the sites and services across the Plasma desktop"
HOMEPAGE="https://community.kde.org/KTp"
SRC_URI="https://download.kde.org/stable/release-service/25.12.1/src/kaccounts-integration-25.12.1.tar.xz -> kaccounts-integration-25.12.1.tar.xz"
SLOT="6"
KEYWORDS="*"
RESTRICT="test"
BDEPEND="sys-devel/gettext
	
"
RDEPEND="kde-apps/signon-kwallet-extension:6
	
"
DEPEND="${RDEPEND}
	dev-qt/qtbase:6[gui]
	dev-qt/qtdeclarative:6
	kde-frameworks/kconfig:6
	kde-frameworks/kcoreaddons:6
	kde-frameworks/kdbusaddons:6
	kde-frameworks/ki18n:6
	kde-frameworks/kio:6
	kde-frameworks/kwallet:6
	>=net-libs/accounts-qt-1.17-r2
	>=net-libs/signond-8.61-r102
	
"
src_prepare() {
	  kde6_src_prepare
}


# vim: filetype=ebuild
