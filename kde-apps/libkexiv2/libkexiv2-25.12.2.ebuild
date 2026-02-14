# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit cmake

DESCRIPTION="Wrapper around exiv2 library"
HOMEPAGE="https://invent.kde.org/"
SRC_URI="https://download.kde.org/stable/release-service/25.12.2/src/libkexiv2-25.12.2.tar.xz -> libkexiv2-25.12.2.tar.xz"
SLOT="6"
KEYWORDS="*"
IUSE="+xmp"
RDEPEND="virtual/kde-seed[gui]
	>=media-gfx/exiv2-0.25:=[xmp=]
	
"
DEPEND="${RDEPEND}
"

# vim: filetype=ebuild
