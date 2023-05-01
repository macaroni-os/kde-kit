# Distributed under the terms of the GNU General Public License v2

EAPI=7

FRAMEWORKS_MINIMAL=5.98.0
QT_MINIMAL=5.15.2
VIRTUALX_REQUIRED="test"
inherit kde5

DESCRIPTION="GTK2 and GTK3 configurator for KDE Plasma"
HOMEPAGE="https://invent.kde.org/plasma/kde-gtk-config"
LICENSE="GPL-3"
SLOT="5"
KEYWORDS="*"
IUSE=""

BDEPEND="
	dev-lang/sassc
"
DEPEND="
	dev-cpp/glibmm:2
	dev-libs/glib:2
	$(add_qt_dep qtdbus)
	$(add_qt_dep qtgui)
	$(add_qt_dep qtsvg)
	gnome-base/gsettings-desktop-schemas
	$(add_frameworks_dep kconfig)
	$(add_frameworks_dep kconfigwidgets)
	$(add_frameworks_dep kcoreaddons)
	$(add_frameworks_dep kdbusaddons)
	$(add_frameworks_dep kguiaddons)
	$(add_plasma_dep kdecoration)
	x11-libs/gtk+:3
"
RDEPEND="${DEPEND}
	$(add_plasma_dep kde-cli-tools)
	x11-misc/xsettingsd
"

src_configure() {
	local mycmakeargs=(
		-DDATA_INSTALL_DIR="${EPREFIX}/usr/share"
	)

	kde5_src_configure
}

pkg_postinst() {
	kde5_pkg_postinst
	elog "If you notice missing icons in your GTK applications, you may have to install"
	elog "the corresponding themes for GTK. A good guess would be x11-themes/oxygen-gtk"
	elog "for example."
}