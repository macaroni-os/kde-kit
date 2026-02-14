# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit cmake xdg

DESCRIPTION="Utility providing information about the computer hardware"
HOMEPAGE="https://invent.kde.org/plasma/"
SRC_URI="https://download.kde.org/stable/plasma/6.5.5/kinfocenter-6.5.5.tar.xz -> kinfocenter-6.5.5.tar.xz"
SLOT="6"
KEYWORDS="*"
IUSE="gles2-only usb vulkan"
BDEPEND="kde-frameworks/kcmutils:6
	virtual/pkgconfig
	
"
RDEPEND="virtual/kde-seed[declarative,gui,gles2-only?,vulkan?]
	dev-qt/qttools:6
	kde-plasma/systemsettings:6
	kde-frameworks/kirigami:6
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
DEPEND="${RDEPEND}
"
src_prepare() {
	cmake_src_prepare
}
src_configure() {
	local mycmakeargs=(
	  $(cmake_use_find_package usb USB1)
	)
	cmake_src_configure
}
src_install() {
	cmake_src_install
	# TODO: Make this fully obsolete by /etc/os-release
	insinto /etc/xdg
	doins "${FILESDIR}"/kcm-about-distrorc
	insinto /usr/share/${PN}
	doins "${FILESDIR}"/mlogo-small.png
}
pkg_postinst() {
	xdg_pkg_postinst
}


# vim: filetype=ebuild
