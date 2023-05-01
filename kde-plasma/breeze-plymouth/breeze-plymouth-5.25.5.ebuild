# Distributed under the terms of the GNU General Public License v2

EAPI=7

FRAMEWORKS_MINIMAL=5.98.0
inherit kde5

DESCRIPTION="Breeze theme for Plymouth"
LICENSE="GPL-2+ GPL-3+"
SLOT="5"
KEYWORDS="*"
IUSE=""

BDEPEND="$(add_frameworks_dep extra-cmake-modules)"
DEPEND="sys-boot/plymouth"
RDEPEND="${DEPEND}"

src_configure() {
	local mycmakeargs=(
		-DDISTRO_NAME="Gentoo Linux"
		-DDISTRO_VERSION=
	)

	kde5_src_configure
}