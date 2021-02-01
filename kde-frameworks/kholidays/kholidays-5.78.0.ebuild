# Distributed under the terms of the GNU General Public License v2

EAPI=7

KDE_QTHELP="false"
KDE_TEST="true"
QT_MINIMAL=5.15.1
inherit kde5

DESCRIPTION="Library to determine holidays and other special events for a geographical region"
LICENSE="LGPL-2.1+"
KEYWORDS="*"
IUSE="nls"

BDEPEND="
	nls? ( $(add_qt_dep linguist-tools) )
"
DEPEND="
	$(add_qt_dep qtdeclarative)
"
RDEPEND="${DEPEND}"

src_test() {
	# bug 624214
	mkdir -p "${HOME}/.local/share/kf5/libkholidays" || die
	cp -r "${S}/holidays/plan2" "${HOME}/.local/share/kf5/libkholidays/" || die
	kde5_src_test
}
