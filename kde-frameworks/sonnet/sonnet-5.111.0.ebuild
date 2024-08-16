# Distributed under the terms of the GNU General Public License v2

EAPI=7

KDE_DESIGNERPLUGIN="true"
QT_MINIMAL=5.15.1
VIRTUALX_REQUIRED="test"
inherit kde5

DESCRIPTION="Framework for providing spell-checking through abstraction of popular backends"
LICENSE="LGPL-2+ LGPL-2.1+"
KEYWORDS="*"
IUSE="aspell +hunspell nls qml"

BDEPEND="
	nls? ( $(add_qt_dep linguist-tools) )
"
DEPEND="
	$(add_qt_dep qtgui)
	$(add_qt_dep qtwidgets)
	aspell? ( app-text/aspell )
	hunspell? ( app-text/hunspell:= )
	qml? ( $(add_qt_dep qtdeclarative) )
"
RDEPEND="${DEPEND}"

src_configure() {
	local mycmakeargs=(
		$(cmake-utils_use_find_package aspell ASPELL)
		$(cmake-utils_use_find_package hunspell HUNSPELL)
		-DSONNET_USE_QML=$(usex qml)
	)

	kde5_src_configure
}

src_test() {
	# bugs: 680032
	local myctestargs=(
		-E "(sonnet-test_settings|sonnet-test_highlighter)"
	)

	kde5_src_test
}
