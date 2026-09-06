# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit cmake

DESCRIPTION="Library to expose vcards to KPeople"
HOMEPAGE="https://invent.kde.org/pim/kpeoplevcard"
SRC_URI="https://invent.kde.org/pim/kpeoplevcard/-/archive/d4acaa3038f6b030d0d6390e628c39e9f8d87903/kpeoplevcard-d4acaa3038f6b030d0d6390e628c39e9f8d87903.tar.gz -> kpeoplevcard-0.2_p20241202.tar.gz"
LICENSE="LGPL-2.1+ BSD"
SLOT="6"
KEYWORDS="*"
RDEPEND="virtual/kde-seed[gui]
	kde-frameworks/kcontacts:6
	kde-frameworks/kcoreaddons:6
	kde-frameworks/ki18n:6
	kde-frameworks/kpeople:6
	
"
DEPEND="${RDEPEND}
"
S="${WORKDIR}/kpeoplevcard-d4acaa3038f6b030d0d6390e628c39e9f8d87903"
src_configure() {
	local mycmakeargs=(
		-DQT_MAJOR_VERSION=6
		-DBUILD_TESTING=OFF
	)
	cmake_src_configure
}

src_install() {
	cmake_src_install

	# kpeople ships this same plugin, so depend and rm
	local plugin="${ED}/usr/$(get_libdir)/qt6/plugins/kpeople/datasource/KPeopleVCard.so"

	[[ -f ${plugin} ]] || die "expected plugin at ${plugin} - upstream layout changed"
	rm "${plugin}" || die "failed to remove ${plugin}"
	rmdir "${plugin%/*}" || die "failed to remove empty ${plugin%/*}"
}


# vim: filetype=ebuild
