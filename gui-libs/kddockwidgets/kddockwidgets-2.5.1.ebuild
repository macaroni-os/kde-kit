# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit cmake

DESCRIPTION="KDAB's Dock Widget Framework for Qt"
HOMEPAGE="https://www.kdab.com/development-resources/qt-tools/kddockwidgets"
SRC_URI="https://api.github.com/repos/KDAB/KDDockWidgets/tarball/v2.5.1 -> kddockwidgets-2.5.1-674f284.tar.gz"
LICENSE="NOASSERTION"
SLOT="0"
KEYWORDS="*"
IUSE="qml"
RDEPEND="dev-qt/qtbase:6=[X,gui]
	qml? ( dev-qt/qtdeclarative:6= )
	
"
DEPEND="${RDEPEND}
	dev-cpp/nlohmann_json
	
"

post_src_unpack() {
	mv KDAB-KDDockWidgets-* ${S}
}


src_configure() {
	local mycmakeargs=(
	  -DKDDockWidgets_EXAMPLES=no
	  -DKDDockWidgets_FRONTENDS="qtwidgets$(usex qml ';qtquick' '')"
	  -DKDDockWidgets_NO_SPDLOG=yes
	  -DKDDockWidgets_PYTHON_BINDINGS=no
	  -DKDDockWidgets_XLib=no
	)
	cmake_src_configure
}

src_install() {
	cmake_src_install
	rm -r -- "${ED}"/usr/share/doc/${PF}-qt6 || die
}



# vim: filetype=ebuild
