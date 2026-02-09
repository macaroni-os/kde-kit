# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit cmake

DESCRIPTION="KDE library for CDDB"
HOMEPAGE="https://invent.kde.org/"
SRC_URI="https://download.kde.org/stable/release-service/25.12.2/src/libkcddb-25.12.2.tar.xz -> libkcddb-25.12.2.tar.xz"
SLOT="6"
KEYWORDS="*"
IUSE="musicbrainz"
BDEPEND="kde-frameworks/kcmutils:6
	
"
RDEPEND="virtual/kde-seed[gui]
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

# vim: filetype=ebuild
