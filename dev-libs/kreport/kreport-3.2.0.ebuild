# Distributed under the terms of the GNU General Public License v2

EAPI=7

KDE_QTHELP="true"
KDE_TEST="true"
PYTHON_COMPAT=( python3+ )
FRAMEWORKS_MINIMAL=5.98.0
QT_MINIMAL=5.15.1
VIRTUALX_REQUIRED="test"
inherit kde5 python-any-r1

DESCRIPTION="Framework for creation and generation of reports in multiple formats"
HOMEPAGE="https://community.kde.org/KReport"
SRC_URI="mirror://kde/stable/${PN}/src/${P}.tar.xz"

LICENSE="LGPL-2+"
SLOT="5/4"
KEYWORDS="*"
IUSE="marble +scripting webkit"

RDEPEND="
	>=dev-libs/kproperty-${PV}:5=
	$(add_qt_dep qtgui)
	$(add_qt_dep qtprintsupport)
	$(add_qt_dep qtwidgets)
	$(add_qt_dep qtxml)
	$(add_frameworks_dep kconfig)
	$(add_frameworks_dep kcoreaddons)
	$(add_frameworks_dep kguiaddons)
	$(add_frameworks_dep kwidgetsaddons)
	marble? ( $(add_kdeapps_dep marble) )
	scripting? ( $(add_qt_dep qtdeclarative) )
	webkit? ( >=dev-qt/qtwebkit-5.212.0_pre20180120:5 )
"
DEPEND="${RDEPEND}
	${PYTHON_DEPS}
"

PATCHES=( "${FILESDIR}/${P}-gcc10.patch" )

pkg_setup() {
	python-any-r1_pkg_setup
	kde5_pkg_setup
}

src_configure() {
	local mycmakeargs=(
		$(cmake-utils_use_find_package marble Marble)
		$(cmake-utils_use_find_package webkit Qt5WebKitWidgets)
		-DKREPORT_SCRIPTING=$(usex scripting)
	)
	kde5_src_configure
}
