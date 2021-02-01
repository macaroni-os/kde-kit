# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit kde5

DESCRIPTION="C++ bindings for GStreamer with a Qt-style API"
HOMEPAGE="https://gstreamer.freedesktop.org/modules/qt-gstreamer.html"
SRC_URI="https://gstreamer.freedesktop.org/src/qt-gstreamer/${P}.tar.xz"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="*"
IUSE="test"

BDEPEND="
	dev-util/glib-utils
"
RDEPEND="
	dev-libs/boost:=
	dev-libs/glib:2
	$(add_qt_dep qtcore)
	$(add_qt_dep qtdeclarative)
	$(add_qt_dep qtgui)
	$(add_qt_dep qtopengl)
	$(add_qt_dep qtwidgets)
	media-libs/gstreamer:1.0
	media-libs/gst-plugins-base:1.0
"
DEPEND="${RDEPEND}
	test? ( $(add_qt_dep qttest) )
"

PATCHES=(
	"${FILESDIR}/${P}-gstreamer15.patch"
	"${FILESDIR}/${P}-gstreamer16.patch"
	"${FILESDIR}/${P}-boost157.patch"
	"${FILESDIR}/${P}-qt-5.11b3.patch"
	"${FILESDIR}/${P}-clang-38.patch"
)

# bug 497880
RESTRICT="test"

src_configure() {
	local mycmakeargs=(
		-DCMAKE_DISABLE_FIND_PACKAGE_Qt5Declarative=ON
		-DQTGSTREAMER_EXAMPLES=OFF
		-DQTGSTREAMER_TESTS=$(usex test)
		-DQT_VERSION=5
	)
	kde5_src_configure
}
