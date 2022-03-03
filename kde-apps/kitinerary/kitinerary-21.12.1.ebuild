# Distributed under the terms of the GNU General Public License v2

EAPI=7

KDE_TEST="true"
FRAMEWORKS_MINIMAL=5.75.0
QT_MINIMAL=5.15.2
VIRTUALX_REQUIRED="test"
inherit kde5

DESCRIPTION="Data Model and Extraction System for Travel Reservation information"
HOMEPAGE="https://apps.kde.org/en/kontact"
LICENSE="LGPL-2.1+"
SLOT="5"
KEYWORDS="*"
IUSE="+barcode pdf"

REQUIRED_USE="test? ( pdf )"

DEPEND="
	dev-libs/libxml2
	dev-libs/openssl
	$(add_qt_dep qtdeclarative)
	$(add_qt_dep qtgui)
	$(add_kdeapps_dep kmime)
	$(add_kdeapps_dep kpkpass)
	$(add_frameworks_dep karchive)
	$(add_frameworks_dep kcalendarcore)
	$(add_frameworks_dep kcontacts)
	$(add_frameworks_dep ki18n)
	sys-libs/zlib
	barcode? ( >=media-libs/zxing-cpp-1.1.0 )
	pdf? ( app-text/poppler:=[qt5] )
"
RDEPEND="${DEPEND}"
BDEPEND="x11-misc/shared-mime-info"

src_configure() {
	local mycmakeargs=(
		$(cmake-utils_use_find_package barcode ZXing)
		$(cmake-utils_use_find_package pdf Poppler)
	)
	kde5_src_configure
}
