# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit cmake

DESCRIPTION="System service to manage user's activities, track the usage patterns etc."
HOMEPAGE="https://invent.kde.org/plasma/"
SRC_URI="https://download.kde.org/stable/plasma/6.5.5/kactivitymanagerd-6.5.5.tar.xz -> kactivitymanagerd-6.5.5.tar.xz"
SLOT="6"
KEYWORDS="*"
RDEPEND="virtual/kde-seed[gui,sql]
	dev-qt/qtbase:6[sqlite]
	kde-frameworks/kconfig:6
	kde-frameworks/kcoreaddons:6
	kde-frameworks/kcrash:6
	kde-frameworks/kdbusaddons:6
	kde-frameworks/kglobalaccel:6
	kde-frameworks/ki18n:6
	kde-frameworks/kio:6
	kde-frameworks/kservice:6
	kde-frameworks/kwindowsystem:6[X]
	kde-frameworks/kxmlgui:6
	dev-libs/boost
	
"
DEPEND="${RDEPEND}
"

# vim: filetype=ebuild
