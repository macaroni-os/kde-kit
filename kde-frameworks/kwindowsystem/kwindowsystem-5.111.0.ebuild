# Distributed under the terms of the GNU General Public License v2

EAPI=7

QT_MINIMAL=5.15.1
VIRTUALX_REQUIRED="test"
inherit kde5

DESCRIPTION="Framework providing access to properties and features of the window manager"
LICENSE="|| ( LGPL-2.1 LGPL-3 ) MIT"
KEYWORDS="*"
IUSE="nls X"

BDEPEND="
	nls? ( $(add_qt_dep linguist-tools) )
"
RDEPEND="
	$(add_qt_dep qtgui)
	$(add_qt_dep qtwidgets)
	X? (
		$(add_qt_dep qtx11extras)
		x11-libs/libX11
		x11-libs/libXfixes
		x11-libs/libxcb
		x11-libs/xcb-util-keysyms
	)
"
DEPEND="${RDEPEND}
	X? ( x11-base/xorg-proto )
"

RESTRICT+=" test"

DOCS=( docs/README.kstartupinfo )

src_configure() {
	local mycmakeargs=(
		$(cmake-utils_use_find_package X X11)
	)

	kde5_src_configure
}
