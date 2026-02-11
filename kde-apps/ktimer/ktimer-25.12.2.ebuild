# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit cmake

DESCRIPTION="Little tool to execute programs after some time"
HOMEPAGE="https://apps.kde.org/ktimer/"
SRC_URI="https://download.kde.org/stable/release-service/25.12.2/src/ktimer-25.12.2.tar.xz -> ktimer-25.12.2.tar.xz"
SLOT="6"
KEYWORDS="*"
RDEPEND="virtual/kde-seed[gui]
	kde-frameworks/kconfig:6
	kde-frameworks/kconfigwidgets:6
	kde-frameworks/kcoreaddons:6
	kde-frameworks/kcrash:6
	kde-frameworks/kdbusaddons:6
	kde-frameworks/ki18n:6
	kde-frameworks/kio:6
	kde-frameworks/knotifications:6
	kde-frameworks/kstatusnotifieritem:6
	kde-frameworks/kwidgetsaddons:6
	
"
DEPEND="${RDEPEND}
"

# vim: filetype=ebuild
