# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit kde6

DESCRIPTION="Library for encryption handling"
HOMEPAGE="https://invent.kde.org/"
SRC_URI="https://download.kde.org/stable/release-service/25.12.2/src/libkleo-25.12.2.tar.xz -> libkleo-25.12.2.tar.xz"
SLOT="6"
KEYWORDS="*"
RDEPEND="dev-cpp/gpgmepp:=
	dev-libs/qgpgme:=
	>=dev-libs/libgpg-error-1.36
	dev-qt/qtbase:6[gui]
	kde-frameworks/kcodecs:6
	kde-frameworks/kcolorscheme:6
	kde-frameworks/kcompletion:6
	kde-frameworks/kconfig:6
	kde-frameworks/kconfigwidgets:6
	kde-frameworks/kcoreaddons:6
	kde-frameworks/ki18n:6
	kde-frameworks/kitemmodels:6
	kde-frameworks/kwidgetsaddons:6
	kde-frameworks/kwindowsystem:6
	
"
DEPEND="${RDEPEND}
	dev-cpp/gpgmepp:=
	dev-libs/qgpgme:=
	>=dev-libs/libgpg-error-1.36
	dev-qt/qtbase:6[gui]
	kde-frameworks/kcodecs:6
	kde-frameworks/kcolorscheme:6
	kde-frameworks/kcompletion:6
	kde-frameworks/kconfig:6
	kde-frameworks/kconfigwidgets:6
	kde-frameworks/kcoreaddons:6
	kde-frameworks/ki18n:6
	kde-frameworks/kitemmodels:6
	kde-frameworks/kwidgetsaddons:6
	kde-frameworks/kwindowsystem:6
	
"
src_prepare() {
	  kde6_src_prepare
}


# vim: filetype=ebuild
