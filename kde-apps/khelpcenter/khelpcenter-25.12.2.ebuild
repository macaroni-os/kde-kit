# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit cmake

DESCRIPTION="Application to read documentation for KDE Plasma, Applications, Utilities"
HOMEPAGE="https://apps.kde.org/khelpcenter/ https://userbase.kde.org/KHelpCenter"
SRC_URI="https://download.kde.org/stable/release-service/25.12.2/src/khelpcenter-25.12.2.tar.xz -> khelpcenter-25.12.2.tar.xz"
SLOT="6"
KEYWORDS="*"
RDEPEND="virtual/kde-seed[gui]
	dev-qt/qtwebengine:6
	dev-libs/libxml2:=
	dev-libs/xapian:=
	kde-frameworks/karchive:6
	kde-frameworks/kbookmarks:6
	kde-frameworks/kcodecs:6
	kde-frameworks/kcompletion:6
	kde-frameworks/kconfig:6
	kde-frameworks/kconfigwidgets:6
	kde-frameworks/kcoreaddons:6
	kde-frameworks/kdbusaddons:6
	kde-frameworks/kdoctools:6
	kde-frameworks/ki18n:6
	kde-frameworks/kio:6[handbook]
	kde-frameworks/kparts:6
	kde-frameworks/kservice:6
	kde-frameworks/ktexttemplate:6
	kde-frameworks/kwidgetsaddons:6
	kde-frameworks/kwindowsystem:6
	kde-frameworks/kxmlgui:6
	
"
DEPEND="${RDEPEND}
"

# vim: filetype=ebuild
