# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit cmake

DESCRIPTION="Qt bindings for libpulse"
HOMEPAGE="https://invent.kde.org/libraries/pulseaudio-qt"
SRC_URI="https://download.kde.org/stable/pulseaudio-qt/pulseaudio-qt-1.7.0.tar.xz -> pulseaudio-qt-1.7.0.tar.xz"
LICENSE="LGPL-2.1"
SLOT="6"
KEYWORDS="*"
IUSE="doc"
BDEPEND="virtual/pkgconfig
	doc? (
	  >=dev-qt/qttools-6.6.2:6[assistant]
	  >=kde-frameworks/kdoctools-6.3.0:6
	)
	
"
RDEPEND=">=dev-qt/qtbase-6.6.2:6[gui]
	media-sound/pulseaudio[glib]
	
"
DEPEND="${RDEPEND}
"
src_configure() {
	local mycmakeargs=(
	  -DBUILD_WITH_QT6=ON
	  -DQT_MAJOR_VERSION=6
	  -DBUILD_QCH=$(usex doc)
	  -DBUILD_TESTING=OFF
	)
	cmake_src_configure
}


# vim: filetype=ebuild
