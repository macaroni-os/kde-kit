# Distributed under the terms of the GNU General Public License v2

EAPI=7

VIRTUALX_REQUIRED="test"
inherit kde5

MY_PN=kColorPicker
MY_P="${MY_PN}-${PV}"

DESCRIPTION="Qt based color picker with popup menu"
HOMEPAGE="https://github.com/ksnip/kColorPicker"
SRC_URI="https://github.com/ksnip/${MY_PN}/archive/v${PV}.tar.gz -> ${MY_P}.tar.gz"

LICENSE="LGPL-3+"
SLOT="0"
KEYWORDS="*"
IUSE="test"

RDEPEND="
	$(add_qt_dep qtcore)
	$(add_qt_dep qtgui)
	$(add_qt_dep qtwidgets png)
"
DEPEND="${RDEPEND}
	test? ( $(add_qt_dep qttest) )
"

S="${WORKDIR}/${MY_P}"

src_configure() {
	local mycmakeargs+=(
		-DBUILD_TESTS=$(usex test)
	)
	kde5_src_configure
}
