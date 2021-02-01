# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit kde5

DESCRIPTION="kdegraphics - merge this to pull in all kdegraphics-derived packages"
HOMEPAGE="https://apps.kde.org/graphics"
SRC_URI=""

LICENSE="metapackage"
SLOT="5"
KEYWORDS="*"
IUSE="scanner"

RDEPEND="
	$(add_kdeapps_dep gwenview)
	$(add_kdeapps_dep kamera)
	$(add_kdeapps_dep kcolorchooser)
	$(add_kdeapps_dep kdegraphics-mobipocket)
	$(add_kdeapps_dep kipi-plugins)
	$(add_kdeapps_dep kolourpaint)
	$(add_kdeapps_dep kruler)
	$(add_kdeapps_dep libkdcraw)
	$(add_kdeapps_dep libkexiv2)
	$(add_kdeapps_dep libkipi)
	$(add_kdeapps_dep okular)
	$(add_kdeapps_dep spectacle)
	$(add_kdeapps_dep svgpart)
	$(add_kdeapps_dep thumbnailers)
	scanner? ( $(add_kdeapps_dep libksane) )
"
