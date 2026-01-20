# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit kde6

DESCRIPTION="Framework for providing different actions given a string query"
HOMEPAGE="https://invent.kde.org/frameworks/"
SRC_URI="https://download.kde.org/stable/frameworks/6.22/krunner-6.22.0.tar.xz -> krunner-6.22.0.tar.xz"
SLOT="6"
KEYWORDS="*"
RDEPEND="dev-qt/qtbase:6[gui]
	kde-frameworks/kconfig:6
	kde-frameworks/kcoreaddons:6
	kde-frameworks/ki18n:6
	kde-frameworks/kitemmodels:6
	kde-frameworks/kwindowsystem:6[wayland]
	
"
DEPEND="${RDEPEND}
	
"
CMAKE_SKIP_TESTS=(
	  # requires virtual dbus, otherwise hangs; bugs #630672
	  dbusrunnertest
	  # bug 789351
	  runnermanagersinglerunnermodetest
	  # bug 838502
	  runnermanagertest
	  # bug 926502, needs dbus
	  threadingtest
)


# vim: filetype=ebuild
