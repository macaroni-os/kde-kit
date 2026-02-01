# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit kde6 xdg

DESCRIPTION="Web browser and file manager based on KDE Frameworks"
HOMEPAGE="https://apps.kde.org/konqueror/"
SRC_URI="https://download.kde.org/stable/release-service/25.12.1/src/konqueror-25.12.1.tar.xz -> konqueror-25.12.1.tar.xz"
SLOT="6"
KEYWORDS="*"
IUSE="activities speech"
RESTRICT="test"
RDEPEND="!<kde-apps/kio-extras-23.08.5-r100:5
	kde-apps/kfind:6
	
"
DEPEND="${RDEPEND}
	dev-qt/qtbase:6=[gui,X]
	dev-qt/qtwebengine:6
	kde-frameworks/karchive:6
	kde-frameworks/kbookmarks:6
	kde-frameworks/kcmutils:6
	kde-frameworks/kcodecs:6
	kde-frameworks/kcompletion:6
	kde-frameworks/kconfig:6
	kde-frameworks/kconfigwidgets:6
	kde-frameworks/kcoreaddons:6
	kde-frameworks/kcrash:6
	kde-frameworks/kdbusaddons:6
	kde-frameworks/kdesu:6
	kde-frameworks/kguiaddons:6
	kde-frameworks/ki18n:6
	kde-frameworks/kiconthemes:6
	kde-frameworks/kio:6
	kde-frameworks/kitemviews:6
	kde-frameworks/kjobwidgets:6
	kde-frameworks/kparts:6
	kde-frameworks/kservice:6
	kde-frameworks/ktextwidgets:6
	kde-frameworks/kwallet:6
	kde-frameworks/kwidgetsaddons:6
	kde-frameworks/kwindowsystem:6[X]
	kde-frameworks/kxmlgui:6
	kde-frameworks/sonnet:6
	sys-libs/zlib
	activities? ( kde-plasma/plasma-activities:6 )
	speech? ( dev-qt/qtspeech:6 )
	
"
src_prepare() {
	  kde6_src_prepare
}


# vim: filetype=ebuild
