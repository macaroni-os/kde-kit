# Distributed under the terms of the GNU General Public License v2

EAPI=7

KDE_TEST="true"
FRAMEWORKS_MINIMAL=5.98.0
QT_MINIMAL=5.15.1
VIRTUALX_REQUIRED="test"
inherit kde5

DESCRIPTION="Library to deal with Apple Wallet pass files"
HOMEPAGE="https://apps.kde.org/en/kontact"
LICENSE="LGPL-2.1+"
SLOT="5"
KEYWORDS="*"
IUSE=""

DEPEND="
	$(add_qt_dep qtgui)
	$(add_frameworks_dep karchive)
"
RDEPEND="${DEPEND}"