# OpenVAS Vulnerability Test
# $Id: deb_3440.nasl 8131 2017-12-15 07:30:28Z teissa $
# Auto-generated from advisory DSA 3440-1 using nvtgen 1.0
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
    script_oid("1.3.6.1.4.1.25623.1.0.703440");
    script_version("$Revision: 8131 $");
    script_cve_id("CVE-2015-5602");
    script_name("Debian Security Advisory DSA 3440-1 (sudo - security update)");
    script_tag(name: "last_modification", value: "$Date: 2017-12-15 08:30:28 +0100 (Fri, 15 Dec 2017) $");
    script_tag(name: "creation_date", value: "2016-01-11 00:00:00 +0100 (Mon, 11 Jan 2016)");
    script_tag(name:"cvss_base", value:"7.2");
    script_tag(name:"cvss_base_vector", value:"AV:L/AC:L/Au:N/C:C/I:C/A:C");
    script_tag(name: "solution_type", value: "VendorFix");
    script_tag(name: "qod_type", value: "package");

    script_xref(name: "URL", value: "http://www.debian.org/security/2016/dsa-3440.html");


    script_category(ACT_GATHER_INFO);

    script_copyright("Copyright (c) 2016 Greenbone Networks GmbH http://greenbone.net");
    script_family("Debian Local Security Checks");
    script_dependencies("gather-package-list.nasl");
    script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages");
    script_tag(name: "affected",  value: "sudo on Debian Linux");
    script_tag(name: "insight",   value: "Sudo is a program designed to allow a
sysadmin to give limited root privileges to users and log root activity. The basic
philosophy is to give as few privileges as possible but still allow people to get
their work done.");
    script_tag(name: "solution",  value: "For the oldstable distribution (wheezy),
this problem has been fixed in version 1.8.5p2-1+nmu3+deb7u1.

For the stable distribution (jessie), this problem has been fixed in
version 1.8.10p3-1+deb8u3.

For the testing distribution (stretch), this problem has been fixed
in version 1.8.15-1.1.

For the unstable distribution (sid), this problem has been fixed in
version 1.8.15-1.1.

We recommend that you upgrade your sudo packages.");
    script_tag(name: "summary",   value: "When sudo is configured to allow a user to
edit files under a directory that they can already write to without using sudo, they
can actually edit (read and write) arbitrary files. Daniel Svartman reported that a
configuration like this might be introduced unintentionally if the
editable files are specified using wildcards, for example:

operator ALL=(root) sudoedit /home/*/*/test.txt 
The default behaviour of sudo has been changed so that it does not allow
editing of a file in a directory that the user can write to, or that is
reached by following a symlink in a directory that the user can write
to. These restrictions can be disabled, but this is strongly
discouraged.");
    script_tag(name: "vuldetect", value: "This check tests the installed software version
using the apt package manager.");
    exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"sudo", ver:"1.8.10p3-1+deb8u3", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"sudo-ldap", ver:"1.8.10p3-1+deb8u3", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"sudo", ver:"1.8.5p2-1+nmu3+deb7u1", rls_regex:"DEB7.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"sudo-ldap", ver:"1.8.5p2-1+nmu3+deb7u1", rls_regex:"DEB7.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"sudo", ver:"1.8.15-1.1", rls_regex:"DEB9.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"sudo-ldap", ver:"1.8.15-1.1", rls_regex:"DEB9.[0-9]+")) != NULL) {
    report += res;
}

if (report != "") {
    security_message(data:report);
} else if (__pkg_match) {
    exit(99); # Not vulnerable.
}
