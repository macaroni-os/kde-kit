# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit cmake

DESCRIPTION="Implementation of ssh-askpass with KDE Wallet integration"
HOMEPAGE="https://invent.kde.org/plasma/"
SRC_URI="https://download.kde.org/stable/plasma/6.5.5/ksshaskpass-6.5.5.tar.xz -> ksshaskpass-6.5.5.tar.xz"
SLOT="6"
KEYWORDS="*"
RDEPEND="virtual/kde-seed[gui]
	net-misc/openssh
	kde-frameworks/kcoreaddons:6
	kde-frameworks/ki18n:6
	kde-frameworks/kwallet:6
	kde-frameworks/kwidgetsaddons:6
	
"
DEPEND="${RDEPEND}
"

# vim: filetype=ebuild
