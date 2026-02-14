# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit cmake

DESCRIPTION="Program that helps to learn and practice touch typing"
HOMEPAGE="https://apps.kde.org/ktouch/"
SRC_URI="https://download.kde.org/stable/release-service/25.12.2/src/ktouch-25.12.2.tar.xz -> ktouch-25.12.2.tar.xz"
SLOT="6"
KEYWORDS="*"
IUSE="X"
RDEPEND="virtual/kde-seed[gui,sql,declarative,X?]
	dev-qt/qt5compat:6[qml]
	kde-apps/kqtquickcharts:6
	dev-libs/libxml2:2=
	kde-frameworks/kcmutils:6
	kde-frameworks/kcompletion:6
	kde-frameworks/kconfig:6
	kde-frameworks/kconfigwidgets:6
	kde-frameworks/kcoreaddons:6
	kde-frameworks/ki18n:6
	kde-frameworks/kitemviews:6
	kde-frameworks/kservice:6
	kde-frameworks/ktextwidgets:6
	kde-frameworks/kwidgetsaddons:6
	kde-frameworks/kxmlgui:6
	X? (
	  x11-libs/libICE
	  x11-libs/libSM
	  x11-libs/libX11
	  x11-libs/libxcb
	  x11-libs/libxkbfile
	)
	
"
DEPEND="${RDEPEND}
"

# vim: filetype=ebuild
