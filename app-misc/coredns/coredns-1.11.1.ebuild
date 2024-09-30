# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="CoreDNS is a fast and flexible DNS server"
HOMEPAGE="https://coredns.io"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

S=${WORKDIR}

SRC_URI="https://github.com/coredns/coredns/releases/download/v${PV}/coredns_${PV}_linux_amd64.tgz -> coredns.tgz"

src_unpack() {
    unpack ${A}
}

src_install() {
    dobin "${WORKDIR}/coredns"
}

src_test() {
    if ! "${D}/usr/bin/coredns" -version; then
        eerror "Version check failed"
        return 1
    fi
}

pkg_postinst() {
    einfo "CoreDNS installed successfully."
}