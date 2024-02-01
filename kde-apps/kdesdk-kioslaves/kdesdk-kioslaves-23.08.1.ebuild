# Distributed under the terms of the GNU General Public License v2

EAPI=7

FRAMEWORKS_MINIMAL=5.98.0
inherit kde5

DESCRIPTION="kioslaves from kdesdk package"
SRC_URI="https://download.kde.org/stable/release-service/${PV}/src/kdesdk-kio-${PV}.tar.xz"
LICENSE="GPL-2" # TODO: CHECK
SLOT="5"
KEYWORDS="*"
IUSE=""

DEPEND="
	dev-lang/perl
	$(add_frameworks_dep kcoreaddons)
	$(add_frameworks_dep ki18n)
	$(add_frameworks_dep kio)
"
RDEPEND="${DEPEND}"

S="${WORKDIR}/kdesdk-kio-${PV}"
