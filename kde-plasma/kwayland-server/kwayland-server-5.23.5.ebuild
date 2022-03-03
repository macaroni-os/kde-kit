# Distributed under the terms of the GNU General Public License v2

EAPI=7

KDE_QTHELP="true"
KDE_TEST="true"
FRAMEWORKS_MINIMAL=5.82.0
QT_MINIMAL=5.15.2
inherit kde5

DESCRIPTION="Wayland Server Components built on KDE Frameworks"
HOMEPAGE="https://invent.kde.org/plasma/kwayland-server"
LICENSE="LGPL-2.1"
SLOT="5"
KEYWORDS="*"
IUSE=""

RDEPEND="
	>=dev-libs/wayland-1.18.0
	$(add_qt_dep qtconcurrent)
	$(add_qt_dep qtgui egl)
	$(add_qt_dep qtwayland)
	$(add_frameworks_dep kwayland)
	media-libs/mesa[egl]
"
DEPEND="${RDEPEND}
	>=dev-libs/plasma-wayland-protocols-1.1.1
	>=dev-libs/wayland-protocols-1.21
"

# All failing, I guess we need a virtual wayland server
RESTRICT+=" test"
