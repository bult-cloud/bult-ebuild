# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Calico Open Source has grown to be the most widely adopted solution for container networking and security"
HOMEPAGE="https://github.com/projectcalico/calico"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

S=${WORKDIR}

DEPEND="net-libs/libpcap"

SRC_URI="http://10.10.255.254:8080/assets/calico-node -> calico-node"

src_unpack() {
    true
}

src_install() {
    dobin "${DISTDIR}/calico-node"
}

src_test() {
    if ! "${D}/usr/bin/calico-node" -v; then
        eerror "Version check failed"
        return 1
    fi
}

pkg_postinst() {
    einfo "calico-node installed successfully."
}
