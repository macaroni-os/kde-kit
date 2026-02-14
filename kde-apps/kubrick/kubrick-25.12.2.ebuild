# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit cmake

DESCRIPTION="Game based on the Rubik's Cube"
HOMEPAGE="https://apps.kde.org/kubrick/"
SRC_URI="https://download.kde.org/stable/release-service/25.12.2/src/kubrick-25.12.2.tar.xz -> kubrick-25.12.2.tar.xz"
SLOT="6"
KEYWORDS="*"
BDEPEND="app-arch/gzip
	
"
RDEPEND="virtual/kde-seed[gui,svg]
	kde-apps/libkdegames:6
	kde-frameworks/kconfig:6
	kde-frameworks/kconfigwidgets:6
	kde-frameworks/kcoreaddons:6
	kde-frameworks/kcrash:6
	kde-frameworks/kdbusaddons:6
	kde-frameworks/ki18n:6
	kde-frameworks/kwidgetsaddons:6
	kde-frameworks/kxmlgui:6
	virtual/glu
	virtual/opengl
	
"
DEPEND="${RDEPEND}
"

# vim: filetype=ebuild
