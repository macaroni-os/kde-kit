# Distributed under the terms of the GNU General Public License v2

EAPI=7

FRAMEWORKS_MINIMAL=5.98.0
QT_MINIMAL=5.15.2
inherit kde5

DESCRIPTION="Tiny Qt music player by KDE"
HOMEPAGE="https://vvave.kde.org/"
SRC_URI="https://github.com/KDE/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3+"
SLOT="5"
KEYWORDS=""
IUSE=""

DEPEND="
	dev-libs/mauikit
	$(add_qt_dep qtdbus)
	$(add_qt_dep qtgui)
	$(add_qt_dep qtmultimedia)
	$(add_qt_dep qtnetwork)
	$(add_qt_dep qtquickcontrols2)
	$(add_qt_dep qtsql)
	$(add_qt_dep qtsvg)
	$(add_qt_dep qtwebengine)
	$(add_qt_dep qtwebsockets)
	$(add_qt_dep qtwidgets)
	$(add_qt_dep qtxml)
	$(add_frameworks_dep attica)
	$(add_frameworks_dep kconfig)
	$(add_frameworks_dep knotifications)
	$(add_frameworks_dep ki18n)
	$(add_frameworks_dep kio)
	media-libs/taglib
"
RDEPEND="${DEPEND}
	$(add_frameworks_dep kirigami)
	$(add_qt_dep qtgraphicaleffects)
	media-plugins/gst-plugins-meta:1.0[ffmpeg,mp3]
"
