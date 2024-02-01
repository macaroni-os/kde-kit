# Distributed under the terms of the GNU General Public License v2

EAPI=7

ECM_QTHELP=true
ECM_TEST=true
KFMIN=5.106.0
QTMIN=5.15.2
inherit kde5

DESCRIPTION="Visual end user components for Kirigami-based applications"
HOMEPAGE="https://invent.kde.org/libraries/kirigami-addons"
SRC_URI="mirror://kde/stable/${PN}/${P}.tar.xz"
KEYWORDS="*"

LICENSE="|| ( GPL-2 GPL-3 LGPL-3 ) LGPL-2.1+"
SLOT="5"
IUSE=""

RESTRICT="test"

COMMON_DEPEND="
	$(add_qt_dep qtdeclarative)
	$(add_qt_dep qtgui)
	$(add_qt_dep qtquickcontrols2)
	$(add_frameworks_dep ki18n)
	$(add_frameworks_dep kirigami)
"
RDEPEND="${COMMON_DEPEND}
	$(add_qt_dep qtgraphicaleffects)
	$(add_frameworks_dep plasma)
	$(add_frameworks_dep qqc2-desktop-style)
"
DEPEND="${COMMON_DEPEND}"
