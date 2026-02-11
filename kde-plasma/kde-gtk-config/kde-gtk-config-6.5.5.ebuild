# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit cmake

DESCRIPTION="GTK+ theme configuration for KDE Plasma desktop"
HOMEPAGE="https://invent.kde.org/plasma/"
SRC_URI="https://download.kde.org/stable/plasma/6.5.5/kde-gtk-config-6.5.5.tar.xz -> kde-gtk-config-6.5.5.tar.xz"
SLOT="6"
KEYWORDS="*"
BDEPEND="kde-frameworks/kcmutils:6
	virtual/pkgconfig
	
"
RDEPEND="dev-libs/glib:2
	virtual/kde-seed[gui,declarative,svg]
	kde-frameworks/kconfig:6
	kde-frameworks/kconfigwidgets:6
	kde-frameworks/kcoreaddons:6
	kde-frameworks/kdbusaddons:6
	kde-frameworks/kdeclarative:6
	kde-frameworks/kguiaddons:6
	kde-frameworks/ki18n:6
	kde-frameworks/kio:6
	kde-frameworks/kirigami:6
	kde-frameworks/knewstuff:6
	kde-frameworks/kservice:6
	kde-frameworks/kwindowsystem:6
	x11-libs/gtk+:3[X]
	
"
DEPEND="${RDEPEND}
"

# vim: filetype=ebuild
