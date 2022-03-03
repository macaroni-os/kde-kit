# Distributed under the terms of the GNU General Public License v2

EAPI=7

KDE_HANDBOOK="true"
FRAMEWORKS_MINIMAL=5.75.0
inherit kde5

DESCRIPTION="KDE Development Scripts"
LICENSE="GPL-2" # TODO: CHECK
SLOT="5"
KEYWORDS="*"
IUSE=""

# kdelibs4support - required for kdex.dtd
# kdoctools - to use ECM instead of kdelibs4
DEPEND="
	$(add_frameworks_dep kdelibs4support)
	$(add_frameworks_dep kdoctools)
"
RDEPEND="
	app-arch/advancecomp
	media-gfx/optipng
	dev-perl/XML-DOM
"

src_prepare() {
	kde5_src_prepare

	# bug 275069
	sed -e 's:colorsvn::' -i CMakeLists.txt || die
}