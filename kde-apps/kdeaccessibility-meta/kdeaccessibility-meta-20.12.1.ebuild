# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit kde5

DESCRIPTION="kdeaccessibility - merge this to pull in all kdeaccessiblity-derived packages"
HOMEPAGE="https://kde.org/"
SRC_URI=""

LICENSE="metapackage"
SLOT="5"
KEYWORDS="*"
IUSE=""

RDEPEND="
	>=app-accessibility/kontrast-${PV}:${SLOT}
	$(add_kdeapps_dep kmag)
	$(add_kdeapps_dep kmousetool)
	$(add_kdeapps_dep kmouth)
"
