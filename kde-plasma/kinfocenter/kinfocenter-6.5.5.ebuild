# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit kde6 optfeature xdg

DESCRIPTION="Utility providing information about the computer hardware"
HOMEPAGE="https://invent.kde.org/plasma/"
SRC_URI="https://download.kde.org/stable/plasma/6.5.5/kinfocenter-6.5.5.tar.xz -> kinfocenter-6.5.5.tar.xz"
SLOT="6"
KEYWORDS="*"
IUSE="gles2-only usb"
BDEPEND="kde-frameworks/kcmutils:6
	virtual/pkgconfig
	
"
RDEPEND="dev-qt/qttools:6
	kde-frameworks/kirigami:6
	kde-plasma/systemsettings:6
	
"
DEPEND="${RDEPEND}
	dev-qt/qtbase:6[gles2-only=,gui,vulkan]
	dev-qt/qtdeclarative:6
	kde-frameworks/kauth:6
	kde-frameworks/kcmutils:6
	kde-frameworks/kconfig:6
	kde-frameworks/kcoreaddons:6
	kde-frameworks/ki18n:6
	kde-frameworks/kio:6
	kde-frameworks/kservice:6
	kde-frameworks/solid:6
	virtual/libudev:=
	gles2-only? ( media-libs/mesa )
	usb? ( virtual/libusb:1 )
	
"
src_prepare() {
	  kde6_src_prepare
}

src_configure() {
	  local mycmakeargs=(
	      $(cmake_use_find_package usb USB1)
	  )
	  kde6_src_configure
}

src_install() {
	  kde6_src_install
	  # TODO: Make this fully obsolete by /etc/os-release
	  insinto /etc/xdg
	  doins "${FILESDIR}"/kcm-about-distrorc
	  insinto /usr/share/${PN}
	  doins "${FILESDIR}"/mlogo-small.png
}

pkg_postinst() {
	  optfeature_header "Query network filesystem info:"
	  optfeature "NFS information module" net-fs/nfs-utils
	  optfeature "Samba status information module" net-fs/samba
	  optfeature_header "Query firmware/hardware info:"
	  optfeature "System DMI table readout" sys-apps/dmidecode
	  optfeature "Firmware security module" "app-text/aha sys-apps/fwupd"
	  optfeature "PCI devices information module" sys-apps/pciutils
	  optfeature "advanced CPU information module" sys-apps/util-linux
	  optfeature_header "Query GPU/graphics support info:"
	  optfeature "OpenCL information module" dev-util/clinfo
	  optfeature "OpenGL information module" x11-apps/mesa-progs
	  optfeature "Vulkan graphics API information module" dev-util/vulkan-tools
	  optfeature "Wayland information module" app-misc/wayland-utils
	  optfeature "X Server information module" x11-apps/xdpyinfo
	  xdg_pkg_postinst
}


# vim: filetype=ebuild
