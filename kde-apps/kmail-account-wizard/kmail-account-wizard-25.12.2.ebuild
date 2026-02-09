# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit cmake

DESCRIPTION="Assistant for KMail accounts configuration"
HOMEPAGE="https://invent.kde.org/"
SRC_URI="https://download.kde.org/stable/release-service/25.12.2/src/kmail-account-wizard-25.12.2.tar.xz -> kmail-account-wizard-25.12.2.tar.xz"
SLOT="6"
KEYWORDS="*"
RDEPEND="virtual/kde-seed[gui]
	dev-cpp/gpgmepp:=
	dev-libs/qgpgme:=
	>=dev-libs/qtkeychain-0.14.2:=[qt6(+)]
	kde-apps/akonadi:6=
	kde-apps/kidentitymanagement:6=
	kde-apps/kmailtransport:6=
	kde-apps/kmime:6=
	kde-apps/libkdepim:6=
	kde-apps/pimcommon:6=
	kde-frameworks/kcmutils:6
	kde-frameworks/kcodecs:6
	kde-frameworks/kconfig:6
	kde-frameworks/kcoreaddons:6
	kde-frameworks/kcrash:6
	kde-frameworks/kdbusaddons:6
	kde-frameworks/ki18n:6
	kde-frameworks/kiconthemes:6
	kde-frameworks/kio:6
	kde-frameworks/kitemviews:6
	kde-frameworks/knewstuff:6
	kde-frameworks/knotifications:6
	kde-frameworks/knotifyconfig:6
	kde-frameworks/kservice:6
	kde-frameworks/ktexteditor:6
	kde-frameworks/kwallet:6
	kde-frameworks/kwidgetsaddons:6
	kde-frameworks/kxmlgui:6
	
"
DEPEND="${RDEPEND}
"

# vim: filetype=ebuild
