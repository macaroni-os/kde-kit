# Distributed under the terms of the GNU General Public License v2

EAPI=7

QT_MINIMAL=5.15.1
VIRTUALX_REQUIRED="test"
inherit eutils kde5

DESCRIPTION="Provider for platform independent hardware discovery, abstraction and management"
LICENSE="LGPL-2.1+"
KEYWORDS="*"
IUSE="ios nls"

BDEPEND="
	sys-devel/bison
	sys-devel/flex
	nls? ( $(add_qt_dep linguist-tools) )
"
RDEPEND="
	$(add_qt_dep qtdbus)
	$(add_qt_dep qtgui)
	$(add_qt_dep qtdeclarative)
	$(add_qt_dep qtxml)
	sys-fs/udisks:2
	virtual/libudev:=
	ios? (
		app-pda/libimobiledevice:=
		app-pda/libplist:=
	)
"
DEPEND="${RDEPEND}
	test? ( $(add_qt_dep qtconcurrent) )
"

src_configure() {
	local mycmakeargs=(
		$(cmake-utils_use_find_package ios IMobileDevice)
		$(cmake-utils_use_find_package ios PList)
	)
	kde5_src_configure
}

pkg_postinst() {
	if [[ -z "${REPLACING_VERSIONS}" ]]; then
		elog "Optional dependencies:"
		optfeature "Media player devices support" app-misc/media-player-info
	fi
	kde5_pkg_postinst
}
