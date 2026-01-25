# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit kde6

DESCRIPTION="Framework providing an assortment of configuration-related widgets"
HOMEPAGE="https://invent.kde.org/frameworks/"
SRC_URI="https://download.kde.org/stable/frameworks/6.22/kconfigwidgets-6.22.0.tar.xz -> kconfigwidgets-6.22.0.tar.xz"
SLOT="6"
KEYWORDS="*"
RDEPEND="dev-qt/qtbase:6[gui]
	kde-frameworks/kcodecs:6
	kde-frameworks/kcolorscheme:6
	kde-frameworks/kconfig:6
	kde-frameworks/kcoreaddons:6
	kde-frameworks/kguiaddons:6
	kde-frameworks/ki18n:6
	kde-frameworks/kwidgetsaddons:6
	
"
DEPEND="${RDEPEND}
	test? ( kde-frameworks/kconfig:6[dbus] )
	
"
CMAKE_SKIP_TESTS=(
	  # bugs: 864250
	  kstandardactiontest
	  # bug 926497
	  klanguagenametest
)


# vim: filetype=ebuild
