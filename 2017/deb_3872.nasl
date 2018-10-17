# OpenVAS Vulnerability Test
# $Id: deb_3872.nasl 10909 2018-08-10 15:03:01Z cfischer $
# Auto-generated from advisory DSA 3872-1 using nvtgen 1.0
# Script version: 1.0
#
# Author:
# Greenbone Networks
#
# Copyright:
# Copyright (c) 2017 Greenbone Networks GmbH http://greenbone.net
# Text descriptions are largely excerpted from the referenced
# advisory, and are Copyright (c) the respective author(s)
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
#


if(description)
{
    script_oid("1.3.6.1.4.1.25623.1.0.703872");
    script_version("$Revision: 10909 $");
    script_cve_id("CVE-2017-5461", "CVE-2017-5462", "CVE-2017-7502");
    script_name("Debian Security Advisory DSA 3872-1 (nss - security update)");
    script_tag(name: "last_modification", value: "$Date: 2018-08-10 17:03:01 +0200 (Fri, 10 Aug 2018) $");
    script_tag(name: "creation_date", value: "2017-06-01 00:00:00 +0200 (Thu, 01 Jun 2017)");
    script_tag(name:"cvss_base", value:"7.5");
    script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
    script_tag(name: "solution_type", value: "VendorFix");
    script_tag(name: "qod_type", value: "package");

    script_xref(name: "URL", value: "http://www.debian.org/security/2017/dsa-3872.html");

    script_category(ACT_GATHER_INFO);

    script_copyright("Copyright (c) 2017 Greenbone Networks GmbH http://greenbone.net");
    script_family("Debian Local Security Checks");
    script_dependencies("gather-package-list.nasl");
    script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages");
    script_tag(name: "affected",  value: "nss on Debian Linux");
        script_tag(name: "insight",   value: "nss is a set of libraries designed to support cross-platform development
of security-enabled client and server applications.");
    script_tag(name: "solution",  value: "For the stable distribution (jessie), these problems have been fixed in
version 2:3.26-1+debu8u2.

For the unstable distribution (sid), these problems will be fixed soon.

We recommend that you upgrade your nss packages.");
    script_tag(name: "summary",   value: "Several vulnerabilities were discovered in NSS, a set of cryptographic
libraries, which may result in denial of service or information
disclosure.");
    script_tag(name: "vuldetect", value: "This check tests the installed software version using the apt package manager.");

    exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"libnss3", ver:"2:3.26-1+debu8u2", rls_regex:"DEB8.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libnss3-1d", ver:"2:3.26-1+debu8u2", rls_regex:"DEB8.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libnss3-dbg", ver:"2:3.26-1+debu8u2", rls_regex:"DEB8.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libnss3-dev", ver:"2:3.26-1+debu8u2", rls_regex:"DEB8.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libnss3-tools", ver:"2:3.26-1+debu8u2", rls_regex:"DEB8.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}

if (report != "") {
    security_message(data:report);
} else if (__pkg_match) {
    exit(99); # Not vulnerable.
}
