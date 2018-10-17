# OpenVAS Vulnerability Test
# $Id: deb_3484.nasl 8115 2017-12-14 07:30:22Z teissa $
# Auto-generated from advisory DSA 3484-1 using nvtgen 1.0
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
    script_oid("1.3.6.1.4.1.25623.1.0.703484");
    script_version("$Revision: 8115 $");
    script_cve_id("CVE-2014-9765");
    script_name("Debian Security Advisory DSA 3484-1 (xdelta3 - security update)");
    script_tag(name: "last_modification", value: "$Date: 2017-12-14 08:30:22 +0100 (Thu, 14 Dec 2017) $");
    script_tag(name: "creation_date", value: "2016-02-19 00:00:00 +0100 (Fri, 19 Feb 2016)");
    script_tag(name:"cvss_base", value:"6.8");
    script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
    script_tag(name: "solution_type", value: "VendorFix");
    script_tag(name: "qod_type", value: "package");

    script_xref(name: "URL", value: "http://www.debian.org/security/2016/dsa-3484.html");


    script_category(ACT_GATHER_INFO);

    script_copyright("Copyright (c) 2016 Greenbone Networks GmbH http://greenbone.net");
    script_family("Debian Local Security Checks");
    script_dependencies("gather-package-list.nasl");
    script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages");
    script_tag(name: "affected",  value: "xdelta3 on Debian Linux");
    script_tag(name: "insight",   value: "Xdelta3 is a set of tools designed
to compute changes between binary files. These changes (delta files) are similar
to the output of the 'diff' program, in that they may be used to store and transmit
only the changes between files. The 'delta files' that Xdelta3 manages are
stored in RFC3284 (VCDIFF) format.");
    script_tag(name: "solution",  value: "For the oldstable distribution (wheezy),
this problem has been fixed in version 3.0.0.dfsg-1+deb7u1.

For the stable distribution (jessie), this problem has been fixed in
version 3.0.8-dfsg-1+deb8u1.

For the testing distribution (stretch), this problem has been fixed
in version 3.0.8-dfsg-1.1.

For the unstable distribution (sid), this problem has been fixed in
version 3.0.8-dfsg-1.1.

We recommend that you upgrade your xdelta3 packages.");
    script_tag(name: "summary",   value: "Stepan Golosunov discovered that
xdelta3, a diff utility which works with binary files, is affected by a buffer
overflow vulnerability within the main_get_appheader function, which may lead
to the execution of arbitrary code.");
    script_tag(name: "vuldetect", value: "This check tests the installed software
version using the apt package manager.");
    exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"xdelta3", ver:"3.0.8-dfsg-1.1", rls_regex:"DEB9.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"python-xdelta3", ver:"3.0.0.dfsg-1+deb7u1", rls_regex:"DEB7.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"xdelta3", ver:"3.0.0.dfsg-1+deb7u1", rls_regex:"DEB7.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"xdelta3", ver:"3.0.8-dfsg-1+deb8u1", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}

if (report != "") {
    security_message(data:report);
} else if (__pkg_match) {
    exit(99); # Not vulnerable.
}
