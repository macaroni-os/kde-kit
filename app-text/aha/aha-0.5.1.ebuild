# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Converts ANSI escape sequences of a unix terminal to HTML code"
HOMEPAGE="https://github.com/theZiz/aha"
SRC_URI="https://github.com/theZiz/aha/tarball/41c2320eb31ef1c95fcd45a0feb0303f606fc711 -> aha-0.5.1-41c2320.tar.gz"

LICENSE="LGPL-2+ MPL-1.1"
SLOT="0"
KEYWORDS="*"

S="${WORKDIR}/theZiz-aha-41c2320"

src_install() {
    emake PREFIX="${D}/usr" install
}