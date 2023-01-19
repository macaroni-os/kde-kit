# Distributed under the terms of the GNU General Public License v2

EAPI=7

EGIT_BRANCH="5.1"
KDE_HANDBOOK="optional"
KDE_TEST="forceoptional"
FRAMEWORKS_MINIMAL=5.74.0
QT_MINIMAL=5.15.1
VIRTUALX_REQUIRED="test"
VIRTUALDBUS_TEST="true"
inherit eutils kde5

DESCRIPTION="Personal finance manager based on KDE Frameworks"
HOMEPAGE="https://kmymoney.org/"
SRC_URI="mirror://kde/stable/${PN}/${PV}/src/${P}.tar.xz"

LICENSE="GPL-2"
SLOT="5"
KEYWORDS="*"
IUSE="activities addressbook calendar hbci holidays"

BDEPEND="virtual/pkgconfig"
RDEPEND="
	>=app-crypt/gpgme-1.7.1-r1[cxx]
	>=app-office/libalkimia-7.0.0:=
	dev-db/sqlcipher
	dev-libs/gmp:0=[cxx]
	dev-libs/kdiagram:5
	dev-libs/libgpg-error
	dev-libs/libofx:=
	$(add_qt_dep qtdbus)
	$(add_qt_dep qtgui)
	$(add_qt_dep qtnetwork)
	$(add_qt_dep qtprintsupport)
	$(add_qt_dep qtsql)
	$(add_qt_dep qtsvg)
	$(add_qt_dep qtwebengine widgets)
	$(add_qt_dep qtwidgets)
	$(add_qt_dep qtxml)
	$(add_frameworks_dep karchive)
	$(add_frameworks_dep kcmutils)
	$(add_frameworks_dep kcodecs)
	$(add_frameworks_dep kcompletion)
	$(add_frameworks_dep kconfig)
	$(add_frameworks_dep kconfigwidgets)
	$(add_frameworks_dep kcoreaddons)
	$(add_frameworks_dep ki18n)
	$(add_frameworks_dep kiconthemes)
	$(add_frameworks_dep kio)
	$(add_frameworks_dep kitemmodels)
	$(add_frameworks_dep kitemviews)
	$(add_frameworks_dep kjobwidgets)
	$(add_frameworks_dep knotifications)
	$(add_frameworks_dep kservice)
	$(add_frameworks_dep ktextwidgets)
	$(add_frameworks_dep kwallet)
	$(add_frameworks_dep kwidgetsaddons)
	$(add_frameworks_dep kxmlgui)
	$(add_frameworks_dep sonnet)
	activities? ( $(add_frameworks_dep kactivities) )
	addressbook? (
		$(add_kdeapps_dep akonadi)
		$(add_kdeapps_dep kidentitymanagement)
		$(add_frameworks_dep kcontacts)
	)
	calendar? ( dev-libs/libical:= )
	hbci? (
		>=net-libs/aqbanking-6.0.1
		>=sys-libs/gwenhywfar-5.1.2:=[qt5]
	)
	holidays? ( $(add_frameworks_dep kholidays) )
"
DEPEND="${RDEPEND}
	dev-libs/boost
"

src_configure() {
	local mycmakeargs=(
		-DENABLE_OFXIMPORTER=ON
		-DENABLE_WEBENGINE=ON
		-DENABLE_WEBOOB=OFF
		-DUSE_QT_DESIGNER=OFF
		$(cmake-utils_use_find_package activities KF5Activities)
		$(cmake-utils_use_find_package addressbook KF5Akonadi)
		$(cmake-utils_use_find_package addressbook KF5Contacts)
		$(cmake-utils_use_find_package addressbook KF5IdentityManagement)
		-DENABLE_LIBICAL=$(usex calendar)
		-DENABLE_KBANKING=$(usex hbci)
		$(cmake-utils_use_find_package holidays KF5Holidays)
	)

	kde5_src_configure
}

src_test() {
	# bug 652636; bug 673052: needs kmymoney installed to succeed
	local myctestargs=(
		-E "(reports-chart-test|qsqlcipher-test)"
	)

	kde5_src_test
}

pkg_postinst() {
	if [[ -z "${REPLACING_VERSIONS}" ]]; then
		elog "Optional dependencies:"
		optfeature "More options for online stock quote retrieval" dev-perl/Finance-Quote
	fi
	if has_version "app-office/kmymoney[quotes]"; then
		elog "Please note: IUSE=quotes flag is gone in ${PN}-5.1.1. ${PN} still"
		elog "does online stock quote retrieval without it, but dev-perl/Finance-Quote"
		elog "may provide additional sources. To keep the functionality, run:"
		elog "  emerge --noreplace dev-perl/Finance-Quote"
	fi
	kde5_pkg_postinst
}
