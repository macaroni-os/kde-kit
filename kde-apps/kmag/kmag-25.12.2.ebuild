# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit cmake

DESCRIPTION="KDE screen magnifier"
HOMEPAGE="https://apps.kde.org/kmag/"
SRC_URI="https://download.kde.org/stable/release-service/25.12.2/src/kmag-25.12.2.tar.xz -> kmag-25.12.2.tar.xz"
SLOT="6"
KEYWORDS="*"
IUSE="keyboardfocus"
RDEPEND="virtual/kde-seed[gui]
	kde-frameworks/kconfig:6
	kde-frameworks/kconfigwidgets:6
	kde-frameworks/kcoreaddons:6
	kde-frameworks/kcrash:6
	kde-frameworks/ki18n:6
	kde-frameworks/kio:6
	kde-frameworks/kwidgetsaddons:6
	kde-frameworks/kxmlgui:6
	keyboardfocus? ( >=media-libs/libqaccessibilityclient-0.6:6 )
	
"
DEPEND="${RDEPEND}
"

# vim: filetype=ebuild
