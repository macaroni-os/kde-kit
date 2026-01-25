# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit kde6 xdg

DESCRIPTION="Data Model and Extraction System for Travel Reservation information"
HOMEPAGE="https://apps.kde.org/kontact/"
SRC_URI="https://download.kde.org/stable/release-service/25.12.1/src/kitinerary-25.12.1.tar.xz -> kitinerary-25.12.1.tar.xz"
SLOT="6"
KEYWORDS="*"
RESTRICT="test"
BDEPEND="x11-misc/shared-mime-info
	
"
RDEPEND=">=app-text/poppler-23.12.0:=[qt6]
	dev-libs/libphonenumber
	dev-libs/libxml2:2=
	dev-libs/openssl:=
	dev-qt/qtbase:6[gui]
	dev-qt/qtdeclarative:6
	kde-apps/kmime:6=
	kde-apps/kpkpass:6=
	kde-frameworks/karchive:6
	kde-frameworks/kcalendarcore:6
	kde-frameworks/kcontacts:6
	kde-frameworks/ki18n:6
	>=media-libs/zxing-cpp-1.1.1:=
	sys-libs/zlib
	
"
DEPEND="${RDEPEND}
	
"
src_prepare() {
	  kde6_src_prepare
}


# vim: filetype=ebuild
