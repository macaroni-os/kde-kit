# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit kde6

DESCRIPTION="Tools to generate documentation in various formats from DocBook files"
HOMEPAGE="https://invent.kde.org/frameworks/"
SRC_URI="https://download.kde.org/stable/frameworks/6.22/kdoctools-6.22.0.tar.xz -> kdoctools-6.22.0.tar.xz"
SLOT="6"
KEYWORDS="*"
IUSE="nls"
BDEPEND="dev-lang/perl
	dev-perl/URI
	nls? ( kde-frameworks/ki18n:6 )
	
"
RDEPEND="app-text/docbook-xml-dtd:4.5
	app-text/docbook-xsl-stylesheets
	app-text/sgml-common
	dev-libs/libxml2:2=
	dev-libs/libxslt
	kde-frameworks/karchive:6
	
"
DEPEND="${RDEPEND}
	
"
CMAKE_SKIP_TESTS=(
	  # bug 665622
	  kdoctools_install
)

src_prepare() {
	  kde6_src_prepare
}

src_configure() {
	  local mycmakeargs=(
	      $(cmake_use_find_package nls KF6I18n)
	  )
	   kde6_src_configure
}


# vim: filetype=ebuild
