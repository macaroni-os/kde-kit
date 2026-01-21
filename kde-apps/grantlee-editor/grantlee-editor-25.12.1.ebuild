# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit kde6

DESCRIPTION="Utilities and tools to manage themes in KDE PIM applications"
HOMEPAGE="https://invent.kde.org/"
SRC_URI="https://download.kde.org/stable/release-service/25.12.1/src/grantlee-editor-25.12.1.tar.xz -> grantlee-editor-25.12.1.tar.xz"
SLOT="6"
KEYWORDS="*"
RDEPEND=">=dev-libs/ktextaddons-1.6.0:6
	dev-qt/qtbase:6[gui]
	dev-qt/qtwebengine:6[widgets]
	kde-apps/akonadi-contacts:6=
	kde-apps/grantleetheme:6=
	kde-apps/kmime:6=
	kde-apps/messagelib:6=
	kde-apps/pimcommon:6=
	kde-frameworks/karchive:6
	kde-frameworks/kcompletion:6
	kde-frameworks/kconfig:6
	kde-frameworks/kconfigwidgets:6
	kde-frameworks/kcontacts:6
	kde-frameworks/kcoreaddons:6
	kde-frameworks/kcrash:6
	kde-frameworks/kdbusaddons:6
	kde-frameworks/ki18n:6
	kde-frameworks/kio:6
	kde-frameworks/syntax-highlighting:6
	kde-frameworks/kwidgetsaddons:6
	kde-frameworks/kxmlgui:6
	
"
DEPEND="${RDEPEND}
	
"
src_prepare() {
	  kde6_src_prepare
}


# vim: filetype=ebuild
