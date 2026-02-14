# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit cmake

DESCRIPTION="Common mail library"
HOMEPAGE="https://invent.kde.org/"
SRC_URI="https://download.kde.org/stable/release-service/25.12.2/src/mailcommon-25.12.2.tar.xz -> mailcommon-25.12.2.tar.xz"
SLOT="6"
KEYWORDS="*"
IUSE="activities"
RDEPEND="virtual/kde-seed[gui,multimedia]
	dev-cpp/gpgmepp:=
	dev-libs/qgpgme:=
	>=dev-libs/ktextaddons-1.6.0:6
	kde-apps/akonadi:6=
	kde-apps/akonadi-contacts:6=
	kde-apps/akonadi-mime:6=
	kde-apps/kmailtransport:6=
	kde-apps/kmime:6=
	kde-apps/kpimtextedit:6=
	kde-apps/libkdepim:6=
	kde-apps/mailimporter:6=
	kde-apps/messagelib:6=
	kde-apps/pimcommon:6=[activities?]
	kde-frameworks/karchive:6
	kde-frameworks/kcodecs:6
	kde-frameworks/kcolorscheme:6
	kde-frameworks/kcompletion:6
	kde-frameworks/kconfig:6
	kde-frameworks/kcontacts:6
	kde-frameworks/kdbusaddons:6
	kde-frameworks/kguiaddons:6
	kde-frameworks/ki18n:6
	kde-frameworks/kiconthemes:6
	kde-frameworks/kio:6
	kde-frameworks/kitemmodels:6
	kde-frameworks/kitemviews:6
	kde-frameworks/kwidgetsaddons:6
	kde-frameworks/kwindowsystem:6
	kde-frameworks/kxmlgui:6
	kde-frameworks/syntax-highlighting:6
	activities? ( kde-plasma/plasma-activities:6 )
	
"
DEPEND="${RDEPEND}
"

# vim: filetype=ebuild
