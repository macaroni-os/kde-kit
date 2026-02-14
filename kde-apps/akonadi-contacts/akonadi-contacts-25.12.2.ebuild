# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit cmake

DESCRIPTION="Library for akonadi contact integration"
HOMEPAGE="https://invent.kde.org/"
SRC_URI="https://download.kde.org/stable/release-service/25.12.2/src/akonadi-contacts-25.12.2.tar.xz -> akonadi-contacts-25.12.2.tar.xz"
SLOT="6"
KEYWORDS="*"
RDEPEND="virtual/kde-seed[gui]
	>=dev-cpp/gpgmepp-1.23.2:=
	>=dev-libs/qgpgme-1.23.2:=
	kde-apps/akonadi:6=
	kde-apps/akonadi-mime:6=
	kde-apps/kidentitymanagement:6=
	kde-apps/kmime:6=
	kde-apps/libkleo:6=
	kde-frameworks/kcodecs:6
	kde-frameworks/kconfig:6
	kde-frameworks/kcontacts:6
	kde-frameworks/kcoreaddons:6
	kde-frameworks/ki18n:6
	kde-frameworks/kio:6
	kde-frameworks/kitemmodels:6
	kde-frameworks/ktextwidgets:6
	kde-frameworks/kxmlgui:6
	
"
DEPEND="${RDEPEND}
"

# vim: filetype=ebuild
