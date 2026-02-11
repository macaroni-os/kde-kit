# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit cmake xdg

DESCRIPTION="Flatpak Permissions Management KCM"
HOMEPAGE="https://invent.kde.org/plasma/"
SRC_URI="https://download.kde.org/stable/plasma/6.5.5/flatpak-kcm-6.5.5.tar.xz -> flatpak-kcm-6.5.5.tar.xz"
SLOT="6"
KEYWORDS="*"
RDEPEND="virtual/kde-seed[gui,svg,declarative]
	dev-qt/qtdeclarative:6[widgets]
	dev-libs/glib:2
	kde-frameworks/kirigami:6
	kde-frameworks/kcmutils:6
	kde-frameworks/kconfig:6
	kde-frameworks/kcoreaddons:6
	kde-frameworks/kdeclarative:6
	kde-frameworks/ki18n:6
	kde-frameworks/kitemmodels:6
	sys-apps/flatpak
	
"
DEPEND="${RDEPEND}
"
src_prepare() {
	cmake_src_prepare
}


# vim: filetype=ebuild
