# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit cmake

DESCRIPTION="Library for accessing Google calendar and contact resources"
HOMEPAGE="https://api.kde.org/kdepim/libkgapi/html/index.html"
SRC_URI="https://download.kde.org/stable/release-service/25.12.2/src/libkgapi-25.12.2.tar.xz -> libkgapi-25.12.2.tar.xz"
SLOT="6"
KEYWORDS="*"
BDEPEND="dev-qt/qttools:6[linguist]
	
"
RDEPEND="virtual/kde-seed[gui]
	dev-libs/cyrus-sasl:2
	kde-frameworks/kcalendarcore:6
	kde-frameworks/kcontacts:6
	kde-frameworks/kwallet:6
	
"
DEPEND="${RDEPEND}
"

# vim: filetype=ebuild
