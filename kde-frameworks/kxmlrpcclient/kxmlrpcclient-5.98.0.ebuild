# Distributed under the terms of the GNU General Public License v2

EAPI=7

KDE_TEST="true"
QT_MINIMAL=5.15.2
inherit kde5

DESCRIPTION="Framework providing client-side support for the XML-RPC protocol"
LICENSE="BSD-2"
KEYWORDS="*"
IUSE=""

DEPEND="
	$(add_qt_dep qtxml)
	$(add_frameworks_dep kcoreaddons)
	$(add_frameworks_dep ki18n)
	$(add_frameworks_dep kio)
"
RDEPEND="${DEPEND}"
