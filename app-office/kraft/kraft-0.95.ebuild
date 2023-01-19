# Distributed under the terms of the GNU General Public License v2

EAPI=7

VIRTUALX_REQUIRED="test"
inherit kde5

DESCRIPTION="Software to manage quotes and invoices in small enterprises"
HOMEPAGE="https://www.volle-kraft-voraus.de/"
SRC_URI="https://github.com/dragotin/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2+ LGPL-2+"
SLOT="5"
KEYWORDS="*"
IUSE="pim"

RESTRICT+=" test" # requires package installed, bug 745408

DEPEND="
	dev-cpp/ctemplate
	dev-libs/grantlee:5
	$(add_qt_dep qtgui)
	$(add_qt_dep qtsql)
	$(add_qt_dep qtwidgets)
	$(add_qt_dep qtxml)
	$(add_frameworks_dep kconfig)
	$(add_frameworks_dep kcontacts)
	$(add_frameworks_dep ki18n)
	pim? (
		$(add_kdeapps_dep akonadi)
		$(add_kdeapps_dep akonadi-contacts)
		$(add_frameworks_dep kcoreaddons)
	)
"
RDEPEND="${DEPEND}"

DOCS=( AUTHORS Changes.txt README.md Releasenotes.txt TODO )

PATCHES=( "${FILESDIR}/${P}-i18n-warning.patch" )

src_configure() {
	local mycmakeargs=(
		-DCMAKE_DISABLE_FIND_PACKAGE_Asciidoctor=ON
		$(cmake-utils_use_find_package pim KF5Akonadi)
		$(cmake-utils_use_find_package pim KF5AkonadiContact)
	)

	kde5_src_configure
}
