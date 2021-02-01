# Distributed under the terms of the GNU General Public License v2

EAPI=7

QT_MINIMAL=5.15.1
inherit kde5

DESCRIPTION="Framework for getting the usage statistics collected by the activities service"
LICENSE="LGPL-2+"
KEYWORDS="*"
IUSE=""

RDEPEND="
	$(add_qt_dep qtdbus)
	$(add_qt_dep qtsql)
	$(add_frameworks_dep kactivities)
	$(add_frameworks_dep kconfig)
"
DEPEND="${RDEPEND}
	>=dev-libs/boost-1.54
"
