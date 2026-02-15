# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit cmake

DESCRIPTION="Nonogram logic game by KDE"
HOMEPAGE="https://apps.kde.org/picmi/"
SRC_URI="https://download.kde.org/stable/release-service/25.12.2/src/picmi-25.12.2.tar.xz -> picmi-25.12.2.tar.xz"
SLOT="6"
KEYWORDS="*"
BDEPEND="app-arch/gzip
	
"
RDEPEND="virtual/kde-seed[gui,declarative,svg]
	kde-apps/libkdegames:6
	kde-frameworks/kconfigwidgets:6
	kde-frameworks/kcoreaddons:6
	kde-frameworks/kcrash:6
	kde-frameworks/kdbusaddons:6
	kde-frameworks/ki18n:6
	kde-frameworks/kwidgetsaddons:6
	kde-frameworks/kxmlgui:6
	
"
DEPEND="${RDEPEND}
"

# vim: filetype=ebuild
