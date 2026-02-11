# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit kde6 cmake-utils qmake-utils

DESCRIPTION="Qt Cryptographic Architecture (QCA)"
HOMEPAGE="https://userbase.kde.org/QCA"
SRC_URI="https://download.kde.org/stable/qca/2.3.10/qca-2.3.10.tar.xz -> qca-2.3.10.tar.xz"
LICENSE="LGPL-2.1"
SLOT="2"
KEYWORDS="*"
IUSE="botan debug doc examples gcrypt gpg logger nss pkcs11 +qt6 sasl softstore +ssl"
BDEPEND="virtual/pkgconfig
	doc? (
	  app-doc/doxygen[dot]
	  virtual/latex-base
	)
	
"
RDEPEND="qt6? (
	  dev-qt/qt5compat:6
	  dev-qt/qtbase:6
	)
	!qt6? (
	  dev-qt/qtcore:5
	  dev-qt/qtconcurrent:5
	)
	botan? ( dev-libs/botan:3= )
	gcrypt? ( dev-libs/libgcrypt:= )
	gpg? ( app-crypt/gnupg )
	nss? ( dev-libs/nss )
	pkcs11? (
	>=dev-libs/openssl-1.1
	dev-libs/pkcs11-helper
	)
	sasl? ( dev-libs/cyrus-sasl:2 )
	ssl? ( >=dev-libs/openssl-1.1:= )
	
"
DEPEND="${RDEPEND}
	
"
qca_plugin_use() {
	echo -DWITH_${2:-$1}_PLUGIN=$(usex "$1")
}
src_configure() {
	# Use emake instead of Ninja to avoid depslog issues
	export CMAKE_MAKEFILE_GENERATOR="emake"
	 local mycmakeargs=(
	  -DBUILD_WITH_QT6=$(usex qt6)
	  $(qca_plugin_use botan)
	  $(qca_plugin_use gcrypt)
	  $(qca_plugin_use gpg gnupg)
	  $(qca_plugin_use logger)
	  $(qca_plugin_use nss)
	  $(qca_plugin_use pkcs11)
	  $(qca_plugin_use sasl cyrus-sasl)
	  $(qca_plugin_use softstore)
	  $(qca_plugin_use ssl ossl)
	  -DBUILD_TESTS=OFF
	)
	 if use qt6; then
	  mycmakeargs+=(
	    -DQCA_FEATURE_INSTALL_DIR="${EPREFIX}/usr/lib64/qt6/mkspecs/features"
	    -DQCA_PLUGINS_INSTALL_DIR="${EPREFIX}/usr/lib64/qt6/plugins"
	  )
	else
	  mycmakeargs+=(
	    -DQCA_FEATURE_INSTALL_DIR="${EPREFIX}/usr/lib64/qt5/mkspecs/features"
	    -DQCA_PLUGINS_INSTALL_DIR="${EPREFIX}/usr/lib64/qt5/plugins"
	  )
	fi
	 cmake-utils_src_configure
}
src_compile() {
	cmake-utils_src_compile
	use doc && cmake_src_make doc
}
src_install() {
	cmake-utils_src_install
	 if use doc; then
	pushd "${BUILD_DIR}" > /dev/null || die
	dodoc -r apidocs/html
	popd > /dev/null || die
	fi
	 if use examples; then
	dodoc -r "${S}"/examples
	fi
}


# vim: filetype=ebuild
