# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit cmake

DESCRIPTION="Framework for common completion tasks such as filename or URL completion"
HOMEPAGE="https://invent.kde.org/frameworks/"
SRC_URI="https://download.kde.org/stable/frameworks/6.22/kcompletion-6.22.0.tar.xz -> kcompletion-6.22.0.tar.xz"
LICENSE="GPL-2"
SLOT="6"
KEYWORDS="*"
BDEPEND="dev-qt/qttools:6[linguist]
	
"
RDEPEND="virtual/kde-seed[gui]
	kde-frameworks/kcodecs:6
	kde-frameworks/kconfig:6
	kde-frameworks/kcoreaddons:6
	kde-frameworks/kwidgetsaddons:6
	
"
DEPEND="${RDEPEND}
"

# vim: filetype=ebuild
