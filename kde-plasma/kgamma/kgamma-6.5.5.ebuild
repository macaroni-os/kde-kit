# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit cmake

DESCRIPTION="Monitor calibration tool for KDE"
HOMEPAGE="https://invent.kde.org/plasma/"
SRC_URI="https://download.kde.org/stable/plasma/6.5.5/kgamma-6.5.5.tar.xz -> kgamma-6.5.5.tar.xz"
SLOT="6"
KEYWORDS="*"
BDEPEND="kde-frameworks/kcmutils:6
	
"
RDEPEND="virtual/kde-seed[gui]
	kde-frameworks/kconfig:6
	kde-frameworks/kconfigwidgets:6
	kde-frameworks/kcoreaddons:6
	kde-frameworks/kdoctools:6
	kde-frameworks/ki18n:6
	x11-libs/libX11
	x11-libs/libXxf86vm
	
"
DEPEND="${RDEPEND}
"

# vim: filetype=ebuild
