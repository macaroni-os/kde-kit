# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit cmake

DESCRIPTION="Runtime plugin collection to extend the functionality of KDE PIM"
HOMEPAGE="https://apps.kde.org/kontact/"
SRC_URI="https://download.kde.org/stable/release-service/25.12.2/src/kdepim-runtime-25.12.2.tar.xz -> kdepim-runtime-25.12.2.tar.xz"
SLOT="6"
KEYWORDS="*"
IUSE="activities speech"
RDEPEND="virtual/kde-seed[gui]
	dev-qt/qtnetworkauth:6
	dev-qt/qtwebengine:6
	>=app-crypt/qca-2.3.7:2[qt6(+)]
	dev-libs/cyrus-sasl:2
	>=dev-libs/qtkeychain-0.14.2:=[qt6(+)]
	>=dev-libs/ktextaddons-1.6.0:6
	kde-apps/akonadi:6=
	kde-apps/akonadi-calendar:6=
	kde-apps/akonadi-contacts:6=
	kde-apps/akonadi-mime:6=
	kde-apps/kcalutils:6=
	kde-apps/kidentitymanagement:6=
	kde-apps/kimap:6=
	kde-apps/kldap:6=
	kde-apps/kmailtransport:6=
	kde-apps/kmbox:6=
	kde-apps/kmime:6=
	kde-apps/libkgapi:6=
	kde-apps/pimcommon:6=[activities?]
	kde-frameworks/kcalendarcore:6
	kde-frameworks/kcmutils:6
	kde-frameworks/kcodecs:6
	kde-frameworks/kcompletion:6
	kde-frameworks/kconfig:6
	kde-frameworks/kconfigwidgets:6
	kde-frameworks/kcontacts:6
	kde-frameworks/kcoreaddons:6
	kde-frameworks/kdav:6
	kde-frameworks/ki18n:6
	kde-frameworks/kio:6
	kde-frameworks/kitemmodels:6
	kde-frameworks/kjobwidgets:6
	kde-frameworks/knotifications:6
	kde-frameworks/knotifyconfig:6
	kde-frameworks/kservice:6
	kde-frameworks/kwallet:6
	kde-frameworks/kwidgetsaddons:6
	kde-frameworks/kwindowsystem:6
	kde-frameworks/kxmlgui:6
	activities? ( kde-plasma/plasma-activities:6 )
	speech? ( dev-qt/qtspeech:6 )
	
"
DEPEND="${RDEPEND}
"

# vim: filetype=ebuild
