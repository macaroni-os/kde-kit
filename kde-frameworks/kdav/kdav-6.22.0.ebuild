# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit kde6

DESCRIPTION="DAV protocol implemention with KJobs"
HOMEPAGE="https://invent.kde.org/frameworks/"
SRC_URI="https://download.kde.org/stable/frameworks/6.22/kdav-6.22.0.tar.xz -> kdav-6.22.0.tar.xz"
SLOT="6"
KEYWORDS="*"
RDEPEND="dev-qt/qtbase:6[gui]
	kde-frameworks/kcoreaddons:6
	kde-frameworks/ki18n:6
	kde-frameworks/kio:6
	
"
DEPEND="${RDEPEND}
	
"
CMAKE_SKIP_TESTS=(
	  # bug 616808: requires D-Bus
	  kdav-davitemfetchjob
	  # bug 653602: mimetypes unsupported
	  kdav-davitemslistjob
	  # bug 765061
	  kdav-davcollectionsmultifetchjobtest
)


# vim: filetype=ebuild
