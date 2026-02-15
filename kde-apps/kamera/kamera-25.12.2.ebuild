# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit cmake

DESCRIPTION="Plasma integration for gphoto2 cameras"
HOMEPAGE="https://apps.kde.org/kamera/"
SRC_URI="https://download.kde.org/stable/release-service/25.12.2/src/kamera-25.12.2.tar.xz -> kamera-25.12.2.tar.xz"
SLOT="6"
KEYWORDS="*"
BDEPEND="kde-frameworks/kcmutils:6
	sys-devel/gettext
	
"
RDEPEND="virtual/kde-seed[gui]
	kde-frameworks/kconfig:6
	kde-frameworks/kconfigwidgets:6
	kde-frameworks/kcoreaddons:6
	kde-frameworks/kxmlgui:6
	kde-frameworks/ki18n:6
	kde-frameworks/kio:6
	kde-frameworks/kwidgetsaddons:6
	>=media-libs/libgphoto2-2.5.0:=
	
"
DEPEND="${RDEPEND}
"

# vim: filetype=ebuild
