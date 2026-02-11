# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit cmake

DESCRIPTION="Task management and system monitoring library"
HOMEPAGE="https://invent.kde.org/plasma/"
SRC_URI="https://download.kde.org/stable/plasma/6.5.5/libksysguard-6.5.5.tar.xz -> libksysguard-6.5.5.tar.xz"
SLOT="6"
KEYWORDS="*"
IUSE="webengine X"
RDEPEND="virtual/kde-seed[gui,declarative,X?]
	kde-frameworks/kauth:6
	kde-frameworks/kcompletion:6
	kde-frameworks/kconfig:6
	kde-frameworks/kconfigwidgets:6
	kde-frameworks/kcoreaddons:6
	kde-frameworks/kglobalaccel:6
	kde-frameworks/ki18n:6
	kde-frameworks/kiconthemes:6
	kde-frameworks/kjobwidgets:6
	kde-frameworks/kio:6
	kde-frameworks/knewstuff:6
	kde-frameworks/kpackage:6
	kde-frameworks/kservice:6
	kde-frameworks/kwidgetsaddons:6
	kde-frameworks/kwindowsystem:6[X?]
	net-libs/libpcap
	sys-libs/libcap
	sys-libs/zlib
	virtual/libudev:=
	sys-apps/lm-sensors:=
	webengine? ( dev-qt/qtwebengine:6 )
	X? (
	    x11-libs/libX11
	    x11-libs/libXres
	)
	
"
DEPEND="${RDEPEND}
"
src_configure() {
	local mycmakeargs=(
	  $(cmake_use_find_package webengine Qt6WebEngineWidgets)
	  $(cmake_use_find_package X X11)
	  $(cmake_use_find_package X XRes)
	)
	cmake_src_configure
}


# vim: filetype=ebuild
