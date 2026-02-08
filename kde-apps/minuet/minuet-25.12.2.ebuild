# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit kde6 xdg

DESCRIPTION="Music Education software by KDE"
HOMEPAGE="https://minuet.kde.org/"
SRC_URI="https://download.kde.org/stable/release-service/25.12.2/src/minuet-25.12.2.tar.xz -> minuet-25.12.2.tar.xz"
SLOT="6"
KEYWORDS="*"
BDEPEND="virtual/pkgconfig
	
"
RDEPEND="dev-qt/qtbase:6[gui]
	dev-qt/qtdeclarative:6
	dev-qt/qtsvg:6
	kde-frameworks/kcoreaddons:6
	kde-frameworks/kcrash:6
	kde-frameworks/ki18n:6
	media-sound/fluidsynth:=
	
"
DEPEND="${RDEPEND}
	
"
src_prepare() {
	  kde6_src_prepare
}


# vim: filetype=ebuild
