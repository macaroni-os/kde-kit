# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit kde6 optfeature xdg

DESCRIPTION="Plasma filemanager focusing on usability"
HOMEPAGE="https://apps.kde.org/dolphin/ https://userbase.kde.org/Dolphin"
SRC_URI="https://download.kde.org/stable/release-service/25.12.2/src/dolphin-25.12.2.tar.xz -> dolphin-25.12.2.tar.xz"
SLOT="6"
KEYWORDS="*"
IUSE="semantic-desktop telemetry test"
RDEPEND="virtual/kde-seed[gui,X,multimedia]
	kde-apps/kio-extras:6
	kde-frameworks/kbookmarks:6
	kde-frameworks/kcmutils:6
	kde-frameworks/kcodecs:6
	kde-frameworks/kcolorscheme:6
	kde-frameworks/kcompletion:6
	kde-frameworks/kconfig:6
	kde-frameworks/kconfigwidgets:6
	kde-frameworks/kcoreaddons:6
	kde-frameworks/kcrash:6
	kde-frameworks/kdbusaddons:6
	kde-frameworks/kfilemetadata:6
	kde-frameworks/kguiaddons:6
	kde-frameworks/ki18n:6
	kde-frameworks/kiconthemes:6
	kde-frameworks/kio:6=
	kde-frameworks/kitemviews:6
	kde-frameworks/kjobwidgets:6
	kde-frameworks/knewstuff:6
	kde-frameworks/knotifications:6
	kde-frameworks/kparts:6
	kde-frameworks/kservice:6
	kde-frameworks/ktextwidgets:6
	kde-frameworks/kwidgetsaddons:6
	kde-frameworks/kwindowsystem:6
	kde-frameworks/kxmlgui:6
	kde-frameworks/solid:6
	semantic-desktop? (
	    kde-apps/baloo-widgets:6
	    kde-frameworks/baloo:6
	)
	telemetry? ( kde-frameworks/kuserfeedback:6 )
	
"
DEPEND="${RDEPEND}
"
src_prepare() {
	cmake_src_prepare
}
src_configure() {
	local mycmakeargs=(
	    -DCMAKE_DISABLE_FIND_PACKAGE_PackageKitQt6=ON
	    $(cmake_use_find_package semantic-desktop KF6Baloo)
	    $(cmake_use_find_package semantic-desktop KF6BalooWidgets)
	    $(cmake_use_find_package telemetry KF6UserFeedback)
	)
	cmake_src_configure
}
pkg_postinst() {
	xdg_pkg_postinst
}


# vim: filetype=ebuild
