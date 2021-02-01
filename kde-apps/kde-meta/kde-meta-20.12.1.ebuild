# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit kde5

DESCRIPTION="Merge this to pull in all KDE Plasma and Applications packages"
HOMEPAGE="https://kde.org/"
SRC_URI=""

LICENSE="metapackage"
SLOT="5"
KEYWORDS="*"
IUSE=""

RDEPEND="
	$(add_kdeapps_dep kde-apps-meta)
	kde-plasma/plasma-meta:5
"
