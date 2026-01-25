# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit kde6 fcaps xdg

DESCRIPTION="Power management for KDE Plasma Shell"
HOMEPAGE="https://invent.kde.org/plasma/"
SRC_URI="https://download.kde.org/stable/plasma/6.5.5/powerdevil-6.5.5.tar.xz -> powerdevil-6.5.5.tar.xz"
SLOT="6"
KEYWORDS="*"
IUSE="brightness-control"
RDEPEND="!<kde-plasma/plasma-workspace-6.1.90:*
	dev-qt/qtdeclarative:6
	|| (
	    sys-power/power-profiles-daemon
	    sys-power/tlp
	)
	>=sys-power/upower-0.9.23
	
"
DEPEND="${RDEPEND}
	dev-libs/qcoro[dbus]
	dev-libs/wayland
	dev-qt/qtbase:6[gui,wayland]
	kde-frameworks/kauth:6[policykit]
	kde-frameworks/kcmutils:6
	kde-frameworks/kconfig:6
	kde-frameworks/kconfigwidgets:6
	kde-frameworks/kcoreaddons:6
	kde-frameworks/kcrash:6
	kde-frameworks/kdbusaddons:6
	kde-frameworks/kglobalaccel:6
	kde-frameworks/ki18n:6
	kde-frameworks/kidletime:6
	kde-frameworks/kio:6
	kde-frameworks/kirigami:6
	kde-frameworks/kitemmodels:6
	kde-frameworks/knotifications:6
	kde-frameworks/krunner:6
	kde-frameworks/kservice:6
	kde-frameworks/kwindowsystem:6[X]
	kde-frameworks/kxmlgui:6
	kde-frameworks/solid:6
	kde-plasma/libkscreen:6
	kde-plasma/libplasma:6
	kde-plasma/plasma-activities:6
	kde-plasma/plasma-workspace:6
	virtual/libudev:=
	x11-libs/libxcb
	brightness-control? ( app-misc/ddcutil:= )
	
"
src_prepare() {
	  kde6_src_prepare
}

src_configure() {
	  local mycmakeargs=(
	      $(cmake_use_find_package brightness-control DDCUtil)
	  )
	  kde6_src_configure
}


# vim: filetype=ebuild
