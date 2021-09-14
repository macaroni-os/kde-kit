# Distributed under the terms of the GNU General Public License v2

EAPI=7

KDE_TEST="true"
QT_MINIMAL=5.15.1
inherit kde5

DESCRIPTION="Qt-style client and server library wrapper for Wayland libraries"
HOMEPAGE="https://invent.kde.org/frameworks/kwayland"

LICENSE="LGPL-2.1"
KEYWORDS="*"
IUSE=""

RDEPEND="
	>=dev-libs/wayland-1.15.0
	$(add_qt_dep qtconcurrent)
	$(add_qt_dep qtgui egl)
	$(add_qt_dep qtwayland)
	media-libs/mesa[egl]
"
DEPEND="${RDEPEND}
	>=dev-libs/plasma-wayland-protocols-1.2.1
	>=dev-libs/wayland-protocols-1.15
"

# All failing, I guess we need a virtual wayland server
RESTRICT+=" test"