# Distributed under the terms of the GNU General Public License v2

EAPI=7

KDE_HANDBOOK="optional"
KDE_QTHELP="false"
inherit kde5

DESCRIPTION="ECMAScipt compatible parser and engine"
LICENSE="BSD-2 LGPL-2+"
KEYWORDS="*"
IUSE=""

BDEPEND="
	dev-lang/perl
"
DEPEND="
	dev-libs/libpcre
"
RDEPEND="${DEPEND}"

DOCS=( src/README )

src_configure() {
	# FL-8765: KJS fails with -ffast-math, so we'll disable it explicitly.
	append-flags "-fno-fast-math"

	kde5_src_configure
}