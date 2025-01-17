# Distributed under the terms of the GNU General Public License v2

EAPI=7

MY_P=${P/_p/}
inherit kde5

DESCRIPTION="Dictionary application that implements the Dict protocol"
HOMEPAGE="https://www.dikt.tv/"
SRC_URI="https://bitbucket-archive.softwareheritage.org/static/67/67f37093-df38-43b8-845b-2952e0a33bb3/attachments/${MY_P}.txz -> ${MY_P}.tar.xz"

LICENSE="BSD-2"
SLOT="5"
KEYWORDS="*"
IUSE=""

DEPEND="
	$(add_frameworks_dep kcodecs)
	$(add_frameworks_dep kconfig)
	$(add_frameworks_dep kconfigwidgets)
	$(add_frameworks_dep kcoreaddons)
	$(add_frameworks_dep kdbusaddons)
	$(add_frameworks_dep kguiaddons)
	$(add_frameworks_dep ki18n)
	$(add_frameworks_dep kiconthemes)
	$(add_frameworks_dep kio)
	$(add_frameworks_dep kwidgetsaddons)
	$(add_frameworks_dep kxmlgui)
	$(add_qt_dep qtgui)
	$(add_qt_dep qtnetwork)
	$(add_qt_dep qtprintsupport)
	$(add_qt_dep qtwidgets)
"
RDEPEND="${DEPEND}
	!app-dicts/dikt:4
"

S="${WORKDIR}/${MY_P}"
