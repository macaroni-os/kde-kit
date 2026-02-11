# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit cmake

DESCRIPTION="Extra Plasma applets and engines"
HOMEPAGE="https://invent.kde.org/plasma/"
SRC_URI="https://download.kde.org/stable/plasma/6.5.5/kdeplasma-addons-6.5.5.tar.xz -> kdeplasma-addons-6.5.5.tar.xz"
SLOT="6"
KEYWORDS="*"
IUSE="share webengine"
RDEPEND="virtual/kde-seed[gui,declarative]
	dev-qt/qt5compat:6[qml]
	kde-frameworks/kconfig:6
	kde-frameworks/kconfigwidgets:6
	kde-frameworks/kcoreaddons:6
	kde-frameworks/kholidays:6
	kde-frameworks/ki18n:6
	kde-frameworks/kio:6
	kde-frameworks/knewstuff:6
	kde-frameworks/knotifications:6
	kde-frameworks/kpackage:6
	kde-frameworks/krunner:6
	kde-frameworks/kservice:6
	kde-frameworks/kunitconversion:6
	kde-frameworks/kxmlgui:6
	kde-frameworks/kirigami:6
	kde-frameworks/kquickcharts:6
	kde-plasma/libplasma:6
	kde-plasma/plasma-workspace:6
	kde-plasma/plasma5support:6
	share? ( kde-frameworks/purpose:6 )
	webengine? ( dev-qt/qtwebengine:6 )
	
"
DEPEND="${RDEPEND}
"
src_configure() {
	local mycmakeargs=(
	  $(cmake_use_find_package share KF6Purpose)
	  $(cmake_use_find_package webengine Qt6WebEngine)
	)
	cmake_src_configure
}


# vim: filetype=ebuild
