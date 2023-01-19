# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit kde5

DESCRIPTION="Plasma 5 applet for weather forecasts"
HOMEPAGE="https://store.kde.org/content/show.php/Weather+Widget?content=169572
https://github.com/kotelnik/plasma-applet-weather-widget"
SRC_URI="https://github.com/kotelnik/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2+"
SLOT="5"
KEYWORDS="*"
IUSE=""

DEPEND="
	$(add_qt_dep qtxmlpatterns 'qml(+)')
	$(add_frameworks_dep plasma)
"
RDEPEND="${DEPEND}"

DOCS=( README.md )
