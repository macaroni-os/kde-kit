# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit kde6 xdg

DESCRIPTION="Game of action and puzzle solving by KDE"
HOMEPAGE="https://apps.kde.org/kgoldrunner/"
SRC_URI="https://download.kde.org/stable/release-service/25.12.2/src/kgoldrunner-25.12.2.tar.xz -> kgoldrunner-25.12.2.tar.xz"
SLOT="6"
KEYWORDS="*"
BDEPEND="app-alternatives/gzip
	
"
RDEPEND="dev-qt/qtsvg:6
	
"
DEPEND="${RDEPEND}
	dev-qt/qtbase:6[gui]
	kde-apps/libkdegames:6
	kde-frameworks/kconfig:6
	kde-frameworks/kconfigwidgets:6
	kde-frameworks/kcoreaddons:6
	kde-frameworks/kcrash:6
	kde-frameworks/kdbusaddons:6
	kde-frameworks/ki18n:6
	kde-frameworks/kio:6
	kde-frameworks/kwidgetsaddons:6
	kde-frameworks/kxmlgui:6
	media-libs/libsndfile
	media-libs/openal
	
"
src_prepare() {
	  kde6_src_prepare
}


# vim: filetype=ebuild
