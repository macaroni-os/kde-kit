# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit kde5

DESCRIPTION="kdemultimedia - merge this to pull in all kdemultimedia-derived packages"
HOMEPAGE="https://apps.kde.org/multimedia https://multimedia.kde.org/"
SRC_URI=""

LICENSE="metapackage"
SLOT="5"
KEYWORDS="*"
IUSE="+cdrom +ffmpeg gstreamer"

RDEPEND="
	$(add_kdeapps_dep dragon)
	$(add_kdeapps_dep juk)
	$(add_kdeapps_dep kdenlive)
	$(add_kdeapps_dep kmix)
	$(add_kdeapps_dep kwave)
	>=media-sound/elisa-${PV}:${SLOT}
	cdrom? (
		$(add_kdeapps_dep audiocd-kio)
		$(add_kdeapps_dep k3b)
		$(add_kdeapps_dep libkcddb)
		$(add_kdeapps_dep libkcompactdisc)
	)
	ffmpeg? ( $(add_kdeapps_dep ffmpegthumbs) )
	gstreamer? ( $(add_kdeapps_dep kamoso) )
"
