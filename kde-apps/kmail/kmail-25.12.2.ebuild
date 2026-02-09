# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit cmake

DESCRIPTION="Email client, supporting POP3 and IMAP mailboxes"
HOMEPAGE="https://apps.kde.org/kmail2/"
SRC_URI="https://download.kde.org/stable/release-service/25.12.2/src/kmail-25.12.2.tar.xz -> kmail-25.12.2.tar.xz"
SLOT="6"
KEYWORDS="*"
IUSE="activities speech telemetry"
RESTRICT="test"
BDEPEND="dev-libs/libxslt
	
"
RDEPEND="virtual/kde-seed[gui]
	dev-qt/qtwebengine:6
	>=dev-libs/qtkeychain-0.14.2:=[qt6(+)]
	=kde-apps/kdepim-runtime*:6
	=kde-apps/kmail-account-wizard*:6
	dev-cpp/gpgmepp:=
	dev-libs/qgpgme:=
	>=dev-libs/ktextaddons-1.6.0:6[speech?]
	>=dev-libs/libgpg-error-1.36
	kde-apps/akonadi:6=
	kde-apps/akonadi-contacts:6=
	kde-apps/akonadi-mime:6=
	kde-apps/akonadi-search:6=
	kde-apps/kcalutils:6=
	kde-apps/kidentitymanagement:6=
	kde-apps/kldap:6=
	kde-apps/kmailtransport:6=
	kde-apps/kmime:6=
	kde-apps/kontactinterface:6=
	kde-apps/kpimtextedit:6=[speech=]
	kde-apps/libgravatar:6=
	kde-apps/libkdepim:6=
	kde-apps/libkleo:6=
	kde-apps/libksieve:6=
	kde-apps/libktnef:6=
	kde-apps/mailcommon:6=
	kde-apps/messagelib:6=
	kde-apps/pimcommon:6=[activities?]
	kde-frameworks/kbookmarks:6
	kde-frameworks/kcalendarcore:6
	kde-frameworks/kcmutils:6
	kde-frameworks/kcodecs:6
	kde-frameworks/kcolorscheme:6
	kde-frameworks/kcompletion:6
	kde-frameworks/kconfig:6
	kde-frameworks/kcontacts:6
	kde-frameworks/kcoreaddons:6
	kde-frameworks/kcrash:6
	kde-frameworks/kdbusaddons:6
	kde-frameworks/kguiaddons:6
	kde-frameworks/ki18n:6
	kde-frameworks/kiconthemes:6
	kde-frameworks/kio:6
	kde-frameworks/kitemmodels:6
	kde-frameworks/kitemviews:6
	kde-frameworks/kjobwidgets:6
	kde-frameworks/knotifications:6
	kde-frameworks/knotifyconfig:6
	kde-frameworks/kparts:6
	kde-frameworks/kservice:6
	kde-frameworks/kstatusnotifieritem:6
	kde-frameworks/kwidgetsaddons:6
	kde-frameworks/kwindowsystem:6[X]
	kde-frameworks/kxmlgui:6
	kde-frameworks/sonnet:6
	activities? ( kde-plasma/plasma-activities:6 )
	telemetry? ( kde-frameworks/kuserfeedback:6 )
	
"
DEPEND="${RDEPEND}
"

# vim: filetype=ebuild
