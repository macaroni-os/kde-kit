# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit kde5

DESCRIPTION="kdeutils - merge this to pull in all kdeutils-derived packages"
HOMEPAGE="https://apps.kde.org/utilities https://utils.kde.org"
SRC_URI=""

LICENSE="metapackage"
SLOT="5"
KEYWORDS="*"
IUSE="7zip cups floppy gpg lrz rar +webengine"

RDEPEND="
	>=app-cdr/dolphin-plugins-mountiso-${PV}:${SLOT}
	$(add_kdeapps_dep ark)
	$(add_kdeapps_dep filelight)
	$(add_kdeapps_dep kate)
	$(add_kdeapps_dep kbackup)
	$(add_kdeapps_dep kcalc)
	$(add_kdeapps_dep kcharselect)
	$(add_kdeapps_dep kdebugsettings)
	$(add_kdeapps_dep kdf)
	$(add_kdeapps_dep kteatime)
	$(add_kdeapps_dep ktimer)
	$(add_kdeapps_dep kwalletmanager)
	$(add_kdeapps_dep sweeper)
	$(add_kdeapps_dep yakuake)
	>=kde-misc/markdownpart-${PV}:${SLOT}
	>=sys-block/partitionmanager-${PV}:${SLOT}
	>=sys-libs/kpmcore-${PV}:${SLOT}
	cups? ( $(add_kdeapps_dep print-manager) )
	floppy? ( $(add_kdeapps_dep kfloppy) )
	gpg? ( $(add_kdeapps_dep kgpg) )
	webengine? ( $(add_kdeapps_dep kimagemapeditor) )
"
# Optional runtime deps: kde-apps/ark
RDEPEND="${RDEPEND}
	7zip? ( app-arch/p7zip )
	lrz? ( app-arch/lrzip )
	rar? ( || (
		app-arch/rar
		app-arch/unrar
		app-arch/unar
	) )
"
