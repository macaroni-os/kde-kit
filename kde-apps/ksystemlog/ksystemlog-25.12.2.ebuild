# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit cmake

DESCRIPTION="System log viewer by KDE"
HOMEPAGE="https://apps.kde.org/ksystemlog/"
SRC_URI="https://download.kde.org/stable/release-service/25.12.2/src/ksystemlog-25.12.2.tar.xz -> ksystemlog-25.12.2.tar.xz"
SLOT="6"
KEYWORDS="*"
IUSE="audit kdesu systemd"
RDEPEND="virtual/kde-seed[gui]
	kde-frameworks/karchive:6
	kde-frameworks/kcompletion:6
	kde-frameworks/kconfig:6
	kde-frameworks/kconfigwidgets:6
	kde-frameworks/kcoreaddons:6
	kde-frameworks/kcrash:6
	kde-frameworks/ki18n:6
	kde-frameworks/kio:6
	kde-frameworks/kitemviews:6
	kde-frameworks/ktextwidgets:6
	kde-frameworks/kwidgetsaddons:6
	kde-frameworks/kxmlgui:6
	audit? ( sys-process/audit )
	systemd? (
	  sys-apps/systemd:=
	)
	
"
DEPEND="${RDEPEND}
"

# vim: filetype=ebuild
