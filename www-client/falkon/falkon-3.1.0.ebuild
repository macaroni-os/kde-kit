# Distributed under the terms of the GNU General Public License v2

EAPI=7

KDE_TEST="true"
VIRTUALX_REQUIRED="test"
inherit kde5

DESCRIPTION="Cross-platform web browser using QtWebEngine"
HOMEPAGE="https://www.falkon.org/"
SRC_URI="mirror://kde/stable/${PN}/${PV%.0}/${P}.tar.xz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="*"
IUSE="dbus kde libressl +X"

COMMON_DEPEND="
	$(add_qt_dep qtdeclarative 'widgets')
	$(add_qt_dep qtgui)
	$(add_qt_dep qtnetwork 'ssl')
	$(add_qt_dep qtprintsupport)
	$(add_qt_dep qtsql 'sqlite')
	$(add_qt_dep qtwebchannel)
	$(add_qt_dep qtwebengine 'widgets')
	$(add_qt_dep qtwidgets)
	$(add_frameworks_dep karchive)
	virtual/libintl
	dbus? ( $(add_qt_dep qtdbus) )
	kde? (
		$(add_frameworks_dep kcoreaddons)
		$(add_frameworks_dep kcrash)
		$(add_frameworks_dep kio)
		$(add_frameworks_dep kwallet)
		$(add_frameworks_dep purpose)
	)
	libressl? ( dev-libs/libressl:= )
	!libressl? ( dev-libs/openssl:0= )
	X? (
		$(add_qt_dep qtx11extras)
		x11-libs/libxcb:=
		x11-libs/xcb-util
	)
"
DEPEND="${COMMON_DEPEND}
	$(add_qt_dep linguist-tools)
	$(add_qt_dep qtconcurrent)
	$(add_frameworks_dep ki18n)
"
RDEPEND="${COMMON_DEPEND}
	!www-client/qupzilla
	$(add_qt_dep qtsvg)
"

PATCHES=(
	"${FILESDIR}/${P}-use-cmake-find-intl.patch"
	"${FILESDIR}/${P}-fix-warn-registering-schemes.patch"
	"${FILESDIR}/${P}-qt-5.14.patch"
	"${FILESDIR}/${P}-qt-5.15.patch"
)

# bug 653046
RESTRICT+=" test"

src_configure() {
	local mycmakeargs=(
		-DBUILD_KEYRING=OFF
		-DCMAKE_DISABLE_FIND_PACKAGE_PySide2=ON
		-DCMAKE_DISABLE_FIND_PACKAGE_Shiboken2=ON
		-DCMAKE_DISABLE_FIND_PACKAGE_PythonLibs=ON
		-DDISABLE_DBUS=$(usex !dbus)
		$(cmake-utils_use_find_package kde KF5Wallet)
		$(cmake-utils_use_find_package kde KF5KIO)
		-DNO_X11=$(usex !X)
	)
	kde5_src_configure
}

pkg_postinst() {
	kde5_pkg_postinst
	elog "If you were previously using QupZilla, you can manually migrate your profiles"
	elog "by moving the config directory from ~/.config/qupzilla to ~/.config/falkon"
}
