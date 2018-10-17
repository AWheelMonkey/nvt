# OpenVAS Vulnerability Test
# $Id: deb_3793.nasl 11610 2018-09-26 02:42:29Z ckuersteiner $
# Auto-generated from advisory DSA 3793-1 using nvtgen 1.0
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
    script_oid("1.3.6.1.4.1.25623.1.0.703793");
    script_version("$Revision: 11610 $");
    script_cve_id("CVE-2016-6252", "CVE-2017-2616");
    script_name("Debian Security Advisory DSA 3793-1 (shadow - security update)");
    script_tag(name: "last_modification", value: "$Date: 2018-09-26 04:42:29 +0200 (Wed, 26 Sep 2018) $");
    script_tag(name: "creation_date", value: "2017-02-24 00:00:00 +0100 (Fri, 24 Feb 2017)");
    script_tag(name:"cvss_base", value:"4.7");
    script_tag(name:"cvss_base_vector", value:"AV:L/AC:M/Au:N/C:N/I:N/A:C");
    script_tag(name: "solution_type", value: "VendorFix");
    script_tag(name: "qod_type", value: "package");

    script_xref(name: "URL", value: "http://www.debian.org/security/2017/dsa-3793.html");

    script_category(ACT_GATHER_INFO);

    script_copyright("Copyright (c) 2017 Greenbone Networks GmbH http://greenbone.net");
    script_family("Debian Local Security Checks");
    script_dependencies("gather-package-list.nasl");
    script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages");
    script_tag(name: "affected",  value: "shadow on Debian Linux");
    script_tag(name: "solution",  value: "For the stable distribution (jessie), these problems have been fixed in
version 1:4.2-3+deb8u3.

We recommend that you upgrade your shadow packages.");
    script_tag(name: "summary",   value: "Several vulnerabilities were discovered in the shadow suite. The Common
Vulnerabilities and Exposures project identifies the following problems:

CVE-2016-6252 
An integer overflow vulnerability was discovered, potentially
allowing a local user to escalate privileges via crafted input to
the newuidmap utility.

CVE-2017-2616 
Tobias Stoeckmann discovered that su does not properly handle
clearing a child PID. A local attacker can take advantage of this
flaw to send SIGKILL to other processes with root privileges,
resulting in denial of service.");
    script_tag(name: "vuldetect", value: "This check tests the installed software version using the apt package manager.");

    exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"login", ver:"1:4.2-3+deb8u3", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"passwd", ver:"1:4.2-3+deb8u3", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"uidmap", ver:"1:4.2-3+deb8u3", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}

if (report != "") {
    security_message(data:report);
} else if (__pkg_match) {
    exit(99); # Not vulnerable.
}
