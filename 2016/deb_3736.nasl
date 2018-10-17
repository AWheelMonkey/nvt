# OpenVAS Vulnerability Test
# $Id: deb_3736.nasl 8115 2017-12-14 07:30:22Z teissa $
# Auto-generated from advisory DSA 3736-1 using nvtgen 1.0
# Script version: 1.0
#
# Author:
# Greenbone Networks
#
# Copyright:
# Copyright (c) 2016 Greenbone Networks GmbH http://greenbone.net
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
    script_oid("1.3.6.1.4.1.25623.1.0.703736");
    script_version("$Revision: 8115 $");
    script_cve_id("CVE-2016-6255", "CVE-2016-8863");
    script_name("Debian Security Advisory DSA 3736-1 (libupnp - security update)");
    script_tag(name: "last_modification", value: "$Date: 2017-12-14 08:30:22 +0100 (Thu, 14 Dec 2017) $");
    script_tag(name: "creation_date", value: "2016-12-16 00:00:00 +0100 (Fri, 16 Dec 2016)");
    script_tag(name:"cvss_base", value:"7.5");
    script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
    script_tag(name: "solution_type", value: "VendorFix");
    script_tag(name: "qod_type", value: "package");

    script_xref(name: "URL", value: "http://www.debian.org/security/2016/dsa-3736.html");

    script_category(ACT_GATHER_INFO);

    script_copyright("Copyright (c) 2016 Greenbone Networks GmbH http://greenbone.net");
    script_family("Debian Local Security Checks");
    script_dependencies("gather-package-list.nasl");
    script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages");
    script_tag(name: "affected",  value: "libupnp on Debian Linux");
    script_tag(name: "insight",   value: "The Portable SDK for UPnP Devices
(libupnp) provides developers with an API and open source code for building
control points, devices, and bridges that are compliant with Version 1.0 of
the Universal Plug and Play Device Architecture Specification");
    script_tag(name: "solution",  value: "For the stable distribution (jessie),
these problems have been fixed in version 1:1.6.19+git20141001-1+deb8u1.

For the testing (stretch) and unstable (sid) distributions, these
problems have been fixed in version 1:1.6.19+git20160116-1.2.

We recommend that you upgrade your libupnp packages.");
    script_tag(name: "summary",   value: "Two vulnerabilities were discovered
in libupnp, a portable SDK for UPnP devices.

CVE-2016-6255 
Matthew Garret discovered that libupnp by default allows any user to
write to the filesystem of the host running a libupnp-based server
application.

CVE-2016-8863 
Scott Tenaglia discovered a heap buffer overflow vulnerability, that
can lead to denial of service or remote code execution.");
    script_tag(name: "vuldetect", value: "This check tests the installed software
version using the apt package manager.");
    exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"libupnp-dev", ver:"1:1.6.19+git20141001-1+deb8u1", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libupnp6", ver:"1:1.6.19+git20141001-1+deb8u1", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libupnp6-dbg", ver:"1:1.6.19+git20141001-1+deb8u1", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libupnp6-dev", ver:"1:1.6.19+git20141001-1+deb8u1", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libupnp6-doc", ver:"1:1.6.19+git20141001-1+deb8u1", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libupnp-dev", ver:"1:1.6.19+git20160116-1.2", rls_regex:"DEB9.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libupnp6", ver:"1:1.6.19+git20160116-1.2", rls_regex:"DEB9.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libupnp6-dbg", ver:"1:1.6.19+git20160116-1.2", rls_regex:"DEB9.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libupnp6-dev", ver:"1:1.6.19+git20160116-1.2", rls_regex:"DEB9.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libupnp6-doc", ver:"1:1.6.19+git20160116-1.2", rls_regex:"DEB9.[0-9]+")) != NULL) {
    report += res;
}

if (report != "") {
    security_message(data:report);
} else if (__pkg_match) {
    exit(99); # Not vulnerable.
}
