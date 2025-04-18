# Distributed under the terms of the GNU General Public License v2

EAPI=7

VIRTUALX_REQUIRED="test"
inherit kde5

MY_PN=kImageAnnotator
MY_P="${MY_PN}-${PV}"

DESCRIPTION="Tool for annotating images"
HOMEPAGE="https://github.com/ksnip/kImageAnnotator"
SRC_URI="https://github.com/ksnip/${MY_PN}/archive/v${PV}.tar.gz -> ${MY_P}.tar.gz"

LICENSE="LGPL-3+"
SLOT="0"
KEYWORDS="*"
IUSE="test"

RDEPEND="
	$(add_qt_dep qtcore)
	$(add_qt_dep qtgui)
	$(add_qt_dep qtsvg)
	$(add_qt_dep qtwidgets png)
	>=media-libs/kcolorpicker-0.1.6
	x11-libs/libX11
"
DEPEND="${RDEPEND}
	test? ( $(add_qt_dep qttest) )
"
BDEPEND="
	$(add_qt_dep linguist-tools)
"

S="${WORKDIR}/${MY_P}"

src_configure() {
	local mycmakeargs+=(
		-DBUILD_TESTS=$(usex test)
	)
	kde5_src_configure
}
