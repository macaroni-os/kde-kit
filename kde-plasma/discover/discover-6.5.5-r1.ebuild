# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit cmake xdg

DESCRIPTION="KDE Plasma resources management GUI"
HOMEPAGE="https://invent.kde.org/plasma/"
SRC_URI="https://download.kde.org/stable/plasma/6.5.5/discover-6.5.5.tar.xz -> discover-6.5.5.tar.xz"
SLOT="6"
KEYWORDS="*"
IUSE="+firmware flatpak telemetry webengine"
RDEPEND=">=dev-libs/appstream-1.0.4:=[qt]
	virtual/kde-seed[gui,declarative]
	dev-libs/qcoro
	dev-libs/kirigami-addons:6
	kde-frameworks/attica:6
	kde-frameworks/kauth:6
	kde-frameworks/kcmutils:6
	kde-frameworks/kconfig:6
	kde-frameworks/kconfigwidgets:6
	kde-frameworks/kcoreaddons:6
	kde-frameworks/kcrash:6
	kde-frameworks/kdbusaddons:6
	kde-frameworks/ki18n:6
	kde-frameworks/kiconthemes:6
	kde-frameworks/kidletime:6
	kde-frameworks/kio:6
	kde-frameworks/kirigami:6
	kde-frameworks/kitemmodels:6
	kde-frameworks/knewstuff:6
	kde-frameworks/knotifications:6
	kde-frameworks/kstatusnotifieritem:6
	kde-frameworks/kwidgetsaddons:6
	kde-frameworks/kxmlgui:6
	kde-frameworks/purpose:6
	firmware? ( >=sys-apps/fwupd-1.9.4 )
	flatpak? ( sys-apps/flatpak )
	telemetry? ( kde-frameworks/kuserfeedback:6 )
	webengine? ( dev-qt/qtwebview:6 )
	
"
DEPEND="${RDEPEND}
"
src_prepare() {
	cmake_src_prepare
	# we don't do anything with this
	sed -e "s/^pkg_check_modules.*Markdown/#&/" \
	    -e "s/^pkg_check_modules.*RpmOstree/#&/" \
	    -e "s/^pkg_check_modules.*Ostree/#&/" \
	    -i CMakeLists.txt || die
}
src_configure() {
	local mycmakeargs=(
	  -DCMAKE_DISABLE_FIND_PACKAGE_packagekitqt6=ON
	  -DWITH_KCM=OFF
	  -DBUILD_DummyBackend=OFF
	  -DBUILD_FlatpakBackend=$(usex flatpak)
	  -DBUILD_FwupdBackend=$(usex firmware)
	  -DBUILD_RpmOstreeBackend=OFF
	  -DBUILD_SnapBackend=OFF
	  -DBUILD_SteamOSBackend=OFF
	  $(cmake_use_find_package telemetry KF6UserFeedback)
	  $(cmake_use_find_package webengine Qt6WebView)
	)
	cmake_src_configure
}


# vim: filetype=ebuild
