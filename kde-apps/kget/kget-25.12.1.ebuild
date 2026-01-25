# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit kde6 xdg

DESCRIPTION="Advanced download manager by KDE"
HOMEPAGE="https://apps.kde.org/kget/"
SRC_URI="https://download.kde.org/stable/release-service/25.12.1/src/kget-25.12.1.tar.xz -> kget-25.12.1.tar.xz"
SLOT="6"
KEYWORDS="*"
IUSE="bittorrent gpg mms sqlite"
RDEPEND="dev-qt/qtbase:6[gui,sql]
	kde-frameworks/kcmutils:6
	kde-frameworks/kcompletion:6
	kde-frameworks/kconfig:6
	kde-frameworks/kconfigwidgets:6
	kde-frameworks/kcoreaddons:6
	kde-frameworks/kcrash:6
	kde-frameworks/kdbusaddons:6
	kde-frameworks/ki18n:6
	kde-frameworks/kiconthemes:6
	kde-frameworks/kio:6
	kde-frameworks/kitemviews:6
	kde-frameworks/knotifications:6
	kde-frameworks/knotifyconfig:6
	kde-frameworks/kstatusnotifieritem:6
	kde-frameworks/kwallet:6
	kde-frameworks/kwidgetsaddons:6
	kde-frameworks/kwindowsystem:6
	kde-frameworks/kxmlgui:6
	bittorrent? ( net-libs/libktorrent:6 )
	gpg? (
	dev-cpp/gpgmepp:=
	dev-libs/qgpgme:=
	)
	mms? ( media-libs/libmms )
	sqlite? ( dev-db/sqlite:3 )
	
"
DEPEND="${RDEPEND}
	dev-qt/qtbase:6[gui,sql]
	kde-frameworks/kcmutils:6
	kde-frameworks/kcompletion:6
	kde-frameworks/kconfig:6
	kde-frameworks/kconfigwidgets:6
	kde-frameworks/kcoreaddons:6
	kde-frameworks/kcrash:6
	kde-frameworks/kdbusaddons:6
	kde-frameworks/ki18n:6
	kde-frameworks/kiconthemes:6
	kde-frameworks/kio:6
	kde-frameworks/kitemviews:6
	kde-frameworks/knotifications:6
	kde-frameworks/knotifyconfig:6
	kde-frameworks/kstatusnotifieritem:6
	kde-frameworks/kwallet:6
	kde-frameworks/kwidgetsaddons:6
	kde-frameworks/kwindowsystem:6
	kde-frameworks/kxmlgui:6
	bittorrent? ( net-libs/libktorrent:6 )
	gpg? (
	dev-cpp/gpgmepp:=
	dev-libs/qgpgme:=
	)
	mms? ( media-libs/libmms )
	sqlite? ( dev-db/sqlite:3 )
	
"
src_prepare() {
	  kde6_src_prepare
}


# vim: filetype=ebuild
