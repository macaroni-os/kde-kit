# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake xdg-utils

DESCRIPTION="Qt Library for Building File Managers"
HOMEPAGE="https://lxqt.github.io/"

SRC_URI="https://github.com/lxqt/libfm-qt/releases/download/1.4.0/libfm-qt-1.4.0.tar.xz -> libfm-qt-1.4.0.tar.xz"
KEYWORDS="*"

LICENSE="BSD GPL-2+ LGPL-2.1+"
SLOT="0"

BDEPEND="
	dev-qt/linguist-tools:5
	dev-util/lxqt-build-tools
	=lxqt-base/lxqt-menu-data-1.4*
	virtual/pkgconfig
"
DEPEND="
	dev-libs/glib:2
	dev-qt/qtcore:5
	dev-qt/qtgui:5=
	dev-qt/qtwidgets:5
	dev-qt/qtx11extras:5
	lxde-base/menu-cache
	media-libs/libexif
	x11-libs/libxcb
"
RDEPEND="${DEPEND}"

pkg_postinst() {
	xdg_mimeinfo_database_update
}

pkg_postrm() {
	xdg_mimeinfo_database_update
}

post_src_unpack() {
	if [ ! -d "${S}" ]; then
		mv "${WORKDIR}"/* "${S}" || die
	fi
}