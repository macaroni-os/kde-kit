# Distributed under the terms of the GNU General Public License v2

EAPI=7

FRAMEWORKS_MINIMAL=5.82.0
QT_MINIMAL=5.15.2
inherit kde5

DESCRIPTION="Qt component to allow applications make use of Wayland wl-layer-shell protocol"
LICENSE="LGPL-3+"
SLOT="5"
KEYWORDS="*"
IUSE=""

RDEPEND="
	dev-libs/wayland
	$(add_qt_dep qtdeclarative)
	$(add_qt_dep qtgui)
	$(add_qt_dep qtwayland)
	x11-libs/libxkbcommon
"
DEPEND="${RDEPEND}
	dev-libs/plasma-wayland-protocols
"
BDEPEND="
	dev-util/wayland-scanner
	virtual/pkgconfig
"
