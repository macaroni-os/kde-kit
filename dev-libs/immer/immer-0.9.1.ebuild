# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit cmake

DESCRIPTION="Postmodern immutable and persistent data structures for C++ — value semantics at scale"
HOMEPAGE="https://sinusoid.es/immer/ https://github.com/arximboldi/immer"
SRC_URI="https://api.github.com/repos/arximboldi/immer/tarball/refs/tags/v0.9.1 -> immer-0.9.1-160f0d7.tar.gz"
LICENSE="BSL-1.0"
SLOT="0"
KEYWORDS="*"

post_src_unpack() {
	mv arximboldi-immer-* ${S}
}


src_configure() {
	local mycmakeargs=(
	  -Dimmer_BUILD_TESTS=OFF
	  -Dimmer_BUILD_EXAMPLES=OFF
	  -Dimmer_BUILD_DOCS=OFF
	  -Dimmer_BUILD_EXTRAS=OFF
	)
	cmake_src_configure
}



# vim: filetype=ebuild
