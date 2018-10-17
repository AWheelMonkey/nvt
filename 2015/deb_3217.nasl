# OpenVAS Vulnerability Test
# $Id: deb_3217.nasl 9355 2018-04-06 07:16:07Z cfischer $
# Auto-generated from advisory DSA 3217-1 using nvtgen 1.0
# Script version: 1.0
#
# Author:
# Greenbone Networks
#
# Copyright:
# Copyright (c) 2015 Greenbone Networks GmbH http://greenbone.net
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
    script_oid("1.3.6.1.4.1.25623.1.0.703217");
    script_version("$Revision: 9355 $");
    script_cve_id("CVE-2015-0840");
    script_name("Debian Security Advisory DSA 3217-1 (dpkg - security update)");
    script_tag(name: "last_modification", value: "$Date: 2018-04-06 09:16:07 +0200 (Fri, 06 Apr 2018) $");
    script_tag(name: "creation_date", value: "2015-04-09 00:00:00 +0200 (Thu, 09 Apr 2015)");
    script_tag(name:"cvss_base", value:"4.3");
    script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:P/A:N");
    script_tag(name: "solution_type", value: "VendorFix");
    script_tag(name: "qod_type", value: "package");

    script_xref(name: "URL", value: "http://www.debian.org/security/2015/dsa-3217.html");


    script_category(ACT_GATHER_INFO);

    script_copyright("Copyright (c) 2015 Greenbone Networks GmbH http://greenbone.net");
    script_family("Debian Local Security Checks");
    script_dependencies("gather-package-list.nasl");
    script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages");
    script_tag(name: "affected",  value: "dpkg on Debian Linux");
    script_tag(name: "insight",   value: "This package provides the low-level
infrastructure for handling the installation and removal of Debian software
packages.");
    script_tag(name: "solution",  value: "For the stable distribution (wheezy),
this problem has been fixed in version 1.16.16. This update also includes
non-security changes previously scheduled for the next wheezy point release.
See the Debian changelog for details.

For the unstable distribution (sid), this problem has been fixed in
version 1.17.25.

We recommend that you upgrade your dpkg packages.");
    script_tag(name: "summary",   value: "Jann Horn discovered that the source
package integrity verification in dpkg-source can be bypassed via a specially
crafted Debian source control file (.dsc). Note that this flaw only affects
extraction of local Debian source packages via dpkg-source but not the installation
of packages from the Debian archive.");
    script_tag(name: "vuldetect", value: "This check tests the installed software
version using the apt package manager.");
    exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"dpkg", ver:"1.16.16", rls_regex:"DEB7.[0-9]")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"dpkg-dev", ver:"1.16.16", rls_regex:"DEB7.[0-9]")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"dselect", ver:"1.16.16", rls_regex:"DEB7.[0-9]")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libdpkg-dev", ver:"1.16.16", rls_regex:"DEB7.[0-9]")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libdpkg-perl", ver:"1.16.16", rls_regex:"DEB7.[0-9]")) != NULL) {
    report += res;
}

if (report != "") {
    security_message(data:report);
} else if (__pkg_match) {
    exit(99); # Not vulnerable.
}
