# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit cmake

DESCRIPTION="Framework for searching and managing metadata"
HOMEPAGE="https://invent.kde.org/frameworks/"
SRC_URI="https://download.kde.org/stable/frameworks/6.22/baloo-6.22.0.tar.xz -> baloo-6.22.0.tar.xz"
LICENSE="GPL-2"
SLOT="6"
KEYWORDS="*"
RDEPEND="virtual/kde-seed[declarative]
	>=dev-db/lmdb-0.9.17
	kde-frameworks/kconfig:6
	kde-frameworks/kcoreaddons:6
	kde-frameworks/kcrash:6
	kde-frameworks/kdbusaddons:6
	kde-frameworks/kfilemetadata:6
	kde-frameworks/ki18n:6
	kde-frameworks/kidletime:6
	kde-frameworks/kio:6
	kde-frameworks/solid:6
	
"
DEPEND="${RDEPEND}
"

# vim: filetype=ebuild
