# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit kde6 fcaps xdg

DESCRIPTION="Library and components for secure lock screen architecture"
HOMEPAGE="https://invent.kde.org/plasma/"
SRC_URI="https://download.kde.org/stable/plasma/6.5.5/kscreenlocker-6.5.5.tar.xz -> kscreenlocker-6.5.5.tar.xz"
SLOT="6"
KEYWORDS="*"
IUSE="consolekit elogind systemd"
BDEPEND="kde-frameworks/kcmutils:6
	
"
RDEPEND="kde-frameworks/kdeclarative:6
	kde-frameworks/kirigami:6
	
"
DEPEND="${RDEPEND}
	dev-libs/wayland
	dev-qt/qtbase:6[gui,wayland]
	dev-qt/qtdeclarative:6
	kde-frameworks/kcmutils:6
	kde-frameworks/kconfig:6
	kde-frameworks/kconfigwidgets:6
	kde-frameworks/kcoreaddons:6
	kde-frameworks/kcrash:6
	kde-frameworks/kglobalaccel:6
	kde-frameworks/ki18n:6
	kde-frameworks/kidletime:6[wayland]
	kde-frameworks/knotifications:6
	kde-frameworks/kpackage:6
	kde-frameworks/ksvg:6
	kde-frameworks/kwidgetsaddons:6
	kde-frameworks/kwindowsystem:6
	kde-frameworks/kxmlgui:6
	kde-frameworks/solid:6
	kde-plasma/kwayland:6
	kde-plasma/layer-shell-qt:6
	kde-plasma/libplasma:6
	kde-plasma/libkscreen:6
	x11-libs/libX11
	x11-libs/libXi
	x11-libs/libxcb
	x11-libs/xcb-util-keysyms
	consolekit? ( sys-auth/consolekit )
	elogind? ( sys-auth/elogind[pam] )
	systemd? ( sys-apps/systemd:=[pam] )
	
"
src_prepare() {
	  kde6_src_prepare
}

src_configure() {
	  local mycmakeargs=(
	      $(cmake_use_find_package consolekit ConsoleKit)
	      $(cmake_use_find_package elogind Elogind)
	      $(cmake_use_find_package systemd Systemd)
	  )
	  kde6_src_configure
}
src_install() {
	  kde6_src_install
	   newpamd "${FILESDIR}/kde-r1.pam" kde
	  newpamd "${FILESDIR}/kde-fingerprint.pam" kde-fingerprint
	  newpamd "${FILESDIR}/kde-smartcard.pam" kde-smartcard
}


# vim: filetype=ebuild
