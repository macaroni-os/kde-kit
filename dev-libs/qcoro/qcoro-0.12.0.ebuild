# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit cmake

DESCRIPTION="C++ Coroutine Library for Qt5"
HOMEPAGE="https://qcoro.dvratil.cz/ https://github.com/danvratil/qcoro"
SRC_URI="https://api.github.com/repos/qcoro/qcoro/tarball/refs/tags/v0.12.0 -> qcoro-0.12.0-ef1231a.tar.gz"
LICENSE="MIT"
SLOT="0"
KEYWORDS="*"
IUSE="dbus examples +network qml websockets"
RDEPEND="dev-qt/qtbase:6
	qml? (
	  dev-qt/qtbase:6[gui]
	  dev-qt/qtdeclarative:6
	)
	websockets? ( dev-qt/qtwebsockets:6 )
	
"
DEPEND="${RDEPEND}
	examples? ( dev-qt/qtbase:6 )
	
"

post_src_unpack() {
	mv danvratil-qcoro-* ${S}
}


post_src_unpack() {
	  if [ ! -d "${S}" ]; then
	  mv qcoro* "${S}" || die
	  fi
}

src_configure() {
	  local mycmakeargs=(
	  -DUSE_QT_VERSION=6
	  -DQCORO_BUILD_EXAMPLES=$(usex examples)
	  -DQCORO_WITH_QTDBUS=$(usex dbus)
	  -DQCORO_WITH_QTNETWORK=$(usex network)
	  -DQCORO_WITH_QML=$(usex qml)
	  -DQCORO_WITH_QTQUICK=$(usex qml)
	  -DBUILD_TESTING=false
	  -DQCORO_WITH_QTWEBSOCKETS=$(usex websockets)
	  )
	  cmake_src_configure
}

src_install() {
	  if use examples; then
	  docinto examples
	  dodoc -r examples/*
	  fi
	  cmake_src_install
}



# vim: filetype=ebuild
