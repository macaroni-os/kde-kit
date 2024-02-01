# Distributed under the terms of the GNU General Public License v2

EAPI=7

KDE_HANDBOOK="forceoptional"
FRAMEWORKS_MINIMAL=5.98.0
QT_MINIMAL=5.14.2
inherit kde5

DESCRIPTION="Latex Editor and TeX shell based on KDE Frameworks"
HOMEPAGE="https://apps.kde.org/en/kile https://kile.sourceforge.io/"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.bz2"

LICENSE="FDL-1.2 GPL-2"
SLOT="5"
KEYWORDS="*"
IUSE="+pdf +png"

DEPEND="
	$(add_qt_dep qtdbus)
	$(add_qt_dep qtscript)
	$(add_qt_dep qttest)
	$(add_qt_dep qtwidgets)
	$(add_frameworks_dep kconfig)
	$(add_frameworks_dep kcoreaddons)
	$(add_frameworks_dep kcrash)
	$(add_frameworks_dep kdbusaddons)
	$(add_frameworks_dep kdoctools)
	$(add_frameworks_dep kguiaddons)
	$(add_frameworks_dep ki18n)
	$(add_frameworks_dep kiconthemes)
	$(add_frameworks_dep kinit)
	$(add_frameworks_dep kio)
	$(add_frameworks_dep kparts)
	$(add_frameworks_dep ktexteditor)
	$(add_frameworks_dep kwindowsystem)
	$(add_frameworks_dep kxmlgui)
	pdf? ( app-text/poppler[qt5] )
"
RDEPEND="${DEPEND}
	$(add_kdeapps_dep konsole)
	$(kde-apps/okular 'pdf?')
	virtual/latex-base
	virtual/tex-base
	pdf? (
		app-text/ghostscript-gpl
		app-text/texlive-core
	)
	png? (
		app-text/dvipng
		virtual/imagemagick-tools[png?]
	)
"

DOCS=( AUTHORS ChangeLog kile-remote-control.txt README{,.cwl} )

PATCHES=(
	"${FILESDIR}/${P}-cmake.patch"
	"${FILESDIR}/${P}-no-khtml.patch"
	"${FILESDIR}/${P}-fix-crash-when-deleting-templates.patch"
	"${FILESDIR}/${P}-fix-overriding-existing-templates.patch"
	"${FILESDIR}/${P}-fix-ktoolbar-usage.patch"
)

src_configure() {
	local mycmakeargs=(
		$(cmake-utils_use_find_package pdf Poppler)
	)
	kde5_src_configure
}
