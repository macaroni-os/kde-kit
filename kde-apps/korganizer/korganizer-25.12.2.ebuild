# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit cmake

DESCRIPTION="Organizational assistant, providing calendars and other similar functionality"
HOMEPAGE="https://apps.kde.org/korganizer/"
SRC_URI="https://download.kde.org/stable/release-service/25.12.2/src/korganizer-25.12.2.tar.xz -> korganizer-25.12.2.tar.xz"
SLOT="6"
KEYWORDS="*"
IUSE="activities telemetry"
RDEPEND="virtual/kde-seed[gui]
	dev-qt/qttools:6
	kde-apps/akonadi:6=
	kde-apps/akonadi-calendar:6=
	kde-apps/akonadi-contacts:6=
	kde-apps/calendarsupport:6=
	kde-apps/eventviews:6=
	kde-apps/incidenceeditor:6=
	kde-apps/kcalutils:6=
	kde-apps/kidentitymanagement:6=
	kde-apps/kmailtransport:6=
	kde-apps/kmime:6=
	kde-apps/kontactinterface:6=
	kde-apps/libkdepim:6=
	kde-apps/pimcommon:6=[activities?]
	kde-frameworks/kcalendarcore:6
	kde-frameworks/kcmutils:6
	kde-frameworks/kconfig:6
	kde-frameworks/kcontacts:6
	kde-frameworks/kcoreaddons:6
	kde-frameworks/kcrash:6
	kde-frameworks/kholidays:6
	kde-frameworks/ki18n:6
	kde-frameworks/kiconthemes:6
	kde-frameworks/kio:6
	kde-frameworks/kitemmodels:6
	kde-frameworks/kitemviews:6
	kde-frameworks/kjobwidgets:6
	kde-frameworks/kparts:6
	kde-frameworks/kwidgetsaddons:6
	kde-frameworks/kwindowsystem:6
	kde-frameworks/kxmlgui:6
	x11-libs/libX11
	activities? ( kde-plasma/plasma-activities:6 )
	telemetry? ( kde-frameworks/kuserfeedback:6 )
	
"
DEPEND="${RDEPEND}
"

# vim: filetype=ebuild
