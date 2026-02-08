# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit kde6 xdg

DESCRIPTION="KDE accounts providers"
HOMEPAGE="https://community.kde.org/KTp"
SRC_URI="https://download.kde.org/stable/release-service/25.12.2/src/kaccounts-providers-25.12.2.tar.xz -> kaccounts-providers-25.12.2.tar.xz"
SLOT="6"
KEYWORDS="*"
RDEPEND=">=net-libs/signon-oauth2-0.25_p20210102[qt6(+)]
	>=net-libs/signon-ui-0.15_p20231016
	
"
DEPEND="${RDEPEND}
	dev-qt/qtbase:6[gui]
	dev-qt/qtdeclarative:6
	dev-qt/qtwebengine:6[qml]
	kde-apps/kaccounts-integration:6
	kde-frameworks/kcoreaddons:6
	kde-frameworks/ki18n:6
	kde-frameworks/kio:6
	kde-frameworks/kpackage:6
	
"
src_prepare() {
	  kde6_src_prepare
}


# vim: filetype=ebuild
