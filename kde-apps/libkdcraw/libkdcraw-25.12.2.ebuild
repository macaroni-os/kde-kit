# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit cmake

DESCRIPTION="Digital camera raw image library wrapper"
HOMEPAGE="https://invent.kde.org/"
SRC_URI="https://download.kde.org/stable/release-service/25.12.2/src/libkdcraw-25.12.2.tar.xz -> libkdcraw-25.12.2.tar.xz"
SLOT="6"
KEYWORDS="*"
RDEPEND="virtual/kde-seed[gui]
	>=media-libs/libraw-0.16:=
	
"
DEPEND="${RDEPEND}
"

# vim: filetype=ebuild
