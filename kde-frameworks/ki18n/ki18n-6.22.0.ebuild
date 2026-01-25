# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
PYTHON_COMPAT=( python3+ )
inherit kde6 python-single-r1

DESCRIPTION="Framework based on Gettext for internationalizing user interface text"
HOMEPAGE="https://invent.kde.org/frameworks/"
SRC_URI="https://download.kde.org/stable/frameworks/6.22/ki18n-6.22.0.tar.xz -> ki18n-6.22.0.tar.xz"
SLOT="6"
KEYWORDS="*"
REQUIRED_USE="${PYTHON_REQUIRED_USE}"
RDEPEND="app-text/iso-codes
	
"
DEPEND="${RDEPEND}
	${PYTHON_DEPS}
	dev-qt/qtbase:6
	dev-qt/qtdeclarative:6
	sys-devel/gettext
	virtual/libintl
	test? ( dev-qt/qtbase:6 )
	
"
CMAKE_SKIP_TESTS=(
	  # bug 876496
	  kcatalogtest
	  # requires LANG fr_CH. bugs 823816
	  kcountrytest
	  kcountrysubdivisiontest
	  # flaky, bug 948895
	  ki18n-klocalizedstringtest
)

src_prepare() {
	  kde6_src_prepare
}

src_configure() {
	  local mycmakeargs=(
	      -DPython3_EXECUTABLE="${PYTHON}"
	      -DBUILD_WITH_QML=TRUE
	  )
	  kde6_src_configure
}


# vim: filetype=ebuild
