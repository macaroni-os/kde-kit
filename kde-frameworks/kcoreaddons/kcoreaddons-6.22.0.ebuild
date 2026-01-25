# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit kde6 xdg

DESCRIPTION="Framework for solving common problems such as caching, randomisation, and more"
HOMEPAGE="https://invent.kde.org/frameworks/"
SRC_URI="https://download.kde.org/stable/frameworks/6.22/kcoreaddons-6.22.0.tar.xz -> kcoreaddons-6.22.0.tar.xz"
SLOT="6"
KEYWORDS="*"
IUSE="dbus"
RDEPEND="dev-qt/qttranslations:6
	dev-qt/qtbase:6
	dev-qt/qtdeclarative:6
	dev-qt/qttools:6[linguist]
	virtual/libudev:=
	
"
DEPEND="${RDEPEND}
	sys-kernel/linux-headers
	
"
src_prepare() {
	  kde6_src_prepare
}

src_configure() {
	  local mycmakeargs=(
	      -DKCOREADDONS_USE_QML=ON
	      -DENABLE_INOTIFY=ON
	      -DUSE_DBUS=$(usex dbus)
	      -DBUILD_PYTHON_BINDINGS=OFF
	      -DCMAKE_DISABLE_FIND_PACKAGE_{Python3,PySide6,Shiboken6}=ON
	  )
	  kde6_src_configure
}

src_test() {
	  local CMAKE_SKIP_TESTS=(
	      # bug 632398
	      kautosavefiletest
	      # bug 647414
	      kdirwatch_qfswatch_unittest
	      kdirwatch_stat_unittest
	      # bugs 665682
	      kformattest
	      # bug 770781
	      kaboutdatatest
	      klistopenfilesjobtest_unix
	  )
	  # bug 619656
	  kde6_src_test -j1
}


# vim: filetype=ebuild
