# Distributed under the terms of the GNU General Public License v2

EAPI=7

FRAMEWORKS_MINIMAL=5.75.0
inherit kde5

DESCRIPTION="KWallet extension for signond"
HOMEPAGE="https://accounts-sso.gitlab.io/"
LICENSE="GPL-2+"
SLOT="5"
KEYWORDS="*"

DEPEND="
	$(add_frameworks_dep kwallet)
	net-libs/signond
"
RDEPEND="${DEPEND}"