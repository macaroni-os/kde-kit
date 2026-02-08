# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit kde6

DESCRIPTION="Library for interacting with LDAP servers"
HOMEPAGE="https://api.kde.org/kdepim/kldap/html/index.html"
SRC_URI="https://download.kde.org/stable/release-service/25.12.2/src/kldap-25.12.2.tar.xz -> kldap-25.12.2.tar.xz"
SLOT="6"
KEYWORDS="*"
RDEPEND="dev-libs/cyrus-sasl
	>=dev-libs/qtkeychain-0.14.2:=[qt6(+)]
	dev-qt/qtbase:6[gui]
	kde-frameworks/ki18n:6
	kde-frameworks/kio:6
	kde-frameworks/kwidgetsaddons:6
	net-nds/openldap:=
	
"
DEPEND="${RDEPEND}
	
"
src_prepare() {
	  kde6_src_prepare
}


# vim: filetype=ebuild
