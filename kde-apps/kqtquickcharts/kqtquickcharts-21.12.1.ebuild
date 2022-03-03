# Distributed under the terms of the GNU General Public License v2

EAPI=7

QT_MINIMAL=5.15.2
inherit kde5

DESCRIPTION="Qt Quick plugin for beautiful and interactive charts"
LICENSE="GPL-2" # TODO: CHECK
SLOT="5"
KEYWORDS="*"
IUSE=""

DEPEND="
	$(add_qt_dep qtdeclarative)
	$(add_qt_dep qtgui)
"
RDEPEND="${DEPEND}"