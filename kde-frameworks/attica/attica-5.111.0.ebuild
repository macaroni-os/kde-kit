# Distributed under the terms of the GNU General Public License v2

EAPI=7

QT_MINIMAL=5.15.1
inherit kde5

DESCRIPTION="Framework providing access to Open Collaboration Services"
LICENSE="LGPL-2.1+"
KEYWORDS="*"
IUSE=""

RDEPEND="
	$(add_qt_dep qtnetwork)
"
DEPEND="${RDEPEND}"

src_test() {
	# requires network access, bug #661230
	local myctestargs=(
		-E "(providertest)"
	)

	kde5_src_test
}