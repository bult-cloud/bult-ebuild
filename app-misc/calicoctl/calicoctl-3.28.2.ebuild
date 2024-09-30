# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Command line tool to manage Calico resource"
HOMEPAGE="https://github.com/projectcalico/calico"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

S=${WORKDIR}

SRC_URI="https://github.com/projectcalico/calico/releases/download/v${PV}/calicoctl-linux-amd64 -> calicoctl"

src_unpack() {
    true
}

src_install() {
    dobin "${DISTDIR}/calicoctl"
}

src_test() {
    if ! "${D}/usr/bin/calicoctl" version; then
        eerror "Version check failed"
        return 1
    fi
}

pkg_postinst() {
    einfo "calicoctl installed successfully."
}