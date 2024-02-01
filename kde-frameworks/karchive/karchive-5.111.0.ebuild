# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit kde5

DESCRIPTION="Framework for reading, creation, and manipulation of various archive formats"
LICENSE="GPL-2 LGPL-2.1"
KEYWORDS="*"
IUSE=""

DEPEND="
	app-arch/bzip2
	app-arch/xz-utils
	sys-libs/zlib
"
RDEPEND="${DEPEND}
	virtual/pkgconfig
"
