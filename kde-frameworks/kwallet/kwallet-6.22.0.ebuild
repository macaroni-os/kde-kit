# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit kde6

DESCRIPTION="Interface to KWallet Framework providing desktop-wide storage for passwords"
HOMEPAGE="https://invent.kde.org/frameworks/"
SRC_URI="https://download.kde.org/stable/frameworks/6.22/kwallet-6.22.0.tar.xz -> kwallet-6.22.0.tar.xz"
SLOT="6"
KEYWORDS="*"
IUSE="gpg +man runtime X"
BDEPEND="man? ( kde-frameworks/kdoctools:6 )
	
"
DEPEND=">=app-crypt/qca-2.3.9:2[qt6(+)]
	dev-libs/libgcrypt:0=
	dev-qt/qtbase:6[gui]
	kde-frameworks/kcolorscheme:6
	kde-frameworks/kconfig:6
	kde-frameworks/kcoreaddons:6
	kde-frameworks/kcrash:6
	kde-frameworks/kdbusaddons:6
	kde-frameworks/ki18n:6
	kde-frameworks/knotifications:6
	kde-frameworks/kservice:6
	kde-frameworks/kwidgetsaddons:6
	kde-frameworks/kwindowsystem:6[X?]
	gpg? ( app-crypt/gpgme:= )
	runtime? ( app-crypt/libsecret )
	
"
src_prepare() {
	  kde6_src_prepare
}

src_configure() {
	  local mycmakeargs=(
	      -DBUILD_KSECRETD=$(usex runtime)
	      -DBUILD_KWALLETD=$(usex runtime)
	      -DBUILD_KWALLET_QUERY=$(usex runtime)
	  )
	  kde6_src_configure
}


# vim: filetype=ebuild
