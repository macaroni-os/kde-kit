# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake-utils

DESCRIPTION="Unofficial taglib plugins maintained by the Amarok team"
HOMEPAGE="https://websvn.kde.org/trunk/kdesupport/taglib-extras/"
SRC_URI="mirror://kde/stable/${PN}/${PV}/src/${P}.tar.gz"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="*"
IUSE="debug"

DEPEND="media-libs/taglib"
RDEPEND="${DEPEND}"

PATCHES=( "${FILESDIR}/${P}-taglib110.patch" )
