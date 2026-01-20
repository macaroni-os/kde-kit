# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit kde6 xdg

DESCRIPTION="Wacom system settings module that supports different button/pen layout profiles"
HOMEPAGE="https://userbase.kde.org/Wacomtablet"
SRC_URI="https://download.kde.org/stable/plasma/6.5.5/wacomtablet-6.5.5.tar.xz -> wacomtablet-6.5.5.tar.xz"
LICENSE="GPL-2"
SLOT="6"
KEYWORDS="*"
BDEPEND="sys-devel/gettext
	
"
RDEPEND=">=dev-libs/libwacom-0.30:=
	dev-qt/qtbase:6[gui]
	dev-qt/qtdeclarative:6
	kde-frameworks/kcmutils:6
	kde-frameworks/kconfig:6
	kde-frameworks/kconfigwidgets:6
	kde-frameworks/kcoreaddons:6
	kde-frameworks/kdbusaddons:6
	kde-frameworks/kglobalaccel:6
	kde-frameworks/ki18n:6
	kde-frameworks/kio:6
	kde-frameworks/knotifications:6
	kde-frameworks/kwidgetsaddons:6
	kde-frameworks/kwindowsystem:6
	kde-frameworks/kxmlgui:6
	kde-plasma/libplasma:6
	kde-plasma/plasma5support:6
	>=x11-drivers/xf86-input-wacom-0.20.0
	x11-libs/libXi
	x11-libs/libxcb
	
"
DEPEND="${RDEPEND}
	x11-base/xorg-proto
	x11-libs/libX11
	
"
src_prepare() {
	  kde6_src_prepare
}

src_test() {
	  # test needs DBus, bug 675548
	  local myctestargs=(
	      -E "(Test.KDED.DBusTabletService)"
	  )
	   kde6_src_test
}


# vim: filetype=ebuild
