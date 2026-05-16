# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
PYTHON_COMPAT=( python3+ )
inherit cmake python-single-r1 xdg

DESCRIPTION="Distribution-independent installer framework "
HOMEPAGE="https://calamares.codeberg.page/"
SRC_URI="https://codeberg.org/Calamares/calamares/archive/v3.4.2.tar.gz -> calamares-3.4.2-36d30c4.tar.gz"
LICENSE="GPL-3"
SLOT="6"
KEYWORDS="*"
IUSE="+networkmanager +upower"
REQUIRED_USE="${PYTHON_REQUIRED_USE}"
# Commons depends
CDEPEND="dev-cpp/yaml-cpp
	dev-qt/qtbase:6[gui]
	dev-qt/qtnetworkauth:6
	dev-qt/qtdeclarative:6
	dev-qt/qtsvg:6
	kde-frameworks/kconfig:6
	kde-frameworks/kcoreaddons:6
	kde-frameworks/kcrash:6
	kde-frameworks/kpackage:6
	kde-frameworks/kparts:6
	sys-apps/dmidecode
	sys-libs/kpmcore:6=
	
"
BDEPEND="dev-qt/qttools:6[linguist]
	
"
RDEPEND="${CDEPEND}
	app-admin/sudo
	dev-libs/libatasmart
	net-misc/rsync
	sys-boot/grub:2
	sys-boot/os-prober
	sys-fs/squashfs-tools
	sys-libs/timezone-data
	virtual/udev
	networkmanager? ( net-misc/networkmanager )
	upower? ( sys-power/upower )
	
"
DEPEND="${CDEPEND}
"
S="${WORKDIR}/calamares"
src_prepare() {
	cmake_src_prepare
	export PYTHON_INCLUDE_DIRS="$(python_get_includedir)" \
	    PYTHON_INCLUDE_PATH="$(python_get_library_path)"\
	    PYTHON_CFLAGS="$(python_get_CFLAGS)"\
	    PYTHON_LIBS="$(python_get_LIBS)"
	 sed -i -e 's:pkexec /usr/bin/calamares:calamares-pkexec:' \
	  calamares.desktop || die
	sed -i -e 's:Icon=calamares:Icon=drive-harddisk:' \
	  calamares.desktop || die
}
src_configure() {
	# get the selected Python version from EPYTHON variable
	local python_version="${EPYTHON#python}"
	local boost_python_component="${python_version/./}"
	local mycmakeargs=(
	  -DINSTALL_CONFIG=ON
	  -DWEBVIEW_FORCE_WEBKIT=OFF
	  -DCMAKE_DISABLE_FIND_PACKAGE_LIBPARTED=ON
	  -DWITH_PYTHONQT=OFF
	  -DWITH_QT6=ON
	  # explicitly set Python version and paths
	  -DPYTHONLIBS_VERSION="${python_version}"
	  -DBOOSTPYTHON_COMPONENT="python${boost_python_component}"
	)
	cmake_src_configure
}
src_install() {
	cmake_src_install
	dobin "${FILESDIR}"/calamares-pkexec
}


# vim: filetype=ebuild
