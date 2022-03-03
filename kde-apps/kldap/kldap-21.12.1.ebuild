# Distributed under the terms of the GNU General Public License v2

EAPI=7

KDE_HANDBOOK="optional"
KDE_TEST="true"
FRAMEWORKS_MINIMAL=5.75.0
QT_MINIMAL=5.15.2
inherit kde5

DESCRIPTION="Library for interacting with LDAP servers"
HOMEPAGE="https://api.kde.org/kdepim/kldap/html/index.html"
LICENSE="GPL-2+"
SLOT="5"
KEYWORDS="*"
IUSE=""

DEPEND="
	dev-libs/cyrus-sasl
	dev-libs/qtkeychain:=
	$(add_qt_dep qtgui)
	$(add_qt_dep qtwidgets)
	$(add_frameworks_dep ki18n)
	$(add_frameworks_dep kio)
	$(add_frameworks_dep kwallet)
	$(add_frameworks_dep kwidgetsaddons)
	net-nds/openldap
"
RDEPEND="${DEPEND}"