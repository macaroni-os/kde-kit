# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit cmake

DESCRIPTION="Transducers for C++ — Clojure style higher order push/pull sequence transformations"
HOMEPAGE="https://sinusoid.es/zug/ https://github.com/arximboldi/zug"
SRC_URI="https://api.github.com/repos/arximboldi/zug/tarball/refs/tags/v0.1.2 -> zug-0.1.2-dd80433.tar.gz"
LICENSE="BSL-1.0"
SLOT="0"
KEYWORDS="*"

post_src_unpack() {
	mv arximboldi-zug-* ${S}
}


src_configure() {
	local mycmakeargs=(
	  -Dzug_BUILD_TESTS=OFF
	  -Dzug_BUILD_EXAMPLES=OFF
	  -Dzug_BUILD_DOCS=OFF
	)
	cmake_src_configure
}



# vim: filetype=ebuild
