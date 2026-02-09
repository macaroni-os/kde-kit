# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit cmake

DESCRIPTION="Can be used to show nice dialog boxes from shell scripts"
HOMEPAGE="https://develop.kde.org/docs/administration/kdialog/"
SRC_URI="https://download.kde.org/stable/release-service/25.12.2/src/kdialog-25.12.2.tar.xz -> kdialog-25.12.2.tar.xz"
SLOT="6"
KEYWORDS="*"
IUSE="X"
RDEPEND="virtual/kde-seed[gui]
	kde-frameworks/kconfig:6
	kde-frameworks/kcoreaddons:6
	kde-frameworks/kdbusaddons:6
	kde-frameworks/kguiaddons:6
	kde-frameworks/ki18n:6
	kde-frameworks/kiconthemes:6
	kde-frameworks/kio:6
	kde-frameworks/knotifications:6
	kde-frameworks/ktextwidgets:6
	kde-frameworks/kwidgetsaddons:6
	kde-frameworks/kwindowsystem:6
	X? ( x11-libs/libX11 )
	
"
DEPEND="${RDEPEND}
"

# vim: filetype=ebuild
