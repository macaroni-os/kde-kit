# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit kde6

DESCRIPTION="Framework providing data models to help with tasks such as sorting and filtering"
HOMEPAGE="https://invent.kde.org/frameworks/"
SRC_URI="https://download.kde.org/stable/frameworks/6.22/kitemmodels-6.22.0.tar.xz -> kitemmodels-6.22.0.tar.xz"
SLOT="6"
KEYWORDS="*"
RDEPEND="dev-qt/qtdeclarative:6
	
"
DEPEND="${RDEPEND}
	test? ( dev-qt/qtbase:6 )
	
"
src_test() {
	  LC_NUMERIC="C" kde6_src_test # bug 708820
}


# vim: filetype=ebuild
