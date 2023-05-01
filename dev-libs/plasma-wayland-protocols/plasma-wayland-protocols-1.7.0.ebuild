# Distributed under the terms of the GNU General Public License v2

EAPI=7

KDE_AUTODEPS=false
FRAMEWORKS_MINIMAL=5.98.0
inherit kde5

DESCRIPTION="Plasma Specific Protocols for Wayland"
HOMEPAGE="https://invent.kde.org/libraries/plasma-wayland-protocols"
SRC_URI="https://download.kde.org/stable/plasma-wayland-protocols/plasma-wayland-protocols-1.7.0.tar.xz -> plasma-wayland-protocols-1.7.0.tar.xz"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="*"

S="${WORKDIR}/plasma-wayland-protocols-1.7.0"

BDEPEND="$(add_frameworks_dep extra-cmake-modules)"
RDEPEND=">=kde-frameworks/kf-env-4"
DEPEND="$(add_qt_dep qtcore)"

