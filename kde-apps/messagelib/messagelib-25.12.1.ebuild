# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit kde6

DESCRIPTION="Libraries for messaging functions"
HOMEPAGE="https://invent.kde.org/"
SRC_URI="https://download.kde.org/stable/release-service/25.12.1/src/messagelib-25.12.1.tar.xz -> messagelib-25.12.1.tar.xz"
SLOT="6"
KEYWORDS="*"
IUSE="speech"
RESTRICT="test"
RDEPEND="dev-cpp/gpgmepp:=
	dev-libs/qgpgme:=
	>=dev-libs/openssl-3.0.0:=
	>=dev-libs/ktextaddons-1.6.0:6[speech?]
	dev-qt/qtbase:6[gui]
	dev-qt/qtwebengine:6[widgets]
	kde-apps/akonadi:6=
	kde-apps/akonadi-contacts:6=
	kde-apps/akonadi-mime:6=
	kde-apps/akonadi-search:6=
	kde-apps/grantleetheme:6=
	kde-apps/kidentitymanagement:6=
	kde-apps/kldap:6=
	kde-apps/kmailtransport:6=
	kde-apps/kmbox:6=
	kde-apps/kmime:6=
	kde-apps/kpimtextedit:6=[speech=]
	kde-apps/libgravatar:6=
	kde-apps/libkdepim:6=
	kde-apps/libkleo:6=
	kde-apps/mimetreeparser:6=
	kde-apps/pimcommon:6=
	kde-frameworks/karchive:6
	kde-frameworks/kcalendarcore:6
	kde-frameworks/kcodecs:6
	kde-frameworks/kcompletion:6
	kde-frameworks/kconfig:6
	kde-frameworks/kcontacts:6
	kde-frameworks/kcoreaddons:6
	kde-frameworks/kguiaddons:6
	kde-frameworks/ki18n:6
	kde-frameworks/kiconthemes:6
	kde-frameworks/kio:6
	kde-frameworks/kitemmodels:6
	kde-frameworks/kitemviews:6
	kde-frameworks/kjobwidgets:6
	kde-frameworks/knotifications:6
	kde-frameworks/kservice:6
	kde-frameworks/ktexttemplate:6
	kde-frameworks/ktextwidgets:6
	kde-frameworks/kwidgetsaddons:6
	kde-frameworks/kwindowsystem:6
	kde-frameworks/kxmlgui:6
	kde-frameworks/sonnet:6
	kde-frameworks/syntax-highlighting:6
	
"
DEPEND="${RDEPEND}
	
"
src_prepare() {
	  kde6_src_prepare
}


# vim: filetype=ebuild
