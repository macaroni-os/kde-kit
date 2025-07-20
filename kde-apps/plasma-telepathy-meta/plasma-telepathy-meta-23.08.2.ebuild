# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Plasma Telepathy client"
HOMEPAGE="https://community.kde.org/KTp"

LICENSE="metapackage"
SLOT="5"
KEYWORDS="*"
IUSE=""

RDEPEND="
	>=kde-apps/ktp-accounts-kcm-23.04.3:${SLOT}
	>=kde-apps/ktp-approver-23.04.3:${SLOT}
	>=kde-apps/ktp-auth-handler-23.04.3:${SLOT}
	>=kde-apps/ktp-common-internals-23.04.3:${SLOT}
	>=kde-apps/ktp-contact-list-23.04.3:${SLOT}
	>=kde-apps/ktp-contact-runner-23.04.3:${SLOT}
	>=kde-apps/ktp-desktop-applets-23.04.3:${SLOT}
	>=kde-apps/ktp-filetransfer-handler-23.04.3:${SLOT}
	>=kde-apps/ktp-kded-module-23.04.3:${SLOT}
	>=kde-apps/ktp-send-file-23.04.3:${SLOT}
	>=kde-apps/ktp-text-ui-23.04.3:${SLOT}
"

pkg_postinst() {
	elog "You can configure the accounts in Plasma System Settings"
	elog "and then add the Instant Messaging plasma applet to access the contact list."
}
