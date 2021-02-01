# Distributed under the terms of the GNU General Public License v2

EAPI=7

KDE_HANDBOOK="optional"
KDE_TEST="true"
FRAMEWORKS_MINIMAL=5.75.0
QT_MINIMAL=5.15.1
VIRTUALX_REQUIRED="test"
inherit eutils kde5 flag-o-matic

DESCRIPTION="Web browser and file manager based on KDE Frameworks"
HOMEPAGE="https://apps.kde.org/en/konqueror"

LICENSE="GPL-2" # TODO: CHECK
SLOT="5"
KEYWORDS="*"
IUSE="activities speech X"

# 4 of 4 tests fail. Last checked for 4.0.3
RESTRICT+=" test"

COMMON_DEPEND="
	$(add_qt_dep qtdbus)
	$(add_qt_dep qtgui)
	$(add_qt_dep qtwebengine widgets)
	$(add_qt_dep qtwidgets)
	$(add_qt_dep qtxml)
	$(add_frameworks_dep karchive)
	$(add_frameworks_dep kbookmarks)
	$(add_frameworks_dep kcmutils)
	$(add_frameworks_dep kcodecs)
	$(add_frameworks_dep kcompletion)
	$(add_frameworks_dep kconfig)
	$(add_frameworks_dep kconfigwidgets)
	$(add_frameworks_dep kcoreaddons)
	$(add_frameworks_dep kcrash)
	$(add_frameworks_dep kdbusaddons)
	$(add_frameworks_dep kdesu)
	$(add_frameworks_dep kguiaddons)
	$(add_frameworks_dep ki18n)
	$(add_frameworks_dep kiconthemes)
	$(add_frameworks_dep kio)
	$(add_frameworks_dep kitemviews)
	$(add_frameworks_dep kjobwidgets)
	$(add_frameworks_dep kparts)
	$(add_frameworks_dep kservice)
	$(add_frameworks_dep kwallet)
	$(add_frameworks_dep kwidgetsaddons)
	$(add_frameworks_dep kwindowsystem)
	$(add_frameworks_dep kxmlgui)
	sys-libs/zlib
	speech? ( $(add_qt_dep qtspeech) )
	X? ( $(add_qt_dep qtx11extras) )
"
DEPEND="${COMMON_DEPEND}
	activities? ( $(add_frameworks_dep kactivities) )
"
RDEPEND="${COMMON_DEPEND}
	kde-apps/kfind:5
	kde-plasma/kde-cli-tools:5
"

src_prepare() {
	[[ ${CHOST} == *-solaris* ]] && append-ldflags -lmalloc

	kde5_src_prepare
}

src_configure() {
	local mycmakeargs=(
		$(cmake-utils_use_find_package activities KF5Activities)
		$(cmake-utils_use_find_package speech Qt5TextToSpeech)
		$(cmake-utils_use_find_package X X11)
	)
	kde5_src_configure
}

pkg_postinst() {
	if [[ -z "${REPLACING_VERSIONS}" ]]; then
		elog "Optional dependencies:"
		optfeature "bookmarks support" kde-apps/keditbookmarks:${SLOT}
		optfeature "filemanager component" kde-apps/dolphin:${SLOT}
		optfeature "SVG support" kde-apps/svg:${SLOT}
		optfeature "Java support on webpages" virtual/jre
	fi
	kde5_pkg_postinst
}
