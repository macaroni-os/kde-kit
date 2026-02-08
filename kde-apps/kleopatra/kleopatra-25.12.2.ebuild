# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit kde6 xdg

DESCRIPTION="Certificate manager and GUI for OpenPGP and CMS cryptography"
HOMEPAGE="https://apps.kde.org/kleopatra/"
SRC_URI="https://download.kde.org/stable/release-service/25.12.2/src/kleopatra-25.12.2.tar.xz -> kleopatra-25.12.2.tar.xz"
SLOT="6"
KEYWORDS="*"
IUSE="pim"
RESTRICT="test"
RDEPEND=">=app-crypt/gnupg-2.1
	app-crypt/paperkey
	
"
DEPEND="${RDEPEND}
	dev-cpp/gpgmepp:=
	dev-libs/qgpgme:=
	dev-libs/libassuan:=
	dev-libs/libgpg-error
	dev-qt/qtbase:6[gui]
	kde-apps/kmime:6=
	kde-apps/libkleo:6=
	kde-apps/mimetreeparser:6=
	kde-frameworks/kcodecs:6
	kde-frameworks/kcolorscheme:6
	kde-frameworks/kconfig:6
	kde-frameworks/kconfigwidgets:6
	kde-frameworks/kcoreaddons:6
	kde-frameworks/kcrash:6
	kde-frameworks/kdbusaddons:6
	kde-frameworks/ki18n:6
	kde-frameworks/kiconthemes:6
	kde-frameworks/kio:6
	kde-frameworks/kitemmodels:6
	kde-frameworks/knotifications:6
	kde-frameworks/ktextwidgets:6
	kde-frameworks/kwidgetsaddons:6
	kde-frameworks/kwindowsystem:6
	kde-frameworks/kxmlgui:6
	pim? (
	kde-apps/akonadi-mime:6=
	kde-apps/kidentitymanagement:6=
	kde-apps/kmailtransport:6=
	)
	
"
src_prepare() {
	  kde6_src_prepare
}


# vim: filetype=ebuild
