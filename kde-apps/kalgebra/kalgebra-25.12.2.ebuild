# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit cmake

DESCRIPTION="MathML-based 2D and 3D graph calculator by KDE"
HOMEPAGE="https://apps.kde.org/kalgebra/"
SRC_URI="https://download.kde.org/stable/release-service/25.12.2/src/kalgebra-25.12.2.tar.xz -> kalgebra-25.12.2.tar.xz"
SLOT="6"
KEYWORDS="*"
IUSE="readline"
RDEPEND="virtual/kde-seed[gui,declarative,svg]
	dev-qt/qt5compat:6
	dev-qt/qtwebengine:6
	kde-frameworks/kirigami:6
	kde-apps/analitza:6
	kde-frameworks/kconfig:6
	kde-frameworks/kconfigwidgets:6
	kde-frameworks/kcoreaddons:6
	kde-frameworks/ki18n:6
	kde-frameworks/kio:6
	kde-frameworks/kwidgetsaddons:6
	kde-frameworks/kxmlgui:6
	kde-plasma/libplasma:6
	readline? ( sys-libs/readline:0= )
	
"
DEPEND="${RDEPEND}
"

# vim: filetype=ebuild
