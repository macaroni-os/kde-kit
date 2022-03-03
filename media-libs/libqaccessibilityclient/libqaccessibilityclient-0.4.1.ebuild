# Distributed under the terms of the GNU General Public License v2

EAPI=7

KDE_EXAMPLES="true"
KDE_TEST="true"
QT_MINIMAL=5.12.3
VIRTUALX_REQUIRED="test"
inherit kde5

DESCRIPTION="Library for writing accessibility clients such as screen readers"
HOMEPAGE="https://community.kde.org/Accessibility https://invent.kde.org/libraries/libqaccessibilityclient"
SRC_URI="mirror://kde/stable/${PN}/${P}.tar.xz"

LICENSE="LGPL-2.1"
SLOT="5"
KEYWORDS="*"

DEPEND="
	$(add_qt_dep qtdbus)
	$(add_qt_dep qtgui)
	$(add_qt_dep qtwidgets)
"
RDEPEND="${DEPEND}"

# tests require DBus
RESTRICT+=" test"
