# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="kdeaccessibility - merge this to pull in all kdeaccessiblity-derived packages"
HOMEPAGE="https://kde.org/"

LICENSE="metapackage"
SLOT="5"
KEYWORDS="*"
IUSE=""

RDEPEND="
	>=app-accessibility/kontrast-${PV}:${SLOT}
	>=kde-apps/kmag-${PV}:${SLOT}
	>=kde-apps/kmousetool-${PV}:${SLOT}
	>=kde-apps/kmouth-${PV}:${SLOT}
"
