# Distributed under the terms of the GNU General Public License v2

EAPI=7

ECM_DESIGNERPLUGIN="true"
KDE_TEST="forceoptional"
FRAMEWORKS_MINIMAL=5.98.0
QT_MINIMAL=5.15.1
VIRTUALDBUS_TEST="true"
VIRTUALX_REQUIRED="test"
inherit kde5

DESCRIPTION="Storage service for PIM data and libraries for PIM apps"
HOMEPAGE="https://community.kde.org/KDE_PIM/akonadi"
LICENSE="LGPL-2.1+"
SLOT="5"
KEYWORDS="*"
IUSE="+kaccounts +mariadb postgres sqlite tools xml"

REQUIRED_USE="|| ( mariadb postgres sqlite ) test? ( tools )"

COMMON_DEPEND="
	app-arch/xz-utils
	$(add_qt_dep qtdbus)
	$(add_qt_dep qtgui)
	$(add_qt_dep qtnetwork)
	$(add_qt_dep qtsql 'postgres?')
	$(add_qt_dep qtwidgets)
	$(add_qt_dep qtxml)
	$(add_frameworks_dep kconfig)
	$(add_frameworks_dep kconfigwidgets)
	$(add_frameworks_dep kcoreaddons)
	$(add_frameworks_dep kcrash)
	$(add_frameworks_dep ki18n)
	$(add_frameworks_dep kiconthemes)
	$(add_frameworks_dep kio)
	$(add_frameworks_dep kitemmodels)
	$(add_frameworks_dep kitemviews)
	$(add_frameworks_dep kwidgetsaddons)
	$(add_frameworks_dep kwindowsystem)
	$(add_frameworks_dep kxmlgui)
	kaccounts? (
		$(add_kdeapps_dep kaccounts-integration)
		>=net-libs/accounts-qt-1.16
	)
	mariadb? ( $(add_qt_dep qtsql mysql) )
	sqlite? (
		dev-db/sqlite:3
		$(add_qt_dep qtsql sqlite)
	)
	xml? ( dev-libs/libxml2 )
"
DEPEND="${COMMON_DEPEND}
	dev-libs/boost
	dev-libs/libxslt
	test? ( sys-apps/dbus )
"
RDEPEND="${COMMON_DEPEND}
	mariadb? ( >=dev-db/mariadb-10.4:* )
	postgres? ( dev-db/postgresql )
"

# some akonadi tests time out, that probably needs more work as it's ~700 tests
RESTRICT+=" test"

PATCHES=( "${FILESDIR}/${PN}-21.03.80-mysql56-crash.patch" )

pkg_setup() {
	# Set default storage backend in order: MariaDB, PostgreSQL, SQLite
	# reverse driver check to keep the order
	use sqlite && DRIVER="QSQLITE3"
	use postgres && DRIVER="QPSQL"
	use mariadb && DRIVER="QMYSQL"

	if use mariadb && has_version ">=dev-db/mariadb-10.4"; then
		ewarn "If an existing Akonadi MariaDB database is being upgraded using"
		ewarn ">=dev-db/mariadb-10.4 and KMail stops fetching and sending mail,"
		ewarn "check ~/.local/share/akonadi/akonadiserver.error for errors like:"
		ewarn "  \"Cannot add or update a child row: a foreign key constraint fails\""
		ewarn
		ewarn "Manual steps are required to fix it, see also:"
		ewarn "  https://bugs.gentoo.org/688746 (see Whiteboard)"
		ewarn "  https://bugs.kde.org/show_bug.cgi?id=409224"
		ewarn
	fi

	if use sqlite || has_version "<${CATEGORY}/${P}[sqlite]"; then
		ewarn "We strongly recommend you change your Akonadi database backend to"
		ewarn "either MariaDB or PostgreSQL in your user configuration."
		ewarn "In particular, kde-apps/kmail does not work properly with the sqlite backend."
	fi

	if has_version "kde-apps/akonadi[mysql]"; then
		ewarn "Due to configuration incompatibilities we are unable to provide"
		ewarn "the option to use dev-db/mysql. You must switch to dev-db/mariadb."
		ewarn "  https://bugs.gentoo.org/709812"
		ewarn "  https://bugs.kde.org/show_bug.cgi?id=421922"
	fi

	kde5_pkg_setup
}

src_configure() {
	local mycmakeargs=(
		$(cmake-utils_use_find_package kaccounts AccountsQt5)
		$(cmake-utils_use_find_package kaccounts KAccounts)
		-DAKONADI_BUILD_QSQLITE=$(usex sqlite)
		-DBUILD_TOOLS=$(usex tools)
		$(cmake-utils_use_find_package xml LibXml2)
	)

	kde5_src_configure
}

src_install() {
	# Who knows, maybe it accidentally fixes our permission issues
	cat <<-EOF > "${T}"/akonadiserverrc
[%General]
Driver=${DRIVER}
EOF
	insinto /usr/share/config/akonadi
	doins "${T}"/akonadiserverrc

	kde5_src_install
}

pkg_postinst() {
	kde5_pkg_postinst
	elog "You can select the storage backend in ~/.config/akonadi/akonadiserverrc."
	elog "Available drivers are:"
	use mariadb && elog "  QMYSQL"
	use postgres && elog "  QPSQL"
	use sqlite && elog "  QSQLITE3"
	elog "${DRIVER} has been set as your default akonadi storage backend."
}