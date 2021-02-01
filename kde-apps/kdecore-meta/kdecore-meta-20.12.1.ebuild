# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit kde5

DESCRIPTION="kdecore - merge this to pull in the most basic applications"
HOMEPAGE="https://kde.org/"
SRC_URI=""

LICENSE="metapackage"
SLOT="5"
KEYWORDS="*"
IUSE="+handbook +share +thumbnail +webengine"

RDEPEND="
	$(add_kdeapps_dep dolphin)
	$(add_kdeapps_dep kdialog)
	$(add_kdeapps_dep keditbookmarks)
	$(add_kdeapps_dep kfind)
	$(add_kdeapps_dep konsole)
	$(add_kdeapps_dep kwrite)
	handbook? ( $(add_kdeapps_dep khelpcenter) )
	webengine? ( || (
		www-client/falkon
		$(add_kdeapps_dep konqueror)
	) )
"
# Optional runtime deps: kde-apps/dolphin
RDEPEND="${RDEPEND}
	share? ( kde-frameworks/purpose:${SLOT} )
	thumbnail? (
		$(add_kdeapps_dep ffmpegthumbs)
		$(add_kdeapps_dep thumbnailers)
	)
"
