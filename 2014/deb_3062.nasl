# OpenVAS Vulnerability Test
# $Id: deb_3062.nasl 9354 2018-04-06 07:15:32Z cfischer $
# Auto-generated from advisory DSA 3062-1 using nvtgen 1.0
# Script version: 1.0
#
# Author:
# Greenbone Networks
#
# Copyright:
# Copyright (c) 2014 Greenbone Networks GmbH http://greenbone.net
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
    script_oid("1.3.6.1.4.1.25623.1.0.703062");
    script_version("$Revision: 9354 $");
    script_cve_id("CVE-2014-4877");
    script_name("Debian Security Advisory DSA 3062-1 (wget - security update)");
    script_tag(name: "last_modification", value:"$Date: 2018-04-06 09:15:32 +0200 (Fri, 06 Apr 2018) $");
    script_tag(name: "creation_date", value:"2014-11-01 00:00:00 +0100 (Sat, 01 Nov 2014)");
    script_tag(name:"cvss_base", value:"9.3");
    script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");

    script_xref(name: "URL", value: "http://www.debian.org/security/2014/dsa-3062.html");


    script_category(ACT_GATHER_INFO);

    script_copyright("Copyright (c) 2014 Greenbone Networks GmbH http://greenbone.net");
    script_family("Debian Local Security Checks");
    script_dependencies("gather-package-list.nasl");
    script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages");
    script_tag(name: "affected",  value: "wget on Debian Linux");
        script_tag(name: "insight",   value: "Wget is a network utility to retrieve files from the web
using HTTP(S) and FTP, the two most widely used internet
protocols. It works non-interactively, so it will work in
the background, after having logged off. The program supports
recursive retrieval of web-authoring pages as well as FTP
sites -- you can use Wget to make mirrors of archives and
home pages or to travel the web like a WWW robot.");
    script_tag(name: "solution",  value: "For the stable distribution (wheezy), this problem has been fixed in
version 1.13.4-3+deb7u2.

For the unstable distribution (sid), this problem has been fixed in
version 1.16-1.

We recommend that you upgrade your wget packages.");
    script_tag(name: "summary",   value: "HD Moore of Rapid7 discovered a symlink attack in Wget, a command-line
utility to retrieve files via HTTP, HTTPS, and FTP. The vulnerability
allows to create arbitrary files on the user's system when Wget runs in
recursive mode against a malicious FTP server. Arbitrary file creation
may override content of user's files or permit remote code execution with
the user privilege. 

This update changes the default setting in Wget such that it no longer
creates local symbolic links, but rather traverses them and retrieves the
pointed-to file in such a retrieval.");
    script_tag(name: "vuldetect", value:  "This check tests the installed software version using the apt package manager.");
    script_tag(name:"qod_type", value:"package");
    script_tag(name:"solution_type", value:"VendorFix");
    exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"wget", ver:"1.13.4-3+deb7u2", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"wget", ver:"1.13.4-3+deb7u2", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"wget", ver:"1.13.4-3+deb7u2", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"wget", ver:"1.13.4-3+deb7u2", rls:"DEB7.3")) != NULL) {
    report += res;
}

if (report != "") {
    security_message(data:report);
} else if (__pkg_match) {
    exit(99); # Not vulnerable.
}
