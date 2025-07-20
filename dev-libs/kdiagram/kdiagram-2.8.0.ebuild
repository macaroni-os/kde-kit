# Distributed under the terms of the GNU General Public License v2

EAPI=7

KDE_EXAMPLES="true"
KDE_QTHELP="true"
KDE_TEST="true"
QT_MINIMAL=5.15.1
VIRTUALX_REQUIRED="test"
inherit kde5

DESCRIPTION="Powerful libraries (KChart, KGantt) for creating business diagrams"
HOMEPAGE="https://api.kde.org/kdiagram/index.html
https://www.kdab.com/development-resources/qt-tools/kd-chart/"
SRC_URI="mirror://kde/stable/${PN}/${PV}/${P}.tar.xz"

LICENSE="GPL-2" # TODO CHECK
SLOT="5"
KEYWORDS="*"

REQUIRED_USE="test? ( examples )"

BDEPEND="
	$(add_qt_dep linguist-tools)
"
DEPEND="
	$(add_qt_dep qtgui)
	$(add_qt_dep qtprintsupport)
	$(add_qt_dep qtsvg)
	$(add_qt_dep qtwidgets)
"
RDEPEND="${DEPEND}"
