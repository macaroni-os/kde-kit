# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit xdg kde6

DESCRIPTION="Utility for management of disks, partitions and file systems"
HOMEPAGE="https://apps.kde.org/partitionmanager/"
SRC_URI="https://download.kde.org/stable/release-service/25.12.2/src/partitionmanager-25.12.2.tar.xz -> partitionmanager-25.12.2.tar.xz"
LICENSE="GPL-3"
SLOT="6"
KEYWORDS="*"
RDEPEND="virtual/kde-seed[gui]
	kde-frameworks/kconfig:6
	kde-frameworks/kconfigwidgets:6
	kde-frameworks/kcoreaddons:6
	kde-frameworks/kcrash:6
	kde-frameworks/kdbusaddons:6
	kde-frameworks/ki18n:6
	kde-frameworks/kio:6
	kde-frameworks/kjobwidgets:6
	kde-frameworks/kwidgetsaddons:6
	kde-frameworks/kwindowsystem:6
	kde-frameworks/kxmlgui:6
	sys-libs/kpmcore:6
	sys-auth/polkit-qt
	
"
DEPEND="${RDEPEND}
"
src_prepare() {
	kde6_src_prepare
}


# vim: filetype=ebuild
