# Distributed under the terms of the GNU General Public License v2

EAPI=7

FRAMEWORKS_MINIMAL=5.98.0
QT_MINIMAL=5.12.3
inherit kde5

DESCRIPTION="KControl module for Oyranos CMS cross desktop settings"
HOMEPAGE="https://www.oyranos.org/kolormanager"
SRC_URI="https://github.com/KDE/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-2"
SLOT="5"
KEYWORDS="*"

DEPEND="
	$(add_qt_dep qtwidgets)
	$(add_frameworks_dep kconfigwidgets)
	$(add_frameworks_dep kcoreaddons)
	$(add_frameworks_dep ki18n)
	media-gfx/synnefo
	media-libs/libXcm
	>=media-libs/oyranos-0.9.6
	x11-libs/libXrandr
"
RDEPEND="${DEPEND}"

PATCHES=( "${FILESDIR}/${P}"-deps.patch )
