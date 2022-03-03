# Distributed under the terms of the GNU General Public License v2

EAPI=7

QT_MINIMAL=5.15.2
inherit kde5

DESCRIPTION="Digital camera raw image library wrapper"
LICENSE="GPL-2+"
SLOT="5"
KEYWORDS="*"
IUSE=""

DEPEND="
	$(add_qt_dep qtgui)
	>=media-libs/libraw-0.16:=
"
RDEPEND="${DEPEND}"