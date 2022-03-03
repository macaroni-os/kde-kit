# Distributed under the terms of the GNU General Public License v2

EAPI=7

KDE_TEST="true"
inherit kde5

DESCRIPTION="LL(1) parser generator used mainly by KDevelop language plugins"
HOMEPAGE="https://www.kdevelop.org/"
SRC_URI="mirror://kde/stable/${PN}/${PV}/src/${P}.tar.xz"

LICENSE="LGPL-2+ LGPL-2.1+"
SLOT="5"
KEYWORDS="*"
IUSE=""

BDEPEND="
	sys-devel/bison
	sys-devel/flex
"
