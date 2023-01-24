# Distributed under the terms of the GNU General Public License v2

EAPI=7

FRAMEWORKS_MINIMAL=5.98.0
QT_MINIMAL=5.15.1
inherit kde5

DESCRIPTION="Client for Matrix, the decentralized communication protocol"
HOMEPAGE="https://apps.kde.org/en/neochat"
SRC_URI="mirror://kde/stable/${PN}/${PV}/${P}.tar.xz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="*"

DEPEND="
	app-text/cmark:=
	dev-libs/qtkeychain:=
	$(add_qt_dep qtdeclarative)
	$(add_qt_dep qtgui)
	$(add_qt_dep qtmultimedia)
	$(add_qt_dep qtnetwork)
	$(add_qt_dep qtquickcontrols2)
	$(add_qt_dep qtsvg)
	$(add_qt_dep qtwidgets)
	$(add_frameworks_dep kconfig)
	$(add_frameworks_dep kcoreaddons)
	$(add_frameworks_dep kdbusaddons)
	$(add_frameworks_dep ki18n)
	$(add_frameworks_dep kirigami)
	$(add_frameworks_dep knotifications)
	media-libs/kquickimageeditor:5
	net-libs/libquotient
"
RDEPEND="${DEPEND}
	$(add_qt_dep qtgraphicaleffects)
	$(add_qt_dep qtmultimedia qml)
	$(add_frameworks_dep kitemmodels qml)
"
BDEPEND="
	virtual/pkgconfig
"
