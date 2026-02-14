# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit cmake

DESCRIPTION="Application to manage alarms and other timer based alerts for the desktop"
HOMEPAGE="https://apps.kde.org/kalarm/ https://userbase.kde.org/KAlarm"
SRC_URI="https://download.kde.org/stable/release-service/25.12.2/src/kalarm-25.12.2.tar.xz -> kalarm-25.12.2.tar.xz"
SLOT="6"
KEYWORDS="*"
IUSE="mpv +pim speech X"
RDEPEND="virtual/kde-seed[gui]
	pim? ( =kde-apps/kdepim-runtime*:6 )
	kde-apps/kcalutils:6=
	kde-apps/kidentitymanagement:6=
	kde-apps/kmime:6=
	kde-frameworks/kauth:6
	kde-frameworks/kcalendarcore:6
	kde-frameworks/kcodecs:6
	kde-frameworks/kcolorscheme:6
	kde-frameworks/kcompletion:6
	kde-frameworks/kconfig:6
	kde-frameworks/kconfigwidgets:6
	kde-frameworks/kcontacts:6
	kde-frameworks/kcoreaddons:6
	kde-frameworks/kcrash:6
	kde-frameworks/kdbusaddons:6
	kde-frameworks/kglobalaccel:6
	kde-frameworks/kguiaddons:6
	kde-frameworks/kholidays:6
	kde-frameworks/ki18n:6
	kde-frameworks/kiconthemes:6
	kde-frameworks/kio:6
	kde-frameworks/kitemmodels:6
	kde-frameworks/kjobwidgets:6
	kde-frameworks/knotifications:6
	kde-frameworks/knotifyconfig:6
	kde-frameworks/kservice:6
	kde-frameworks/kstatusnotifieritem:6
	kde-frameworks/ktextwidgets:6
	kde-frameworks/kwidgetsaddons:6
	kde-frameworks/kwindowsystem:6[X?]
	kde-frameworks/kxmlgui:6
	mpv? ( >=media-video/mpv-0.37.0:=[libmpv] )
	!mpv? ( media-video/vlc:= )
	pim? (
	  kde-apps/akonadi:6=
	  kde-apps/akonadi-contacts:6=
	  kde-apps/akonadi-mime:6=
	  kde-apps/kmailtransport:6=
	)
	speech? ( >=dev-libs/ktextaddons-1.6.0:6[speech] )
	X? ( x11-libs/libX11 )
	
"
DEPEND="${RDEPEND}
"

# vim: filetype=ebuild
