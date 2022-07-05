# Distributed under the terms of the GNU General Public License v2

EAPI=7

KDE_HANDBOOK="false"
KMNAME="dolphin-plugins"
MY_PLUGIN_NAME="mountiso"
FRAMEWORKS_MINIMAL=5.94.0
QT_MINIMAL=5.15.2
inherit kde5
SRC_URI="mirror://kde/stable/release-service/${PV}/src/${KMNAME}-${PV}.tar.xz"
DESCRIPTION="Dolphin plugin for ISO loopback device mounting"
HOMEPAGE="https://apps.kde.org/en/dolphin_plugins"
LICENSE="GPL-2" # TODO: CHECK
SLOT="5"
KEYWORDS="*"
IUSE=""

DEPEND="
	$(add_qt_dep qtdbus)
	$(add_qt_dep qtgui)
	$(add_qt_dep qtwidgets)
	$(add_kdeapps_dep dolphin)
	$(add_frameworks_dep kcompletion)
	$(add_frameworks_dep kconfig)
	$(add_frameworks_dep kcoreaddons)
	$(add_frameworks_dep ki18n)
	$(add_frameworks_dep kio)
	$(add_frameworks_dep ktextwidgets)
	$(add_frameworks_dep solid)
"
RDEPEND="${DEPEND}"

src_prepare() {
	kde5_src_prepare
	# kxmlgui, qtnetwork only required by dropbox
	ecm_punt_bogus_dep Qt5 Network
	ecm_punt_bogus_dep KF5 XmlGui
	# delete non-${PN} translations
	find po -type f -name "*po" -and -not -name "*${MY_PLUGIN_NAME}plugin" -delete || die
}

src_configure() {
	local mycmakeargs=(
		-DBUILD_${MY_PLUGIN_NAME}=ON
		-DBUILD_bazaar=OFF
		-DBUILD_dropbox=OFF
		-DBUILD_git=OFF
		-DBUILD_hg=OFF
		-DBUILD_svn=OFF
	)
	kde5_src_configure
}

src_install() {
	kde5_src_install
	rm "${D}"/usr/share/metainfo/org.kde.dolphin-plugins.metainfo.xml || die
}
