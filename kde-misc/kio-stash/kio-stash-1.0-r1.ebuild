# Distributed under the terms of the GNU General Public License v2

EAPI=7

KDE_TEST="forceoptional"
FRAMEWORKS_MINIMAL=5.98.0
QT_MINIMAL=5.12.3
inherit kde5

DESCRIPTION="KIO Slave and daemon to stash discontinuous file selections"
HOMEPAGE="https://arnavdhamija.com/2017/07/04/kio-stash-shipped/ https://invent.kde.org/utilities/kio-stash"
SRC_URI="mirror://kde/stable/${PN}/${P}.tar.xz"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="*"
IUSE=""

RESTRICT+=" test"

DEPEND="
	$(add_qt_dep qtdbus)
	$(add_frameworks_dep kcoreaddons)
	$(add_frameworks_dep kdbusaddons)
	$(add_frameworks_dep ki18n)
	$(add_frameworks_dep kio)
"
RDEPEND="${DEPEND}"

PATCHES=(
	"${FILESDIR}"/${P}-no-kf5config.patch
	"${FILESDIR}"/${P}-kioslave-no-desktop-app.patch
)
