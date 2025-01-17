# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit autotools

DESCRIPTION="Hardware identification and configuration data"
HOMEPAGE="https://github.com/vcrhonek/hwdata"
SRC_URI="https://github.com/vcrhonek/hwdata/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="*"

RESTRICT="test"

src_configure() {
	# configure is not compatible with econf
	local conf=(
		./configure
		--prefix="${EPREFIX}/usr"
		--libdir="${EPREFIX}/lib"
		--datadir="${EPREFIX}/usr/share"
	)

	econf "${conf[@]}"
}
