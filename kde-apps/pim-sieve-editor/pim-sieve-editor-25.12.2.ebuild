# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit kde6 xdg

DESCRIPTION="Assistant for editing IMAP Sieve filters"
HOMEPAGE="https://invent.kde.org/"
SRC_URI="https://download.kde.org/stable/release-service/25.12.2/src/pim-sieve-editor-25.12.2.tar.xz -> pim-sieve-editor-25.12.2.tar.xz"
SLOT="6"
KEYWORDS="*"
IUSE="telemetry"
RDEPEND=">=dev-libs/qtkeychain-0.14.2:=[qt6(+)]
	dev-qt/qtbase:6[gui]
	kde-apps/akonadi:6=
	kde-apps/akonadi-contacts:6=
	kde-apps/akonadi-mime:6=
	kde-apps/calendarsupport:6=
	kde-apps/kmailtransport:6=
	kde-apps/libksieve:6=
	kde-apps/pimcommon:6=
	kde-frameworks/kbookmarks:6
	kde-frameworks/kcalendarcore:6
	kde-frameworks/kconfig:6
	kde-frameworks/kconfigwidgets:6
	kde-frameworks/kcontacts:6
	kde-frameworks/kcoreaddons:6
	kde-frameworks/kcrash:6
	kde-frameworks/kdbusaddons:6
	kde-frameworks/ki18n:6
	kde-frameworks/kiconthemes:6
	kde-frameworks/kwidgetsaddons:6
	kde-frameworks/kwindowsystem:6
	kde-frameworks/kxmlgui:6
	telemetry? ( kde-frameworks/kuserfeedback:6 )
	
"
DEPEND="${RDEPEND}
	
"
src_prepare() {
	  kde6_src_prepare
}


# vim: filetype=ebuild
