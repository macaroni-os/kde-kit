# Distributed under the terms of the GNU General Public License v2

EAPI=7

FRAMEWORKS_MINIMAL=5.98.0
QT_MINIMAL=5.15.2
inherit kde5

DESCRIPTION="DNSSD (DNS Service Discovery - part of Rendezvous) ioslave and kded module"
SRC_URI="https://download.kde.org/stable/release-service/${PV}/src/kio-zeroconf-${PV}.tar.xz"
LICENSE="GPL-2" # TODO: CHECK
SLOT="5"
KEYWORDS="*"
IUSE=""

DEPEND="
	$(add_qt_dep qtdbus)
	$(add_frameworks_dep kcoreaddons)
	$(add_frameworks_dep kdbusaddons)
	$(add_frameworks_dep kdnssd)
	$(add_frameworks_dep ki18n)
	$(add_frameworks_dep kio)
"
RDEPEND="${DEPEND}"

S="${WORKDIR}/kio-zeroconf-${PV}"
