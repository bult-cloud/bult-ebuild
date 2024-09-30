# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Nomad is a simple and flexible workload orchestrator to deploy and manage containers and non-containerized applications"
HOMEPAGE="https://www.nomadproject.io"
LICENSE="MPL-2.0"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

S=${WORKDIR}

SRC_URI="https://releases.hashicorp.com/nomad/${PV}/nomad_${PV}_linux_amd64.zip -> nomad.zip"

src_unpack() {
    unpack ${A}
}

src_install() {
    dobin "${WORKDIR}/nomad"
}

src_test() {
    if ! "${D}/usr/bin/nomad" version; then
        eerror "Version check failed"
        return 1
    fi
}

pkg_postinst() {
    einfo "Nomad installed successfully."
}