# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit kde6

DESCRIPTION="Extended text editor for PIM applications"
HOMEPAGE="https://invent.kde.org/"
SRC_URI="https://download.kde.org/stable/release-service/25.12.2/src/kpimtextedit-25.12.2.tar.xz -> kpimtextedit-25.12.2.tar.xz"
SLOT="6"
KEYWORDS="*"
IUSE="speech"
RESTRICT="test"
RDEPEND=">=dev-libs/ktextaddons-1.6.0:6[speech?]
	dev-qt/qtbase:6
	kde-frameworks/kcodecs:6
	kde-frameworks/kconfig:6
	kde-frameworks/kcoreaddons:6
	kde-frameworks/ki18n:6
	kde-frameworks/kiconthemes:6
	kde-frameworks/kio:6
	kde-frameworks/kwidgetsaddons:6
	kde-frameworks/kxmlgui:6
	kde-frameworks/sonnet:6
	kde-frameworks/syntax-highlighting:6
	
"
DEPEND="${RDEPEND}
	>=dev-libs/ktextaddons-1.6.0:6[speech?]
	dev-qt/qtbase:6
	kde-frameworks/kcodecs:6
	kde-frameworks/kconfig:6
	kde-frameworks/kcoreaddons:6
	kde-frameworks/ki18n:6
	kde-frameworks/kiconthemes:6
	kde-frameworks/kio:6
	kde-frameworks/kwidgetsaddons:6
	kde-frameworks/kxmlgui:6
	kde-frameworks/sonnet:6
	kde-frameworks/syntax-highlighting:6
	
"
src_prepare() {
	  kde6_src_prepare
}


# vim: filetype=ebuild
