# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit kde6 xdg

DESCRIPTION="Storage service for PIM data and libraries for PIM apps"
HOMEPAGE="https://community.kde.org/KDE_PIM/akonadi"
SRC_URI="https://download.kde.org/stable/release-service/25.12.2/src/akonadi-25.12.2.tar.xz -> akonadi-25.12.2.tar.xz"
SLOT="6"
KEYWORDS="*"
IUSE="tools +webengine xml"
RDEPEND="kde-apps/akonadi-config
	
"
DEPEND="${RDEPEND}
	app-arch/xz-utils
	dev-libs/libxslt
	dev-qt/qtbase:6[gui,sql]
	dev-qt/qtdeclarative:6
	kde-frameworks/kcolorscheme:6
	kde-frameworks/kconfig:6
	kde-frameworks/kconfigwidgets:6
	kde-frameworks/kcoreaddons:6
	kde-frameworks/kcrash:6
	kde-frameworks/ki18n:6
	kde-frameworks/kiconthemes:6
	kde-frameworks/kitemmodels:6
	kde-frameworks/kwidgetsaddons:6
	kde-frameworks/kwindowsystem:6
	kde-frameworks/kxmlgui:6
	webengine? (
	    kde-apps/kaccounts-integration:6
	    >=net-libs/accounts-qt-1.17[qt6(+)]
	)
	xml? ( dev-libs/libxml2:= )
	
"
src_prepare() {
	  kde6_src_prepare
}

src_configure() {
	  local mycmakeargs=(
	      -DBUILD_TOOLS=$(usex tools)
	      $(cmake_use_find_package webengine AccountsQt6)
	      $(cmake_use_find_package webengine KAccounts6)
	      $(cmake_use_find_package xml LibXml2)
	  )
	   kde6_src_configure
}


# vim: filetype=ebuild
