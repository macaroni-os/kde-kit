# Distributed under the terms of the GNU General Public License v2

EAPI=7

QT_MINIMAL=5.15.1
VIRTUALX_REQUIRED="test"
inherit kde5

DESCRIPTION="Framework for reading and writing configuration"
LICENSE="LGPL-2+"
KEYWORDS="*"
IUSE="dbus nls qml"

BDEPEND="
	nls? ( $(add_qt_dep linguist-tools) )
"
RDEPEND="
	$(add_qt_dep qtgui)
	$(add_qt_dep qtxml)
	dbus? ( $(add_qt_dep qtdbus) )
	qml? ( $(add_qt_dep qtdeclarative) )
"
DEPEND="${RDEPEND}
	test? ( $(add_qt_dep qtconcurrent) )
"

# bug 560086
RESTRICT+=" test"

DOCS=( DESIGN docs/DESIGN.kconfig docs/options.md )

src_configure() {
	local mycmakeargs=(
		-DCMAKE_DISABLE_FIND_PACKAGE_PythonModuleGeneration=ON # bug 746866
		-DKCONFIG_USE_DBUS=$(usex dbus)
		-DKCONFIG_USE_QML=$(usex qml)
	)
	kde5_src_configure
}
