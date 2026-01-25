# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit kde6

DESCRIPTION="Address book API based on KDE Frameworks"
HOMEPAGE="https://invent.kde.org/frameworks/"
SRC_URI="https://download.kde.org/stable/frameworks/6.22/kcontacts-6.22.0.tar.xz -> kcontacts-6.22.0.tar.xz"
SLOT="6"
KEYWORDS="*"
RDEPEND="dev-qt/qtbase:6[gui]
	dev-qt/qtdeclarative:6
	kde-frameworks/kcodecs:6
	kde-frameworks/kconfig:6
	kde-frameworks/kcoreaddons:6
	kde-frameworks/ki18n:6
	
"
DEPEND="${RDEPEND}
	
"
CMAKE_SKIP_TESTS=(
	  # bug #566648 (access to /dev/dri/card0 denied)
	  kcontacts-picturetest
	  # bugs #712798, 838502, 953969 (again some Qt translations loading related err...)
	  kcontacts-{address{,format},phonenumber}test
)


# vim: filetype=ebuild
