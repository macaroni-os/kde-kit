# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit kde6

DESCRIPTION="Library for akonadi calendar integration"
HOMEPAGE="https://invent.kde.org/"
SRC_URI="https://download.kde.org/stable/release-service/25.12.2/src/akonadi-calendar-25.12.2.tar.xz -> akonadi-calendar-25.12.2.tar.xz"
SLOT="6"
KEYWORDS="*"
RESTRICT="test"
RDEPEND=">=dev-cpp/gpgmepp-1.23.2:=
	>=dev-libs/qgpgme-1.23.2:=
	dev-qt/qtbase:6[gui]
	kde-apps/akonadi:6=
	kde-apps/akonadi-contacts:6=
	kde-apps/akonadi-mime:6=
	kde-apps/kcalutils:6=
	kde-apps/kidentitymanagement:6=
	kde-apps/kmailtransport:6=
	kde-apps/kmime:6=
	kde-apps/libkleo:6=
	kde-apps/messagelib:6=
	kde-frameworks/kcalendarcore:6
	kde-frameworks/kcodecs:6
	kde-frameworks/kconfig:6
	kde-frameworks/kconfigwidgets:6
	kde-frameworks/kcoreaddons:6
	kde-frameworks/kcrash:6
	kde-frameworks/kdbusaddons:6
	kde-frameworks/ki18n:6
	kde-frameworks/kiconthemes:6
	kde-frameworks/kio:6
	kde-frameworks/kitemmodels:6
	kde-frameworks/kjobwidgets:6
	kde-frameworks/knotifications:6
	kde-frameworks/kwidgetsaddons:6
	kde-frameworks/kxmlgui:6
	
"
DEPEND="${RDEPEND}
	
"
src_prepare() {
	  kde6_src_prepare
}


# vim: filetype=ebuild
