# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Calico CNI plugins"
HOMEPAGE="https://github.com/projectcalico/calico"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

S=${WORKDIR}

SRC_URI="https://github.com/projectcalico/calico/releases/download/v${PV}/release-v${PV}.tgz"

src_unpack() {
    true
}

src_install() {
    dodir /usr/cni/bin
    insinto /usr/cni/bin
    tar -xzf "${DISTDIR}/release-v${PV}.tgz" -C "${D}/usr/cni/bin" --strip-components=4 \
        release-v${PV}/bin/cni/amd64/
}

pkg_postinst() {
    einfo "Calico CNI plugins installed successfully."
}