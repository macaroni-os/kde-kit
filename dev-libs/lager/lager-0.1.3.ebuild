# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit cmake

DESCRIPTION=" C++ library for value-oriented design using the unidirectional data-flow architecture — Redux for C++"
HOMEPAGE="https://sinusoid.es/lager/ https://github.com/arximboldi/lager"
SRC_URI="https://api.github.com/repos/arximboldi/lager/tarball/refs/tags/v0.1.3 -> lager-0.1.3-48f6d48.tar.gz"
LICENSE="MIT"
SLOT="0"
KEYWORDS="*"

post_src_unpack() {
	mv arximboldi-lager-* ${S}
}


src_configure() {
	local mycmakeargs=(
	  -Dlager_BUILD_TESTS=OFF
	  -Dlager_BUILD_FAILURE_TESTS=OFF
	  -Dlager_BUILD_EXAMPLES=OFF
	  -Dlager_BUILD_DEBUGGER_EXAMPLES=OFF
	  -Dlager_BUILD_DOCS=OFF
	)
	cmake_src_configure
}



# vim: filetype=ebuild
