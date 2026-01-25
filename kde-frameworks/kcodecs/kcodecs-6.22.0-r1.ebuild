# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit kde6

DESCRIPTION="Framework for manipulating strings using various encodings"
HOMEPAGE="https://invent.kde.org/frameworks/"
SRC_URI="https://download.kde.org/stable/frameworks/6.22/kcodecs-6.22.0.tar.xz -> kcodecs-6.22.0.tar.xz"
SLOT="6"
KEYWORDS="*"
BDEPEND="dev-qt/qttools:6[linguist]
	
"
CMAKE_SKIP_TESTS=(
	  # bug 938317
	  rfc2047test
	  kemailaddresstest
)


# vim: filetype=ebuild
