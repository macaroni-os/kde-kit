# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit kde5

DESCRIPTION="KDE administration tools - merge this to pull in all kdeadmin-derived packages"
HOMEPAGE="https://kde.org/"
SRC_URI=""

LICENSE="metapackage"
SLOT="5"
KEYWORDS="*"
IUSE="+cron"

RDEPEND="
	$(add_kdeapps_dep ksystemlog)
	cron? ( $(add_kdeapps_dep kcron) )
"
