# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit kde6

DESCRIPTION="Common PIM libraries"
HOMEPAGE="https://invent.kde.org/"
SRC_URI="https://download.kde.org/stable/release-service/25.12.2/src/libksieve-25.12.2.tar.xz -> libksieve-25.12.2.tar.xz"
SLOT="6"
KEYWORDS="*"
IUSE="speech"
RESTRICT="test"
RDEPEND="dev-libs/cyrus-sasl:2
	>=dev-libs/ktextaddons-1.6.0:6[speech?]
	dev-qt/qtbase:6[gui]
	dev-qt/qtwebengine
	kde-apps/kidentitymanagement:6=
	kde-apps/kmime:6=
	kde-apps/libkdepim:6=
	kde-apps/pimcommon:6=
	kde-frameworks/karchive:6
	kde-frameworks/kcolorscheme:6
	kde-frameworks/kcompletion:6
	kde-frameworks/kconfig:6
	kde-frameworks/kconfigwidgets:6
	kde-frameworks/kcoreaddons:6
	kde-frameworks/ki18n:6
	kde-frameworks/kiconthemes:6
	kde-frameworks/kio:6
	kde-frameworks/knewstuff:6
	kde-frameworks/kwidgetsaddons:6
	kde-frameworks/sonnet:6
	kde-frameworks/syntax-highlighting:6
	
"
DEPEND="${RDEPEND}
	dev-libs/cyrus-sasl:2
	>=dev-libs/ktextaddons-1.6.0:6[speech?]
	dev-qt/qtbase:6[gui]
	dev-qt/qtwebengine:6
	kde-apps/kidentitymanagement:6=
	kde-apps/kmime:6=
	kde-apps/libkdepim:6=
	kde-apps/pimcommon:6=
	kde-frameworks/karchive:6
	kde-frameworks/kcolorscheme:6
	kde-frameworks/kcompletion:6
	kde-frameworks/kconfig:6
	kde-frameworks/kconfigwidgets:6
	kde-frameworks/kcoreaddons:6
	kde-frameworks/ki18n:6
	kde-frameworks/kiconthemes:6
	kde-frameworks/kio:6
	kde-frameworks/knewstuff:6
	kde-frameworks/kwidgetsaddons:6
	kde-frameworks/sonnet:6
	kde-frameworks/syntax-highlighting:6
	
"
src_prepare() {
	  kde6_src_prepare
}


# vim: filetype=ebuild
