# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit cmake

DESCRIPTION="Ocean Sound Theme for Plasma"
HOMEPAGE="https://invent.kde.org/plasma/"
SRC_URI="https://download.kde.org/stable/plasma/6.5.5/ocean-sound-theme-6.5.5.tar.xz -> ocean-sound-theme-6.5.5.tar.xz"
SLOT="6"
KEYWORDS="*"
DEPEND="${RDEPEND}
"
src_prepare() { default; }
src_configure() { :; }
src_compile() { :; }
src_install() {
	insinto /usr/share/sounds
	doins -r ocean
}


# vim: filetype=ebuild
