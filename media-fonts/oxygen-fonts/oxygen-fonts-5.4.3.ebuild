# Distributed under the terms of the GNU General Public License v2

EAPI=6

KDE_AUTODEPS="false"
KDE_DEBUG="false"
inherit kde5 font

DESCRIPTION="Desktop/GUI font family for integrated use with the KDE Plasma desktop"
HOMEPAGE="https://invent.kde.org/neon/kde/oxygen-fonts"
SRC_URI="mirror://kde/stable/plasma/$(ver_cut 1-3)/${P}.tar.xz"

LICENSE="OFL-1.1"
KEYWORDS="*"
IUSE=""

DEPEND="
	$(add_frameworks_dep extra-cmake-modules)
	$(add_qt_dep qtcore)
	media-gfx/fontforge
"

DOCS=( README.md )

PATCHES=( "${FILESDIR}/${P}-fix-d-and-t-accents.patch" )

src_configure() {
	local mycmakeargs=(
		-DOXYGEN_FONT_INSTALL_DIR="${FONTDIR}"
	)
	kde5_src_configure
}

src_install() {
	kde5_src_install
	font_src_install
}
