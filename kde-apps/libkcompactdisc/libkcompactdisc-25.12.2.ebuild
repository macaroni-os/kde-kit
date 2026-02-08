# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit kde6

DESCRIPTION="Library for playing & ripping CDs"
HOMEPAGE="https://invent.kde.org/"
SRC_URI="https://download.kde.org/stable/release-service/25.12.2/src/libkcompactdisc-25.12.2.tar.xz -> libkcompactdisc-25.12.2.tar.xz"
SLOT="6"
KEYWORDS="*"
IUSE="alsa"
RDEPEND="dev-qt/qtbase:6
	kde-frameworks/ki18n:6
	kde-frameworks/solid:6
	>=media-libs/phonon-4.12.0[qt6(+)]
	alsa? ( media-libs/alsa-lib )
	
"
DEPEND="${RDEPEND}
	
"
src_prepare() {
	  kde6_src_prepare
}


# vim: filetype=ebuild
