# OpenVAS Vulnerability Test
# $Id: deb_3702.nasl 8115 2017-12-14 07:30:22Z teissa $
# Auto-generated from advisory DSA 3702-1 using nvtgen 1.0
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
    script_oid("1.3.6.1.4.1.25623.1.0.703702");
    script_version("$Revision: 8115 $");
    script_cve_id("CVE-2016-6321");
    script_name("Debian Security Advisory DSA 3702-1 (tar - security update)");
    script_tag(name: "last_modification", value: "$Date: 2017-12-14 08:30:22 +0100 (Thu, 14 Dec 2017) $");
    script_tag(name:"creation_date", value:"2016-11-08 15:52:38 +0530 (Tue, 08 Nov 2016)");
    script_tag(name:"cvss_base", value:"5.0");
    script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:P/A:N");
    script_tag(name: "solution_type", value: "VendorFix");
    script_tag(name: "qod_type", value: "package");

    script_xref(name: "URL", value: "http://www.debian.org/security/2016/dsa-3702.html");


    script_category(ACT_GATHER_INFO);

    script_copyright("Copyright (c) 2016 Greenbone Networks GmbH http://greenbone.net");
    script_family("Debian Local Security Checks");
    script_dependencies("gather-package-list.nasl");
    script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages");
    script_tag(name: "affected",  value: "tar on Debian Linux");
    script_tag(name: "insight",   value: "Tar is a program for packaging a set
of files as a single archive in tar format. The function it performs is
conceptually similar to cpio, and to things like PKZIP in the DOS world. It is
heavily used by the Debian package management system, and is useful for performing
system backups and exchanging sets of files with others.");
    script_tag(name: "solution",  value: "For the stable distribution (jessie),
this problem has been fixed in version 1.27.1-2+deb8u1.

For the unstable distribution (sid), this problem has been fixed in
version 1.29b-1.1.

We recommend that you upgrade your tar packages.");
    script_tag(name: "summary",   value: "Harry Sintonen discovered that GNU tar
does not properly handle member names containing '..', thus allowing an attacker
to bypass the path names specified on the command line and replace files and
directories in the target directory.");
    script_tag(name: "vuldetect", value: "This check tests the installed software
version using the apt package manager.");
    exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"tar", ver:"1.27.1-2+deb8u1", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"tar-scripts", ver:"1.27.1-2+deb8u1", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}

if (report != "") {
    security_message(data:report);
} else if (__pkg_match) {
    exit(99); # Not vulnerable.
}
