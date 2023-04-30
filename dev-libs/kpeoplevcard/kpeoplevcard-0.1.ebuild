# Distributed under the terms of the GNU General Public License v2

EAPI=7

FRAMEWORKS_MINIMAL=5.64.0
QT_MINIMAL=5.12.3
inherit kde5

DESCRIPTION="Library to expose vcards to KPeople"
HOMEPAGE="https://invent.kde.org/pim/kpeoplevcard"
SRC_URI="mirror://kde/stable/${PN}/${PV}/${P}.tar.xz"

LICENSE="LGPL-2.1+"
SLOT="5"
KEYWORDS="*"

DEPEND="
	$(add_qt_dep qtgui)
	$(add_qt_dep qtwidgets)
	$(add_frameworks_dep kcontacts)
	$(add_frameworks_dep kcoreaddons)
	$(add_frameworks_dep kpeople)
"
RDEPEND="${DEPEND}"
