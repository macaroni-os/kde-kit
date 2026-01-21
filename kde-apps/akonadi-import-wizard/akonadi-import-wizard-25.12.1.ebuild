# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit kde6

DESCRIPTION="Assistant to import PIM data from other applications into Akonadi for use in KDE PIM applications"
HOMEPAGE="https://userbase.kde.org/KMail/Import_Options"
SRC_URI="https://download.kde.org/stable/release-service/25.12.1/src/akonadi-import-wizard-25.12.1.tar.xz -> akonadi-import-wizard-25.12.1.tar.xz"
SLOT="6"
KEYWORDS="*"
RDEPEND="dev-qt/qtbase:6[gui]
	kde-apps/akonadi:6=
	kde-apps/kidentitymanagement:6=
	kde-apps/kmailtransport:6=
	kde-apps/kmime:6=
	kde-apps/mailcommon:6=
	kde-apps/mailimporter:6=
	kde-apps/messagelib:6=
	kde-apps/pimcommon:6=
	kde-frameworks/karchive:6
	kde-frameworks/kconfig:6
	kde-frameworks/kcontacts:6
	kde-frameworks/kcoreaddons:6
	kde-frameworks/kcrash:6
	kde-frameworks/kdbusaddons:6
	kde-frameworks/ki18n:6
	kde-frameworks/kio:6
	kde-frameworks/kwidgetsaddons:6
	
"
DEPEND="${RDEPEND}
	
"
src_prepare() {
	  kde6_src_prepare
}


# vim: filetype=ebuild
