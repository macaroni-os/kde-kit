# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit kde5

DESCRIPTION="KPart for rendering Markdown content"
HOMEPAGE="https://apps.kde.org/en/kmarkdownwebviewpart"
SRC_URI="mirror://kde/stable/${PN}/${PV}/src/${P}.tar.xz"

LICENSE="BSD LGPL-2.1+"
SLOT="5"
KEYWORDS="*"
IUSE=""

DEPEND="
	$(add_qt_dep qtgui)
	$(add_qt_dep qtwebchannel)
	$(add_qt_dep qtwebengine widgets)
	$(add_qt_dep qtwidgets)
	$(add_frameworks_dep kconfigwidgets)
	$(add_frameworks_dep kcoreaddons)
	$(add_frameworks_dep ki18n)
	$(add_frameworks_dep kio)
	$(add_frameworks_dep kparts)
	$(add_frameworks_dep kxmlgui)
"
RDEPEND="${DEPEND}"

src_configure() {
	local mycmakeargs=(
		-DUSE_QTWEBKIT=OFF
	)
	kde5_src_configure
}
