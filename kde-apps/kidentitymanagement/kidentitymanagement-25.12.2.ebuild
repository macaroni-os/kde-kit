# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit kde6

DESCRIPTION="Library for managing identitites"
HOMEPAGE="https://invent.kde.org/"
SRC_URI="https://download.kde.org/stable/release-service/25.12.2/src/kidentitymanagement-25.12.2.tar.xz -> kidentitymanagement-25.12.2.tar.xz"
SLOT="6"
KEYWORDS="*"
RESTRICT="test"
RDEPEND=">=dev-libs/kirigami-addons-1.0:6
	>=dev-libs/ktextaddons-1.6.0:6
	dev-qt/qtbase:6[gui]
	dev-qt/qtdeclarative:6
	kde-apps/kpimtextedit:6=
	kde-frameworks/kcodecs:6
	kde-frameworks/kconfig:6
	kde-frameworks/kcoreaddons:6
	kde-frameworks/ki18n:6
	kde-frameworks/kio:6
	kde-frameworks/kwidgetsaddons:6
	kde-frameworks/kxmlgui:6
	
"
DEPEND="${RDEPEND}
	
"
src_prepare() {
	  kde6_src_prepare
}


# vim: filetype=ebuild
