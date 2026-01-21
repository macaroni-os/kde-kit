# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit kde6

DESCRIPTION="KDE library for CDDB"
HOMEPAGE="https://invent.kde.org/"
SRC_URI="https://download.kde.org/stable/release-service/25.12.1/src/libkcddb-25.12.1.tar.xz -> libkcddb-25.12.1.tar.xz"
SLOT="6"
KEYWORDS="*"
IUSE="musicbrainz"
RESTRICT="test"
BDEPEND="kde-frameworks/kcmutils:6
	
"
RDEPEND="dev-qt/qtbase:6[gui]
	kde-frameworks/kcmutils:6
	kde-frameworks/kconfig:6
	kde-frameworks/kcoreaddons:6
	kde-frameworks/ki18n:6
	kde-frameworks/kio:6
	kde-frameworks/kwidgetsaddons:6
	musicbrainz? ( media-libs/musicbrainz:5 )
	
"
DEPEND="${RDEPEND}
	
"
src_prepare() {
	  kde6_src_prepare
}


# vim: filetype=ebuild
