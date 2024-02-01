# Distributed under the terms of the GNU General Public License v2

EAPI=7

FRAMEWORKS_MINIMAL=5.98.0
QT_MINIMAL=5.12.3
inherit kde5

DESCRIPTION="Write hybrid ISO files onto a USB disk"
HOMEPAGE="https://community.kde.org/ISOImageWriter"
SRC_URI="mirror://kde/unstable/${PN}/${PV}/${P}.tar.xz"

LICENSE="GPL-3"
SLOT="5"
KEYWORDS="*"
IUSE=""

DEPEND="
	app-crypt/gpgme[cxx,qt5]
	$(add_qt_dep qtgui)
	$(add_qt_dep qtwidgets)
	$(add_frameworks_dep kauth)
	$(add_frameworks_dep kcoreaddons)
	$(add_frameworks_dep ki18n)
	virtual/libudev:=
"
RDEPEND="${DEPEND}"
