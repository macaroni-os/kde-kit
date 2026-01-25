# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit kde6 xdg

DESCRIPTION="KDE Plasma control module for Plymouth"
HOMEPAGE="https://invent.kde.org/plasma/plymouth-kcm"
SRC_URI="https://download.kde.org/stable/plasma/6.5.5/plymouth-kcm-6.5.5.tar.xz -> plymouth-kcm-6.5.5.tar.xz"
LICENSE="GPL-2+"
SLOT="6"
KEYWORDS="~amd64 ~arm64 ~loong ~ppc64 ~x86"
BDEPEND="kde-frameworks/kcmutils:6
	
"
RDEPEND="kde-frameworks/kcmutils:6
	kde-frameworks/kirigami:6
	
"
DEPEND="${RDEPEND}
	dev-qt/qtbase:6[gui]
	dev-qt/qtdeclarative:6
	kde-frameworks/karchive:6
	kde-frameworks/kauth:6
	kde-frameworks/kconfig:6
	kde-frameworks/kcoreaddons:6
	kde-frameworks/ki18n:6
	kde-frameworks/kio:6
	kde-frameworks/knewstuff:6
	kde-frameworks/kwidgetsaddons:6
	sys-boot/plymouth
	
"
src_prepare() {
	  kde6_src_prepare
}


# vim: filetype=ebuild
