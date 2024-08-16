# Distributed under the terms of the GNU General Public License v2

EAPI=7

KDE_TEST="true"
QT_MINIMAL=5.15.1
VIRTUALX_REQUIRED="test"
inherit kde5

DESCRIPTION="Library for interfacing with calendars"
LICENSE="GPL-2+ test? ( LGPL-3+ )"
KEYWORDS="*"
IUSE=""

BDEPEND="
	sys-devel/bison
"
DEPEND="
	>=dev-libs/libical-3.0.5:=
	$(add_qt_dep qtgui)
"
RDEPEND="${DEPEND}
	!kde-apps/kcalcore:5
"

RESTRICT+=" test" # multiple tests fail or hang indefinitely