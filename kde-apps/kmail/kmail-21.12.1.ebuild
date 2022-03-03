# Distributed under the terms of the GNU General Public License v2

EAPI=7

KDE_HANDBOOK="forceoptional"
KDE_TEST="forceoptional"
FRAMEWORKS_MINIMAL=5.75.0
QT_MINIMAL=5.15.2
VIRTUALX_REQUIRED="test"
inherit eutils kde5

DESCRIPTION="Email client, supporting POP3 and IMAP mailboxes."
HOMEPAGE="https://apps.kde.org/en/kmail2
https://kontact.kde.org/components/kmail.html"
LICENSE="GPL-2+ handbook? ( FDL-1.2+ )"
SLOT="5"
KEYWORDS="*"
IUSE="telemetry"

BDEPEND="
	dev-libs/libxslt
	test? ( $(add_kdeapps_dep akonadi tools) )
"
COMMON_DEPEND="
	>=app-crypt/gpgme-1.11.1[cxx,qt5]
	$(add_qt_dep qtcore)
	$(add_qt_dep qtdbus)
	$(add_qt_dep qtgui)
	$(add_qt_dep qtnetwork)
	$(add_qt_dep qtwebengine widgets)
	$(add_qt_dep qtwidgets)
	$(add_kdeapps_dep akonadi)
	$(add_kdeapps_dep akonadi-contacts)
	$(add_kdeapps_dep akonadi-mime)
	$(add_kdeapps_dep akonadi-search)
	$(add_kdeapps_dep kidentitymanagement)
	$(add_kdeapps_dep kmailtransport)
	$(add_kdeapps_dep kmime)
	$(add_kdeapps_dep kontactinterface)
	$(add_kdeapps_dep kpimtextedit)
	$(add_kdeapps_dep libgravatar)
	$(add_kdeapps_dep libkdepim)
	$(add_kdeapps_dep libkleo)
	$(add_kdeapps_dep libksieve)
	$(add_kdeapps_dep libktnef)
	$(add_kdeapps_dep mailcommon)
	$(add_kdeapps_dep messagelib)
	$(add_kdeapps_dep pimcommon)
	$(add_frameworks_dep kbookmarks)
	$(add_frameworks_dep kcalendarcore)
	$(add_frameworks_dep kcmutils)
	$(add_frameworks_dep kcodecs)
	$(add_frameworks_dep kcompletion)
	$(add_frameworks_dep kconfig)
	$(add_frameworks_dep kconfigwidgets)
	$(add_frameworks_dep kcontacts)
	$(add_frameworks_dep kcoreaddons)
	$(add_frameworks_dep kcrash)
	$(add_frameworks_dep kdbusaddons)
	$(add_frameworks_dep kguiaddons)
	$(add_frameworks_dep ki18n)
	$(add_frameworks_dep kiconthemes)
	$(add_frameworks_dep kitemviews)
	$(add_frameworks_dep kio)
	$(add_frameworks_dep kjobwidgets)
	$(add_frameworks_dep knotifications)
	$(add_frameworks_dep knotifyconfig)
	$(add_frameworks_dep kparts)
	$(add_frameworks_dep kservice)
	$(add_frameworks_dep ktextwidgets)
	$(add_frameworks_dep kwidgetsaddons)
	$(add_frameworks_dep kwindowsystem)
	$(add_frameworks_dep kxmlgui)
	$(add_frameworks_dep sonnet)
	telemetry? ( dev-libs/kuserfeedback:5 )
"
DEPEND="${COMMON_DEPEND}
	$(add_kdeapps_dep kcalutils)
	$(add_kdeapps_dep kldap)
	test? ( $(add_kdeapps_dep akonadi sqlite) )
"
RDEPEND="${COMMON_DEPEND}
	$(add_kdeapps_dep kdepim-runtime)
	$(add_kdeapps_dep kmail-account-wizard)
"

RESTRICT+=" test" # bug 616878

src_prepare() {
	kde5_src_prepare
	use handbook || cd ktnef && cmake_comment_add_subdirectory doc
}

src_configure() {
	local mycmakeargs=(
		$(cmake-utils_use_find_package telemetry KUserFeedback)
	)

	kde5_src_configure
}

pkg_postinst() {
	if [[ -z "${REPLACING_VERSIONS}" ]]; then
		elog "Optional dependencies:"
		optfeature "Virus detection" app-antivirus/clamav
		optfeature "Spam filtering" mail-filter/bogofilter mail-filter/spamassassin
		optfeature "Fancy e-mail headers and useful plugins" kde-apps/kdepim-addons:${SLOT}
		optfeature "Crypto config and certificate details GUI" kde-apps/kleopatra:${SLOT}
	fi
	kde5_pkg_postinst
}