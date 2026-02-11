# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit cmake

DESCRIPTION="Music Education software by KDE"
HOMEPAGE="https://minuet.kde.org/"
SRC_URI="https://download.kde.org/stable/release-service/25.12.2/src/minuet-25.12.2.tar.xz -> minuet-25.12.2.tar.xz"
SLOT="6"
KEYWORDS="*"
BDEPEND="virtual/pkgconfig
	
"
RDEPEND="virtual/kde-seed[gui,declarative,svg]
	kde-frameworks/kcoreaddons:6
	kde-frameworks/kcrash:6
	kde-frameworks/ki18n:6
	media-sound/fluidsynth:=
	
"
DEPEND="${RDEPEND}
"

# vim: filetype=ebuild
