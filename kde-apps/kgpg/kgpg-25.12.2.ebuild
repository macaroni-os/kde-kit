# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit cmake

DESCRIPTION="Frontend for GnuPG, a powerful encryption utility by KDE"
HOMEPAGE="https://apps.kde.org/kgpg/"
SRC_URI="https://download.kde.org/stable/release-service/25.12.2/src/kgpg-25.12.2.tar.xz -> kgpg-25.12.2.tar.xz"
SLOT="6"
KEYWORDS="*"
RDEPEND="virtual/kde-seed[gui]
	kde-apps/akonadi:6=
	kde-apps/akonadi-contacts:6=
	kde-frameworks/karchive:6
	kde-frameworks/kcodecs:6
	kde-frameworks/kconfig:6
	kde-frameworks/kconfigwidgets:6
	kde-frameworks/kcontacts:6
	kde-frameworks/kcoreaddons:6
	kde-frameworks/kcrash:6
	kde-frameworks/kdbusaddons:6
	kde-frameworks/ki18n:6
	kde-frameworks/kio:6
	kde-frameworks/kjobwidgets:6
	kde-frameworks/knotifications:6
	kde-frameworks/kservice:6
	kde-frameworks/kstatusnotifieritem:6
	kde-frameworks/ktextwidgets:6
	kde-frameworks/kwidgetsaddons:6
	kde-frameworks/kwindowsystem:6
	kde-frameworks/kxmlgui:6
	app-crypt/gnupg
	
"
DEPEND="${RDEPEND}
"

# vim: filetype=ebuild
