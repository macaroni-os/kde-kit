# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit kde6 xdg

DESCRIPTION="News feed aggregator"
HOMEPAGE="https://apps.kde.org/akregator/"
SRC_URI="https://download.kde.org/stable/release-service/25.12.2/src/akregator-25.12.2.tar.xz -> akregator-25.12.2.tar.xz"
SLOT="6"
KEYWORDS="*"
IUSE="activities speech telemetry"
RDEPEND=">=dev-libs/ktextaddons-1.6.0:6[speech?]
	dev-qt/qtbase:6[gui]
	dev-qt/qtwebengine:6
	kde-apps/grantleetheme:6=
	kde-apps/kontactinterface:6=
	kde-apps/libkdepim:6=
	kde-apps/messagelib:6=
	kde-apps/pimcommon:6[activities?]
	kde-frameworks/kcmutils:6
	kde-frameworks/kcodecs:6
	kde-frameworks/kcolorscheme:6
	kde-frameworks/kcompletion:6
	kde-frameworks/kconfig:6
	kde-frameworks/kconfigwidgets:6
	kde-frameworks/kcoreaddons:6
	kde-frameworks/kcrash:6
	kde-frameworks/ki18n:6
	kde-frameworks/kiconthemes:6
	kde-frameworks/kio:6
	kde-frameworks/kjobwidgets:6
	kde-frameworks/knotifications:6
	kde-frameworks/knotifyconfig:6
	kde-frameworks/kparts:6
	kde-frameworks/kstatusnotifieritem:6
	kde-frameworks/kwidgetsaddons:6
	kde-frameworks/kxmlgui:6
	kde-frameworks/syndication:6
	activities? ( kde-plasma/plasma-activities:6 )
	telemetry? ( kde-frameworks/kuserfeedback:6 )
	
"
DEPEND="${RDEPEND}
	
"
src_prepare() {
	  kde6_src_prepare
}

src_configure() {
	  local mycmakeargs=(
	      -DOPTION_USE_PLASMA_ACTIVITIES=$(usex activities)
	      $(cmake_use_find_package speech KF6TextEditTextToSpeech)
	      $(cmake_use_find_package telemetry KF6UserFeedback)
	  )
	   kde6_src_configure
}


# vim: filetype=ebuild
