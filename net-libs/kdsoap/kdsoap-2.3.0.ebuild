# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit cmake

DESCRIPTION="A Qt-based client-side and server-side SOAP component"
HOMEPAGE="https://www.kdab.com/development-resources/qt-tools/kd-soap/"
SRC_URI="https://github.com/KDAB/KDSoap/releases/download/kdsoap-2.3.0/kdsoap-2.3.0.tar.gz -> kdsoap-2.3.0.tar.gz"
LICENSE="GPL-3 AGPL-3"
SLOT="0"
KEYWORDS="*"
RDEPEND="dev-qt/qtbase:6
	dev-libs/boost
	
"
DEPEND="${RDEPEND}
	
"

post_src_unpack() {
	mv KDAB-KDSoap-* ${S}
}


src_configure() {
	  local mycmakeargs=(
	      -DKDSoap_DOCS=OFF
	      -DKDSoap_EXAMPLES=OFF
	      -DKDSoap_QT6=ON
	      -DKDSoap_STATIC=OFF
	  )
	  cmake_src_configure
}



# vim: filetype=ebuild
