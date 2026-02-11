# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit cmake

DESCRIPTION="Libraries and daemons to implement searching in Akonadi"
HOMEPAGE="https://invent.kde.org/"
SRC_URI="https://download.kde.org/stable/release-service/25.12.2/src/akonadi-search-25.12.2.tar.xz -> akonadi-search-25.12.2.tar.xz"
SLOT="6"
KEYWORDS="*"
IUSE="+webengine"
RDEPEND="virtual/kde-seed[gui]
	kde-frameworks/krunner:6
	kde-apps/akonadi:6=
	kde-apps/akonadi-mime:6=
	kde-apps/kcalutils:6=
	kde-apps/kidentitymanagement:6=
	kde-apps/kmime:6=
	kde-frameworks/kcalendarcore:6
	kde-frameworks/kcmutils:6
	kde-frameworks/kconfig:6
	kde-frameworks/kcontacts:6
	kde-frameworks/kcoreaddons:6
	kde-frameworks/kcrash:6
	kde-frameworks/kdbusaddons:6
	kde-frameworks/ki18n:6
	kde-frameworks/kio:6
	kde-frameworks/kitemmodels:6
	kde-frameworks/krunner:6
	kde-frameworks/ktextwidgets:6
	webengine? ( dev-qt/qtwebengine:6 )
	
"
DEPEND="${RDEPEND}
"
src_configure() {
	local mycmakeargs=(
	  $(cmake_use_find_package webengine Qt6WebEngineWidgets)
	)
	cmake_src_configure
}


# vim: filetype=ebuild
