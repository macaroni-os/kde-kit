# Distributed under the terms of the GNU General Public License v2

EAPI=7

KMNAME="kate"
KDE_HANDBOOK="optional"
FRAMEWORKS_MINIMAL=5.98.0
QT_MINIMAL=5.15.2
inherit flag-o-matic kde5

DESCRIPTION="Simple text editor based on KDE Frameworks"
HOMEPAGE="https://apps.kde.org/en/kwrite"

LICENSE="GPL-2" # TODO: CHECK
SLOT="5"
KEYWORDS="*"
IUSE="activities"

DEPEND="
	$(add_qt_dep qtgui)
	$(add_qt_dep qtwidgets)
	$(add_frameworks_dep kconfig)
	$(add_frameworks_dep kconfigwidgets)
	$(add_frameworks_dep kcoreaddons)
	$(add_frameworks_dep kcrash)
	$(add_frameworks_dep kdbusaddons)
	$(add_frameworks_dep ki18n)
	$(add_frameworks_dep kio)
	$(add_frameworks_dep kjobwidgets)
	$(add_frameworks_dep kparts)
	$(add_frameworks_dep ktexteditor)
	$(add_frameworks_dep ktextwidgets)
	$(add_frameworks_dep kwidgetsaddons)
	$(add_frameworks_dep kxmlgui)
	activities? ( $(add_frameworks_dep kactivities) )
	=kde-apps/kateprivate-${PVR}
"
RDEPEND="${DEPEND}"

src_prepare() {
	kde5_src_prepare
	# delete colliding kate translations
	find po -type f -name "*po" -and -not -name "kwrite*" -delete || die
	rm -rf po/*/docs/kate* || die
}

src_configure() {
	local mycmakeargs=(
		$(cmake-utils_use_find_package activities KF5Activities)
		-DBUILD_addons=FALSE
		-DBUILD_kate=FALSE
	)
	use handbook && mycmakeargs+=( -DBUILD_katepart=FALSE )

	append-libs -lkateprivate

	kde5_src_configure
}

src_install() {
	kde5_src_install

	rm -v "${ED}"/usr/$(get_libdir)/libkateprivate.so.* || die
}
