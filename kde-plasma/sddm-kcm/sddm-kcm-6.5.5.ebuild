# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit kde6 xdg

DESCRIPTION="KDE Plasma control module for SDDM"
HOMEPAGE="https://invent.kde.org/plasma/sddm-kcm"
SRC_URI="https://download.kde.org/stable/plasma/6.5.5/sddm-kcm-6.5.5.tar.xz -> sddm-kcm-6.5.5.tar.xz"
LICENSE="GPL-2+"
SLOT="6"
KEYWORDS="*"
BDEPEND="kde-frameworks/kcmutils:6
	
"
RDEPEND="kde-frameworks/kirigami:6
	kde-frameworks/kitemmodels:6
	x11-misc/sddm
	
"
DEPEND="${RDEPEND}
	dev-qt/qtbase:6[gui]
	dev-qt/qtdeclarative:6
	kde-frameworks/karchive:6
	kde-frameworks/kauth:6
	kde-frameworks/kcmutils:6
	kde-frameworks/kconfig:6
	kde-frameworks/kcoreaddons:6
	kde-frameworks/ki18n:6
	kde-frameworks/kio:6
	kde-frameworks/knewstuff:6
	kde-frameworks/kservice:6
	kde-frameworks/kwidgetsaddons:6
	
"
src_prepare() {
	  kde6_src_prepare
}


# vim: filetype=ebuild
