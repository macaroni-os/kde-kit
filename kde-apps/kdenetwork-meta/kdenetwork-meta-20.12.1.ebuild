# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit kde5

DESCRIPTION="kdenetwork - merge this to pull in all kdenetwork-derived packages"
HOMEPAGE="https://kde.org/"
SRC_URI=""

LICENSE="metapackage"
SLOT="5"
KEYWORDS="*"
IUSE="+bittorrent dropbox +webengine"

RDEPEND="
	$(add_kdeapps_dep kdenetwork-filesharing)
	$(add_kdeapps_dep kget)
	$(add_kdeapps_dep kopete)
	$(add_kdeapps_dep krdc)
	$(add_kdeapps_dep krfb)
	$(add_kdeapps_dep zeroconf-ioslave)
	>=kde-misc/kdeconnect-${PV}:${SLOT}
	>=kde-misc/kio-gdrive-${PV}:${SLOT}
	>=net-irc/konversation-${PV}:${SLOT}
	bittorrent? (
		>=net-libs/libktorrent-${PV}:${SLOT}
		>=net-p2p/ktorrent-${PV}:${SLOT}
	)
	dropbox? ( $(add_kdeapps_dep dolphin-plugins-dropbox) )
	webengine? ( $(add_kdeapps_dep plasma-telepathy-meta) )
"
