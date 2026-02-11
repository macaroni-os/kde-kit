# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit cmake

DESCRIPTION="Samba filesharing plugin for file properties"
HOMEPAGE="https://apps.kde.org/kdenetwork_filesharing/"
SRC_URI="https://download.kde.org/stable/release-service/25.12.2/src/kdenetwork-filesharing-25.12.2.tar.xz -> kdenetwork-filesharing-25.12.2.tar.xz"
SLOT="6"
KEYWORDS="*"
RDEPEND="virtual/kde-seed[gui,declarative]
	dev-libs/qcoro
	kde-frameworks/kirigami:6
	kde-frameworks/kauth:6
	kde-frameworks/kcompletion:6
	kde-frameworks/kcoreaddons:6
	kde-frameworks/ki18n:6
	kde-frameworks/kio:6
	kde-frameworks/kwidgetsaddons:6
	net-fs/samba
	
"
DEPEND="${RDEPEND}
"

# vim: filetype=ebuild
