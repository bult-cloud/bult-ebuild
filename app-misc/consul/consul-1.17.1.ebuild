# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Consul is a distributed, highly available, and data center aware solution to connect and configure applications across dynamic, distributed infrastructure"
HOMEPAGE="https://www.consul.io"
LICENSE="MPL-2.0"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

S=${WORKDIR}

SRC_URI="https://releases.hashicorp.com/consul/${PV}/consul_${PV}_linux_amd64.zip -> consul.zip"

src_unpack() {
    unpack ${A}
}

src_install() {
    dobin "${WORKDIR}/consul"
}

src_test() {
    if ! "${D}/usr/bin/consul" version; then
        eerror "Version check failed"
        return 1
    fi
}

pkg_postinst() {
    einfo "Consul installed successfully."
}