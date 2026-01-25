# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit kde6 xdg

DESCRIPTION="Simple chess board based on KDE Frameworks"
HOMEPAGE="https://apps.kde.org/knights/"
SRC_URI="https://download.kde.org/stable/release-service/25.12.1/src/knights-25.12.1.tar.xz -> knights-25.12.1.tar.xz"
SLOT="6"
KEYWORDS="*"
IUSE="speech"
BDEPEND="app-alternatives/gzip
	
"
RDEPEND="|| (
	games-board/gnuchess
	games-board/crafty
	games-board/stockfish
	games-board/sjeng
	)
	
"
DEPEND="${RDEPEND}
	dev-qt/qtbase:6[gui]
	dev-qt/qtsvg:6
	kde-apps/libkdegames:6
	kde-frameworks/kcompletion:6
	kde-frameworks/kconfig:6
	kde-frameworks/kconfigwidgets:6
	kde-frameworks/kcoreaddons:6
	kde-frameworks/kcrash:6
	kde-frameworks/kdbusaddons:6
	kde-frameworks/ki18n:6
	kde-frameworks/kio:6
	kde-frameworks/kplotting:6
	kde-frameworks/ksvg:6
	kde-frameworks/ktextwidgets:6
	kde-frameworks/kwallet:6
	kde-frameworks/kwidgetsaddons:6
	kde-frameworks/kxmlgui:6
	kde-plasma/libplasma:6
	speech? ( dev-qt/qtspeech:6 )
	
"
src_prepare() {
	  kde6_src_prepare
}


# vim: filetype=ebuild
