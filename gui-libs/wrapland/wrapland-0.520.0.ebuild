# Distributed under the terms of the GNU General Public License v2

EAPI=7

KDE_TEST="forceoptional"
FRAMEWORKS_MINIMAL=5.74.0
QT_MINIMAL=5.15.1
inherit kde5

DESCRIPTION="Qt/C++ library wrapping libwayland"
HOMEPAGE="https://gitlab.com/kwinft/wrapland"
SRC_URI="https://gitlab.com/kwinft/${PN}/-/archive/${P/-/@}/${PN}-${P/-/@}.tar.gz -> ${P}.tar.gz"

LICENSE="LGPL-2.1+"
SLOT="5"
KEYWORDS="*"
IUSE=""

RDEPEND="
	>=dev-libs/wayland-1.15.0
	$(add_qt_dep qtconcurrent)
	$(add_qt_dep qtgui)[egl]
	media-libs/mesa[egl]
"
DEPEND="${RDEPEND}
	>=dev-libs/wayland-protocols-1.15
"

# All failing, I guess we need a virtual wayland server
RESTRICT+=" test"

S="${WORKDIR}/${PN}-${P/-/@}"
