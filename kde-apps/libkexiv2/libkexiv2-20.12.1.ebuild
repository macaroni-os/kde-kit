# Distributed under the terms of the GNU General Public License v2

EAPI=7

QT_MINIMAL=5.15.1
inherit kde5

DESCRIPTION="Wrapper around exiv2 library"

LICENSE="GPL-2+"
SLOT="5"
KEYWORDS="*"
IUSE="+xmp"

DEPEND="
	$(add_qt_dep qtgui)
	>=media-gfx/exiv2-0.25:=[xmp=]
"
RDEPEND="${DEPEND}"
