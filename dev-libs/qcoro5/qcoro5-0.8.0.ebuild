# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake kde5

DESCRIPTION="C++ Coroutine Library for Qt5"
HOMEPAGE="https://qcoro.dvratil.cz/ https://github.com/danvratil/qcoro"
SRC_URI="https://github.com/danvratil/${PN/5/}/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"
LICENSE="MIT"
SLOT="0"
KEYWORDS="*"
IUSE="dbus examples +network qml websockets"

RDEPEND="
	$(add_qt_dep qtcore)
	dev-qt/qtcore:5
	dbus? ( $(add_qt_dep qtdbus) )
	network? ( $(add_qt_dep qtnetwork) )
	qml? ( $(add_qt_dep qtdeclarative) )
	websockets? ( $(add_qt_dep qtwebsockets) )
"
DEPEND="${RDEPEND}
	examples? (
		$(add_qt_dep qtconcurrent)
		$(add_qt_dep qtnetwork)
		$(add_qt_dep qtwidgets)
	)
"

post_src_unpack() {
	if [ ! -d "${S}" ]; then
		mv qcoro* "${S}" || die
	fi
}

src_prepare() {
	cmake_src_prepare
}

src_configure() {
	local mycmakeargs=(
		-DUSE_QT_VERSION=5
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


