# Distributed under the terms of the GNU General Public License v2

EAPI=7

KDE_TEST="true"
FRAMEWORKS_MINIMAL=5.98.0
QT_MINIMAL=5.15.1
inherit kde5

DESCRIPTION="Library for playing & ripping CDs"
LICENSE="GPL-2+ LGPL-2+"
SLOT="5"
KEYWORDS="*"
IUSE="alsa"

DEPEND="
	$(add_qt_dep qtdbus)
	$(add_frameworks_dep kcoreaddons)
	$(add_frameworks_dep ki18n)
	$(add_frameworks_dep solid)
	>=media-libs/phonon-4.11.0
	alsa? ( media-libs/alsa-lib )
"
RDEPEND="${DEPEND}"

src_configure() {
	local mycmakeargs=(
		$(cmake-utils_use_find_package alsa ALSA)
	)
	kde5_src_configure
}