# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit kde6

DESCRIPTION="Library to determine holidays and other special events for a geographical region"
HOMEPAGE="https://invent.kde.org/frameworks/"
SRC_URI="https://download.kde.org/stable/frameworks/6.22/kholidays-6.22.0.tar.xz -> kholidays-6.22.0.tar.xz"
SLOT="6"
KEYWORDS="*"
BDEPEND="dev-qt/qttools:6[linguist]
	
"
RDEPEND="dev-qt/qtdeclarative:6
	
"
DEPEND="${RDEPEND}
	
"
src_test() {
	  # bug 624214
	  mkdir -p "${HOME}/.local/share/kf6/libkholidays" || die
	  cp -r "${S}/holidays/plan2" "${HOME}/.local/share/kf6/libkholidays/" || die
	  kde6_src_test
}


# vim: filetype=ebuild
