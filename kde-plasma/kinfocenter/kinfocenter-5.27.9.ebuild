# Distributed under the terms of the GNU General Public License v2

EAPI=7

KDE_HANDBOOK="forceoptional"
FRAMEWORKS_MINIMAL=5.98.0
QT_MINIMAL=5.15.2
inherit eutils kde5

DESCRIPTION="Utility providing information about the computer hardware"
HOMEPAGE="https://userbase.kde.org/KInfoCenter"
SRC_URI+=" https://www.funtoo.org/images/thumb/8/88/Latest-funtoo.png/320px-Latest-funtoo.png -> flogo-small.png"

LICENSE="GPL-2" # TODO: CHECK
SLOT="5"
KEYWORDS="*"
IUSE="gles2-only ieee1394 +opengl +pci wayland"

REQUIRED_USE="wayland? ( || ( opengl gles2-only ) )"

BDEPEND=">=dev-util/cmake-3.14.3"
DEPEND="
	$(add_qt_dep qtdbus)
	$(add_qt_dep qtdeclarative)
	$(add_qt_dep qtgui gles2-only=)
	$(add_qt_dep qtwidgets)
	$(add_frameworks_dep kauth)
	$(add_frameworks_dep kcmutils)
	$(add_frameworks_dep kconfig)
	$(add_frameworks_dep kconfigwidgets)
	$(add_frameworks_dep kcoreaddons)
	$(add_frameworks_dep kdeclarative)
	$(add_frameworks_dep ki18n)
	$(add_frameworks_dep kio)
	$(add_frameworks_dep kpackage)
	$(add_frameworks_dep kservice)
	$(add_frameworks_dep kwidgetsaddons)
	$(add_frameworks_dep solid)
	$(add_plasma_dep plasma-systemmonitor)
	x11-libs/libX11
	gles2-only? ( media-libs/mesa[gles2] )
	ieee1394? ( sys-libs/libraw1394 )
	opengl? (
		media-libs/mesa[X(+)]
		!gles2-only? ( media-libs/glu )
	)
	pci? ( sys-apps/pciutils )
	wayland? (
		$(add_frameworks_dep kwayland)
		media-libs/mesa[egl]
	)
"
RDEPEND="${DEPEND}
	$(add_qt_dep qtquickcontrols2)
	$(add_frameworks_dep kirigami)
	$(add_plasma_dep kde-cli-tools)
	$(add_plasma_dep systemsettings)
"

src_configure() {
	local mycmakeargs=(
		$(cmake-utils_use_find_package ieee1394 RAW1394)
		$(cmake-utils_use_find_package pci PCIUTILS)
		$(cmake-utils_use_find_package wayland EGL)
		$(cmake-utils_use_find_package wayland KF5Wayland)
	)

	if has_version "dev-qt/qtgui[gles2-only]"; then
		mycmakeargs+=( $(cmake-utils_use_find_package gles2-only OpenGLES) )
	else
		mycmakeargs+=( $(cmake-utils_use_find_package opengl OpenGL) )
	fi

	kde5_src_configure
}

src_install() {
	kde5_src_install

	# TODO: Make this fully obsolete by /etc/os-release
	insinto /etc/xdg
	doins "${FILESDIR}"/kcm-about-distrorc

	insinto /usr/share/${PN}
	doins "${DISTDIR}"/flogo-small.png
}

pkg_postinst() {
	if [[ -z "${REPLACING_VERSIONS}" ]]; then
		elog "Optional dependencies:"
		optfeature "NFS information module" net-fs/nfs-utils
		optfeature "Samba status information module" net-fs/samba
	fi
	kde5_pkg_postinst
}
