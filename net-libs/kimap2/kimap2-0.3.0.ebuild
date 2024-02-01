# Distributed under the terms of the GNU General Public License v2

EAPI=7

FRAMEWORKS_MINIMAL=5.98.0
QT_MINIMAL=5.12.3
inherit kde5

DESCRIPTION="Library for interacting with IMAP servers - successor of kimap"
SRC_URI="mirror://kde/unstable/${PN}/${PV}/src/${P}.tar.xz"

LICENSE="LGPL-2+"
SLOT="5"
KEYWORDS="*"

DEPEND="
	dev-libs/cyrus-sasl:2
	$(add_qt_dep qtnetwork ssl)
	$(add_kdeapps_dep kmime)
	$(add_frameworks_dep kcodecs)
	$(add_frameworks_dep kcoreaddons)
"
RDEPEND="${DEPEND}"

RESTRICT+=" test"
