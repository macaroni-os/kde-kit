# Distributed under the terms of the GNU General Public License v2

EAPI=7

KDE_HANDBOOK="forceoptional"
KDE_TEST="optional"
FRAMEWORKS_MINIMAL=5.98.0
QT_MINIMAL=5.15.1
VIRTUALX_REQUIRED="test"
inherit eutils kde5

DESCRIPTION="File archiver by KDE"
HOMEPAGE="https://apps.kde.org/en/ark https://utils.kde.org/projects/ark/"
LICENSE="GPL-2" # TODO: CHECK
SLOT="5"
KEYWORDS="*"
IUSE="zip"

BDEPEND="
	sys-devel/gettext
"
RDEPEND="
	app-arch/libarchive:=[bzip2,lzma,zlib]
	$(add_qt_dep qtdbus)
	$(add_qt_dep qtgui)
	$(add_qt_dep qtwidgets)
	$(add_frameworks_dep karchive)
	$(add_frameworks_dep kcompletion)
	$(add_frameworks_dep kconfig)
	$(add_frameworks_dep kconfigwidgets)
	$(add_frameworks_dep kcoreaddons)
	$(add_frameworks_dep kcrash)
	$(add_frameworks_dep kdbusaddons)
	$(add_frameworks_dep ki18n)
	$(add_frameworks_dep kiconthemes)
	$(add_frameworks_dep kio)
	$(add_frameworks_dep kitemmodels)
	$(add_frameworks_dep kjobwidgets)
	$(add_frameworks_dep kparts)
	$(add_frameworks_dep kpty)
	$(add_frameworks_dep kservice)
	$(add_frameworks_dep kwidgetsaddons)
	$(add_frameworks_dep kxmlgui)
	sys-libs/zlib
	zip? ( >=dev-libs/libzip-1.3.0:= )
"
DEPEND="${RDEPEND}
	$(add_qt_dep qtconcurrent)
"

src_configure() {
	local mycmakeargs=(
		$(cmake-utils_use_find_package zip LibZip)
	)

	kde5_src_configure
}

src_test() {
	local myctestargs=(
		-E "(plugins-clirartest)"
	)

	kde5_src_test
}

pkg_postinst() {
	if [[ -z "${REPLACING_VERSIONS}" ]]; then
		elog "Optional dependencies:"
		optfeature "rar archive creation/extraction" app-arch/rar
		optfeature "rar archive extraction only" app-arch/unar app-arch/unrar
		optfeature "7-Zip archive support" app-arch/p7zip
		optfeature "lrz archive support" app-arch/lrzip
		optfeature "markdown support in text previews" kde-misc/markdownpart:${SLOT} kde-misc/kmarkdownwebview:${SLOT}
	fi
	kde5_pkg_postinst
}
