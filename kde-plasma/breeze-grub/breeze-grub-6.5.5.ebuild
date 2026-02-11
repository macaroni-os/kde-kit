# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit cmake

DESCRIPTION="Breeze theme for GRUB"
HOMEPAGE="https://invent.kde.org/plasma/"
SRC_URI="https://download.kde.org/stable/plasma/6.5.5/breeze-grub-6.5.5.tar.xz -> breeze-grub-6.5.5.tar.xz"
SLOT="6"
KEYWORDS="*"
DEPEND="${RDEPEND}
"
src_prepare() { default; }
src_configure() { :; }
src_compile() { :; }
src_install() {
	insinto /usr/share/grub/themes
	doins -r breeze
}


# vim: filetype=ebuild
