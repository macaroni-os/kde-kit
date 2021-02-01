# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit kde5

DESCRIPTION="Transitional package to pull in plasma-meta plus basic applications"
HOMEPAGE="https://kde.org/"
SRC_URI=""

LICENSE="metapackage"
SLOT="5"
KEYWORDS="*"
IUSE=""

RDEPEND="
	$(add_kdeapps_dep kdecore-meta)
	kde-plasma/plasma-meta
"
