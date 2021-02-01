# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit kde5

DESCRIPTION="Meta package for the KDE Release Service collection"
HOMEPAGE="https://kde.org/"
SRC_URI=""

LICENSE="metapackage"
SLOT="5"
KEYWORDS="*"
IUSE="accessibility +admin +education +games +graphics +multimedia +network pim sdk +utils"

RDEPEND="
	$(add_kdeapps_dep kdecore-meta)
	accessibility? ( $(add_kdeapps_dep kdeaccessibility-meta) )
	admin? ( $(add_kdeapps_dep kdeadmin-meta) )
	education? ( $(add_kdeapps_dep kdeedu-meta) )
	games? ( $(add_kdeapps_dep kdegames-meta) )
	graphics? ( $(add_kdeapps_dep kdegraphics-meta) )
	multimedia? ( $(add_kdeapps_dep kdemultimedia-meta) )
	network? ( $(add_kdeapps_dep kdenetwork-meta) )
	pim? ( $(add_kdeapps_dep kdepim-meta) )
	sdk? ( $(add_kdeapps_dep kdesdk-meta) )
	utils? ( $(add_kdeapps_dep kdeutils-meta) )
"
