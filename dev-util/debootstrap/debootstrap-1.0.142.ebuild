# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

MY_PV="${PV/_p/+nmu}"

DESCRIPTION="Debian/Ubuntu bootstrap scripts"
HOMEPAGE="https://packages.qa.debian.org/d/debootstrap.html"
SRC_URI="https://salsa.debian.org/installer-team/${PN}/-/archive/${MY_PV}/${PN}-${MY_PV}.tar.bz2"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	app-arch/dpkg
	net-misc/wget
	sys-devel/binutils
"

S="${WORKDIR}/${PN}-${MY_PV}"

src_unpack() {
	unpack "${PN}-${MY_PV}".tar.bz2
}

src_compile() {
	:
}

src_install() {
	local DOCS=( TODO debian/changelog )
	default
	doman debootstrap.8
}

pkg_postinst() {
	if ! has_version ${CATEGORY}/${PN} && ! has_version app-crypt/gnupg; then
		elog "To check Release files against a keyring (--keyring=K), please"
		elog "install app-crypt/gnupg"
	fi
}
