# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit cmake

DESCRIPTION="Assistant to backup and archive PIM data and configuration"
HOMEPAGE="https://apps.kde.org/pimdataexporter/"
SRC_URI="https://download.kde.org/stable/release-service/25.12.2/src/pim-data-exporter-25.12.2.tar.xz -> pim-data-exporter-25.12.2.tar.xz"
SLOT="6"
KEYWORDS="*"
IUSE="telemetry"
RDEPEND="virtual/kde-seed[gui]
	>=dev-libs/ktextaddons-1.6.0:6
	kde-apps/akonadi:6=
	kde-apps/kidentitymanagement:6=
	kde-apps/kmailtransport:6=
	kde-apps/kmime:6=
	kde-apps/libkdepim:6=
	kde-apps/mailcommon:6=
	kde-apps/pimcommon:6=
	kde-frameworks/karchive:6
	kde-frameworks/kcalendarcore:6
	kde-frameworks/kconfig:6
	kde-frameworks/kcontacts:6
	kde-frameworks/kcoreaddons:6
	kde-frameworks/kcrash:6
	kde-frameworks/kdbusaddons:6
	kde-frameworks/ki18n:6
	kde-frameworks/kiconthemes:6
	kde-frameworks/kio:6
	kde-frameworks/kitemviews:6
	kde-frameworks/knotifications:6
	kde-frameworks/kstatusnotifieritem:6
	kde-frameworks/kwidgetsaddons:6
	kde-frameworks/kxmlgui:6
	telemetry? ( kde-frameworks/kuserfeedback:6 )
	
"
DEPEND="${RDEPEND}
"

# vim: filetype=ebuild
