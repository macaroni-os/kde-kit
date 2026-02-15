# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit cmake

DESCRIPTION="SANE Library interface based on KDE Frameworks"
HOMEPAGE="https://invent.kde.org/"
SRC_URI="https://download.kde.org/stable/release-service/25.12.2/src/libksane-25.12.2.tar.xz -> libksane-25.12.2.tar.xz"
SLOT="6"
KEYWORDS="*"
IUSE="kwallet"
RDEPEND="virtual/kde-seed[gui]
	>=kde-apps/libksane-common
	kde-frameworks/ki18n:6
	kde-frameworks/ktextwidgets:6
	kde-frameworks/kwidgetsaddons:6
	media-libs/ksanecore:6
	kwallet? ( kde-frameworks/kwallet:6 )
	
"
DEPEND="${RDEPEND}
"

# vim: filetype=ebuild
