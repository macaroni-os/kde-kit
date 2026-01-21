# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit kde6

DESCRIPTION="Thumbnail generator for PO files"
HOMEPAGE="https://invent.kde.org/"
SRC_URI="https://download.kde.org/stable/release-service/25.12.1/src/kdesdk-thumbnailers-25.12.1.tar.xz -> kdesdk-thumbnailers-25.12.1.tar.xz"
SLOT="6"
KEYWORDS="*"
RDEPEND="!<kde-apps/kdesdk-thumbnailers-24.05.2-r1:5
	!kde-apps/kdesdk-thumbnailers-common
	
"
DEPEND="${RDEPEND}
	dev-qt/qtbase:6[gui]
	kde-frameworks/kconfig:6
	kde-frameworks/ki18n:6
	kde-frameworks/kio:6
	kde-frameworks/kwidgetsaddons:6
	sys-devel/gettext
	
"
src_prepare() {
	  kde6_src_prepare
}


# vim: filetype=ebuild
