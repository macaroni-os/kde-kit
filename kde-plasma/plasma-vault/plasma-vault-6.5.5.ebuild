# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit kde6 xdg

DESCRIPTION="Plasma applet and services for creating encrypted vaults"
HOMEPAGE="https://invent.kde.org/plasma/"
SRC_URI="https://download.kde.org/stable/plasma/6.5.5/plasma-vault-6.5.5.tar.xz -> plasma-vault-6.5.5.tar.xz"
LICENSE="LGPL-3"
SLOT="6"
KEYWORDS="*"
IUSE="networkmanager"
RDEPEND="|| (
	    >=app-crypt/gocryptfs-1.8
	    >=sys-fs/cryfs-0.9.9
	    >=sys-fs/encfs-1.9.2
	)
	
"
DEPEND="${RDEPEND}
	dev-qt/qtbase:6[gui]
	dev-qt/qtdeclarative:6
	kde-frameworks/kcodecs:6
	kde-frameworks/kconfig:6
	kde-frameworks/kconfigwidgets:6
	kde-frameworks/kcoreaddons:6
	kde-frameworks/kdbusaddons:6
	kde-frameworks/ki18n:6
	kde-frameworks/kio:6
	kde-frameworks/kitemmodels:6
	kde-frameworks/kservice:6
	kde-frameworks/kwidgetsaddons:6
	kde-plasma/libksysguard:6
	kde-plasma/libplasma:6
	kde-plasma/plasma-activities:6
	networkmanager? ( kde-frameworks/networkmanager-qt:6 )
	
"
src_prepare() {
	  kde6_src_prepare
}

src_configure() {
	  # ODR violations (bug #909446, kde#471836)
	  filter-lto
	   local mycmakeargs=(
	      $(cmake_use_find_package networkmanager KF6NetworkManagerQt)
	  )
	   kde6_src_configure
}

pkg_postinst() {
	  xdg_pkg_postinst
	   local has_deprecated_backend
	  dropping_backend() {
	      if has_version ${2}; then
	          elog "${CATEGORY}/${PN} will drop support for ${1} in the future."
	          elog "Migrate away from any ${2} vaults before that happens."
	          elog
	          has_deprecated_backend=1
	      fi
	  }
	   dropping_backend CryFS sys-fs/cryfs
	  dropping_backend EncFS sys-fs/encfs
	   if [[ has_deprecated_backend ]]; then
	      elog "The only supported backend going forward will be app-crypt/gocryptfs."
	      elog
	      elog "See also:"
	      elog "https://invent.kde.org/plasma/plasma-vault/-/merge_requests/57"
	      elog "https://invent.kde.org/plasma/plasma-vault/-/merge_requests/62"
	  fi
}


# vim: filetype=ebuild
