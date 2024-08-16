# Distributed under the terms of the GNU General Public License v2

EAPI=7

FRAMEWORKS_MINIMAL=5.98.0
QT_MINIMAL=5.15.2
inherit kde5
SRC_URI="mirror://kde/stable/release-service/${PV}/src/${P}.tar.xz"
DESCRIPTION="Tool to check contrast for colors to verify they are correctly accessible"
HOMEPAGE="https://apps.kde.org/en/kontrast"
LICENSE="GPL-3+"
SLOT="5"
KEYWORDS="*"
IUSE=""

DEPEND="
	$(add_qt_dep qtdbus)
	$(add_qt_dep qtdeclarative)
	$(add_qt_dep qtgui)
	$(add_qt_dep qtquickcontrols2)
	$(add_qt_dep qtsql)
	$(add_qt_dep qtsvg)
	$(add_qt_dep qtwidgets)
	$(add_frameworks_dep kcoreaddons)
	$(add_frameworks_dep kdeclarative)
	$(add_frameworks_dep ki18n)
	$(add_frameworks_dep kirigami)
"
RDEPEND="${DEPEND}
	kde-plasma/xdg-desktop-portal-kde
"
