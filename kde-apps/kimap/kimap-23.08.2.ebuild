# Distributed under the terms of the GNU General Public License v2

EAPI=7

KDE_TEST="forceoptional"
FRAMEWORKS_MINIMAL=5.98.0
QT_MINIMAL=5.15.1
inherit kde5

DESCRIPTION="Library for interacting with IMAP servers"
HOMEPAGE="https://api.kde.org/kdepim/kimap/html/index.html"
LICENSE="GPL-2+"
SLOT="5"
KEYWORDS="*"
IUSE=""

RDEPEND="
	dev-libs/cyrus-sasl
	$(add_qt_dep qtgui)
	$(add_kdeapps_dep kmime)
	$(add_frameworks_dep kcodecs)
	$(add_frameworks_dep kcoreaddons)
	$(add_frameworks_dep ki18n)
	$(add_frameworks_dep kio)
"
# TODO: Convince upstream not to install stuff with tests
DEPEND="${RDEPEND}
	test? ( $(add_qt_dep qtnetwork) )
"

src_test() {
	# tests cannot be run in parallel #605586
	local myctestargs=(
		-j1
	)
	kde5_src_test
}