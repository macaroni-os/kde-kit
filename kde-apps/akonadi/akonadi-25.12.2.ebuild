# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit cmake xdg

DESCRIPTION="Storage service for PIM data and libraries for PIM apps"
HOMEPAGE="https://community.kde.org/KDE_PIM/akonadi"
SRC_URI="https://download.kde.org/Attic//release-service/25.12.2/src/akonadi-25.12.2.tar.xz -> akonadi-25.12.2.tar.xz"
SLOT="6"
KEYWORDS="*"
IUSE="tools +webengine xml postgres +sqlite mysql"
REQUIRED_USE="|| ( mysql postgres sqlite )"
RDEPEND="virtual/kde-seed[gui,sql,declarative]
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
	    >=net-libs/accounts-qt-1.17
	)
	xml? ( dev-libs/libxml2:= )
	app-arch/xz-utils
	dev-libs/libxslt
	mysql? ( virtual/mysql )
	postgres? ( dev-db/postgresql )
	sqlite? ( dev-db/sqlite )
	
"
DEPEND="${RDEPEND}
"
src_prepare() {
	cmake_src_prepare
	sed -i -e 's|static_assert(false, "This links to QWidgets")|//static_assert(false, "This links to QWidgets")|g' \
		src/agentbase/agentbase.h
}
src_configure() {
	local mycmakeargs=(
		-DBUILD_TOOLS=$(usex tools)
		$(cmake_use_find_package webengine AccountsQt6)
		$(cmake_use_find_package webengine KAccounts6)
		$(cmake_use_find_package xml LibXml2)
	)
	cmake_src_configure
}
src_install() {
	cmake_src_install
	use postgres && DRIVER="QPSQL"
	use sqlite && DRIVER="QSQLITE"
	use mysql && DRIVER="QMYSQL"
	cp "${FILESDIR}"/akonadiserverrc "${T}"/akonadiserverrc
	sed -i -e "s|DRIVER|${DRIVER}|g" "${T}"/akonadiserverrc
	insinto /usr/share/config/akonadi
	doins "${T}"/akonadiserverrc
}


# vim: filetype=ebuild
