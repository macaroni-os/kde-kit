# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit kde6

DESCRIPTION="KDE calculator"
HOMEPAGE="https://apps.kde.org/kcalc/"
SRC_URI="https://download.kde.org/stable/release-service/25.12.1/src/kcalc-25.12.1.tar.xz -> kcalc-25.12.1.tar.xz"
SLOT="6"
KEYWORDS="*"
BDEPEND="sys-devel/gettext
	
"
RDEPEND="dev-libs/gmp:=
	dev-libs/mpc:=
	dev-libs/mpfr:=
	dev-qt/qtbase:6[gui]
	kde-frameworks/kcolorscheme:6
	kde-frameworks/kconfig:6
	kde-frameworks/kconfigwidgets:6
	kde-frameworks/kcoreaddons:6
	kde-frameworks/kcrash:6
	kde-frameworks/kguiaddons:6
	kde-frameworks/ki18n:6
	kde-frameworks/knotifications:6
	kde-frameworks/kwidgetsaddons:6
	kde-frameworks/kxmlgui:6
	
"
DEPEND="${RDEPEND}
	
"
src_prepare() {
	  kde6_src_prepare
}


# vim: filetype=ebuild
