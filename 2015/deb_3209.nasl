# OpenVAS Vulnerability Test
# $Id: deb_3209.nasl 9355 2018-04-06 07:16:07Z cfischer $
# Auto-generated from advisory DSA 3209-1 using nvtgen 1.0
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
    script_oid("1.3.6.1.4.1.25623.1.0.703209");
    script_version("$Revision: 9355 $");
    script_cve_id("CVE-2013-4449", "CVE-2014-9713", "CVE-2015-1545");
    script_name("Debian Security Advisory DSA 3209-1 (openldap - security update)");
    script_tag(name: "last_modification", value: "$Date: 2018-04-06 09:16:07 +0200 (Fri, 06 Apr 2018) $");
    script_tag(name: "creation_date", value: "2015-03-30 00:00:00 +0200 (Mon, 30 Mar 2015)");
    script_tag(name:"cvss_base", value:"5.0");
    script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:P");
    script_tag(name: "solution_type", value: "VendorFix");
    script_tag(name: "qod_type", value: "package");

    script_xref(name: "URL", value: "http://www.debian.org/security/2015/dsa-3209.html");


    script_category(ACT_GATHER_INFO);

    script_copyright("Copyright (c) 2015 Greenbone Networks GmbH http://greenbone.net");
    script_family("Debian Local Security Checks");
    script_dependencies("gather-package-list.nasl");
    script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages");
    script_tag(name: "affected",  value: "openldap on Debian Linux");
    script_tag(name: "solution",  value: "For the stable distribution (wheezy),
these problems have been fixed in version 2.4.31-2.

For the upcoming stable distribution (jessie), these problems have been
fixed in version 2.4.40-4.

For the unstable distribution (sid), these problems have been fixed in
version 2.4.40-4.

We recommend that you upgrade your openldap packages.");
    script_tag(name: "summary",   value: "Multiple vulnerabilities were
found in OpenLDAP, a free implementation of the Lightweight Directory Access
Protocol.

CVE-2013-4449 
Michael Vishchers from Seven Principles AG discovered a denial of
service vulnerability in slapd, the directory server implementation.
When the server is configured to used the RWM overlay, an attacker
can make it crash by unbinding just after connecting, because of an
issue with reference counting.

CVE-2014-9713 
The default Debian configuration of the directory database allows
every users to edit their own attributes. When LDAP directories are
used for access control, and this is done using user attributes, an
authenticated user can leverage this to gain access to unauthorized
resources.

Please note this is a Debian specific vulnerability.

The new package won't use the unsafe access control rule for new
databases, but existing configurations won't be automatically
modified. Administrators are incited to look at the README.Debian
file provided by the updated package if they need to fix the access
control rule.

CVE-2015-1545 
Ryan Tandy discovered a denial of service vulnerability in slapd.
When using the deref overlay, providing an empty attribute list in
a query makes the daemon crashes.");
    script_tag(name: "vuldetect", value: "This check tests the installed
software version using the apt package manager.");
    exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"ldap-utils", ver:"2.4.31-2", rls_regex:"DEB7.[0-9]")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libldap-2.4-2:amd64", ver:"2.4.31-2", rls_regex:"DEB7.[0-9]")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libldap-2.4-2:i386", ver:"2.4.31-2", rls_regex:"DEB7.[0-9]")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libldap-2.4-2-dbg:amd64", ver:"2.4.31-2", rls_regex:"DEB7.[0-9]")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libldap-2.4-2-dbg:i386", ver:"2.4.31-2", rls_regex:"DEB7.[0-9]")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libldap2-dev:amd64", ver:"2.4.31-2", rls_regex:"DEB7.[0-9]")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libldap2-dev:i386", ver:"2.4.31-2", rls_regex:"DEB7.[0-9]")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"slapd", ver:"2.4.31-2", rls_regex:"DEB7.[0-9]")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"slapd-dbg", ver:"2.4.31-2", rls_regex:"DEB7.[0-9]")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"slapd-smbk5pwd", ver:"2.4.31-2", rls_regex:"DEB7.[0-9]")) != NULL) {
    report += res;
}

if (report != "") {
    security_message(data:report);
} else if (__pkg_match) {
    exit(99); # Not vulnerable.
}
