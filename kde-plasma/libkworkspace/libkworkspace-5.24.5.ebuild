# Distributed under the terms of the GNU General Public License v2

EAPI=7

KDE_TEST="true"
KMNAME="plasma-workspace"
FRAMEWORKS_MINIMAL=5.89.0
QT_MINIMAL=5.15.2
inherit kde5

DESCRIPTION="Workspace library to interact with the Plasma session manager"
LICENSE="GPL-2" # TODO: CHECK
SLOT="5"
KEYWORDS="*"
IUSE=""

RDEPEND="
	$(add_qt_dep qtdbus)
	$(add_qt_dep qtx11extras)
	$(add_frameworks_dep kcoreaddons)
	$(add_frameworks_dep ki18n)
	$(add_frameworks_dep kinit)
	$(add_frameworks_dep kwindowsystem)
	$(add_frameworks_dep plasma)
	$(add_plasma_dep kscreenlocker)
	x11-libs/libICE
	x11-libs/libSM
	x11-libs/libX11
	x11-libs/libXau
"
DEPEND="${RDEPEND}
	$(add_plasma_dep kwin)
"

S="${S}/${PN}"

PATCHES=( "${FILESDIR}/${PN}-5.22.80-standalone.patch" )

src_prepare() {
	# delete colliding libkworkspace translations, let kde5_src_prepare do its magic
	find ../po -type f -name "*po" -and -not -name "libkworkspace*" -delete || die
	rm -rf po/*/docs || die
	cp -a ../po ./ || die

	kde5_src_prepare

	cat >> CMakeLists.txt <<- _EOF_ || die
		ki18n_install(po)
	_EOF_

	sed -e "/set/s/GENTOO_PV/$(ver_cut 1-3)/" \
		-i CMakeLists.txt || die "Failed to prepare CMakeLists.txt"
}