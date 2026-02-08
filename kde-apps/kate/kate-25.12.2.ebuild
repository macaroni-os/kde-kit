# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit kde6 flag-o-matic xdg

DESCRIPTION="Multi-document editor with network transparency, Plasma integration and more"
HOMEPAGE="https://kate-editor.org/ https://apps.kde.org/kate/"
SRC_URI="https://download.kde.org/stable/release-service/25.12.2/src/kate-25.12.2.tar.xz -> kate-25.12.2.tar.xz"
SLOT="6"
KEYWORDS="*"
IUSE="sql telemetry"
RDEPEND="kde-frameworks/kdoctools:6
	
"
DEPEND="${RDEPEND}
	dev-qt/qtbase:6[gui,X]
	dev-qt/qtdeclarative:6
	kde-frameworks/karchive:6
	kde-frameworks/kbookmarks:6
	kde-frameworks/kcolorscheme:6
	kde-frameworks/kconfig:6
	kde-frameworks/kcoreaddons:6
	kde-frameworks/kcrash:6
	kde-frameworks/kdbusaddons:6
	kde-frameworks/kguiaddons:6
	kde-frameworks/ki18n:6
	kde-frameworks/kiconthemes:6
	kde-frameworks/kio:6
	kde-frameworks/kitemviews:6
	kde-frameworks/knewstuff:6
	kde-frameworks/kparts:6
	kde-frameworks/kservice:6
	kde-frameworks/ktexteditor:6
	kde-frameworks/kwidgetsaddons:6
	kde-frameworks/kwindowsystem:6[X]
	kde-frameworks/kxmlgui:6
	kde-frameworks/syntax-highlighting:6
	virtual/libintl
	sql? (
	    dev-qt/qtbase:6[sql]
	)
	telemetry? ( kde-frameworks/kuserfeedback:6 )
	
"
src_prepare() {
	  kde6_punt_po_install
	  kde6_src_prepare
	  # these tests are run in kde-apps/kate-lib
	  cmake_run_in apps/lib cmake_comment_add_subdirectory autotests
}
src_configure() {
	  local mycmakeargs=(
	      -DCMAKE_DISABLE_FIND_PACKAGE_SeleniumWebDriverATSPI=TRUE
	      -DBUILD_addons=TRUE
	      -DBUILD_kwrite=FALSE
	      -USE_DBUS=TRUE
	      -DBUILD_PYTHON_BINDINGS=FALSE
	      $(cmake_use_find_package telemetry KF6UserFeedback)
	  )
	  # provided by kde-apps/kate-lib
	  append-libs -lkateprivate
	  kde6_src_configure
}


# vim: filetype=ebuild
