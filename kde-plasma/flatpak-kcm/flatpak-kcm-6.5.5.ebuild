# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit kde6 xdg

DESCRIPTION="Flatpak Permissions Management KCM"
HOMEPAGE="https://invent.kde.org/plasma/"
SRC_URI="https://download.kde.org/stable/plasma/6.5.5/flatpak-kcm-6.5.5.tar.xz -> flatpak-kcm-6.5.5.tar.xz"
SLOT="6"
KEYWORDS="*"
BDEPEND="kde-frameworks/kcmutils:6
	
"
RDEPEND="kde-frameworks/kirigami:6
	
"
DEPEND="${RDEPEND}
	dev-libs/glib:2
	dev-qt/qtbase:6
	dev-qt/qtdeclarative:6[widgets]
	dev-qt/qtsvg:6
	kde-frameworks/kcmutils:6
	kde-frameworks/kconfig:6
	kde-frameworks/kcoreaddons:6
	kde-frameworks/kdeclarative:6
	kde-frameworks/ki18n:6
	kde-frameworks/kitemmodels:6
	>=sys-apps/flatpak-0.11.8
	
"
src_prepare() {
	  kde6_src_prepare
}


# vim: filetype=ebuild
