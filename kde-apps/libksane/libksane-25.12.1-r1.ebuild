# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit kde6 xdg

DESCRIPTION="SANE Library interface based on KDE Frameworks"
HOMEPAGE="https://invent.kde.org/"
SRC_URI="https://download.kde.org/stable/release-service/25.12.1/src/libksane-25.12.1.tar.xz -> libksane-25.12.1.tar.xz"
SLOT="6"
KEYWORDS="*"
IUSE="kwallet"
RDEPEND=">=kde-apps/libksane-common
	
"
DEPEND="${RDEPEND}
	dev-qt/qtbase:6[gui]
	kde-frameworks/ki18n:6
	kde-frameworks/ktextwidgets:6
	kde-frameworks/kwidgetsaddons:6
	media-libs/ksanecore:6
	kwallet? ( kde-frameworks/kwallet:6 )
	
"
src_prepare() {
	  kde6_src_prepare
}


# vim: filetype=ebuild
