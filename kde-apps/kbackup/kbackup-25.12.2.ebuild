# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit kde6 xdg

DESCRIPTION="Program that lets you back up any directories or files"
HOMEPAGE="https://apps.kde.org/kbackup/"
SRC_URI="https://download.kde.org/stable/release-service/25.12.2/src/kbackup-25.12.2.tar.xz -> kbackup-25.12.2.tar.xz"
SLOT="6"
KEYWORDS="*"
RDEPEND="app-arch/libarchive:=
	dev-qt/qt5compat:6
	dev-qt/qtbase:6[gui]
	kde-frameworks/karchive:6
	kde-frameworks/kcompletion:6
	kde-frameworks/kconfig:6
	kde-frameworks/kconfigwidgets:6
	kde-frameworks/kcoreaddons:6
	kde-frameworks/kguiaddons:6
	kde-frameworks/ki18n:6
	kde-frameworks/kiconthemes:6
	kde-frameworks/kio:6
	kde-frameworks/knotifications:6
	kde-frameworks/kservice:6
	kde-frameworks/kstatusnotifieritem:6
	kde-frameworks/kwidgetsaddons:6
	kde-frameworks/kxmlgui:6
	
"
DEPEND="${RDEPEND}
	
"
src_prepare() {
	  kde6_src_prepare
}


# vim: filetype=ebuild
