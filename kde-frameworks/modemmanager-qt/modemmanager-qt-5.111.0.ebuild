# Distributed under the terms of the GNU General Public License v2

EAPI=7

QT_MINIMAL=5.15.1
inherit kde5

DESCRIPTION="ModemManager bindings for Qt"
LICENSE="LGPL-2"
KEYWORDS="*"
IUSE=""

BDEPEND="
	virtual/pkgconfig
"
DEPEND="
	$(add_qt_dep qtdbus)
	$(add_qt_dep qtxml)
	net-misc/modemmanager
"
RDEPEND="${DEPEND}"

# requires running environment
RESTRICT+=" test"