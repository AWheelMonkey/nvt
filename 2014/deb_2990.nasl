# OpenVAS Vulnerability Test
# $Id: deb_2990.nasl 9354 2018-04-06 07:15:32Z cfischer $
# Auto-generated from advisory DSA 2990-1 using nvtgen 1.0
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

tag_affected  = "cups on Debian Linux";
tag_insight   = "The Common UNIX Printing System (or CUPS(tm)) is a printing system and
general replacement for lpd and the like. It supports the Internet
Printing Protocol (IPP), and has its own filtering driver model for
handling various document types.";
tag_solution  = "For the stable distribution (wheezy), these problems have been fixed in
version 1.5.3-5+deb7u4.

For the unstable distribution (sid), these problems have been fixed in
version 1.7.4-2.

We recommend that you upgrade your cups packages.";
tag_summary   = "It was discovered that the web interface in CUPS, the Common UNIX
Printing System, incorrectly validated permissions on rss files and
directory index files. A local attacker could possibly use this issue
to bypass file permissions and read arbitrary files, possibly leading
to a privilege escalation.";
tag_vuldetect = "This check tests the installed software version using the apt package manager.";

if(description)
{
    script_oid("1.3.6.1.4.1.25623.1.0.702990");
    script_version("$Revision: 9354 $");
    script_cve_id("CVE-2014-3537", "CVE-2014-5029", "CVE-2014-5030", "CVE-2014-5031");
    script_name("Debian Security Advisory DSA 2990-1 (cups - security update)");
    script_tag(name: "last_modification", value:"$Date: 2018-04-06 09:15:32 +0200 (Fri, 06 Apr 2018) $");
    script_tag(name: "creation_date", value:"2014-07-27 00:00:00 +0200 (Sun, 27 Jul 2014)");
    script_tag(name:"cvss_base", value:"5.0");
    script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:N");

    script_xref(name: "URL", value: "http://www.debian.org/security/2014/dsa-2990.html");


    script_category(ACT_GATHER_INFO);

    script_copyright("Copyright (c) 2014 Greenbone Networks GmbH http://greenbone.net");
    script_family("Debian Local Security Checks");
    script_dependencies("gather-package-list.nasl");
    script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages");
    script_tag(name: "affected",  value: tag_affected);
    script_tag(name: "insight",   value: tag_insight);
#    script_tag(name: "impact",    value: tag_impact);
    script_tag(name: "solution",  value: tag_solution);
    script_tag(name: "summary",   value: tag_summary);
    script_tag(name: "vuldetect", value: tag_vuldetect);
    script_tag(name:"qod_type", value:"package");
    script_tag(name:"solution_type", value:"VendorFix");

    exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"cups", ver:"1.5.3-5+deb7u4", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"cups-bsd", ver:"1.5.3-5+deb7u4", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"cups-client", ver:"1.5.3-5+deb7u4", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"cups-common", ver:"1.5.3-5+deb7u4", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"cups-dbg", ver:"1.5.3-5+deb7u4", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"cups-ppdc", ver:"1.5.3-5+deb7u4", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"cupsddk", ver:"1.5.3-5+deb7u4", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libcups2", ver:"1.5.3-5+deb7u4", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libcups2-dev", ver:"1.5.3-5+deb7u4", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libcupscgi1", ver:"1.5.3-5+deb7u4", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libcupscgi1-dev", ver:"1.5.3-5+deb7u4", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libcupsdriver1", ver:"1.5.3-5+deb7u4", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libcupsdriver1-dev", ver:"1.5.3-5+deb7u4", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libcupsimage2", ver:"1.5.3-5+deb7u4", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libcupsimage2-dev", ver:"1.5.3-5+deb7u4", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libcupsmime1", ver:"1.5.3-5+deb7u4", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libcupsmime1-dev", ver:"1.5.3-5+deb7u4", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libcupsppdc1", ver:"1.5.3-5+deb7u4", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libcupsppdc1-dev", ver:"1.5.3-5+deb7u4", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"cups", ver:"1.5.3-5+deb7u4", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"cups-bsd", ver:"1.5.3-5+deb7u4", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"cups-client", ver:"1.5.3-5+deb7u4", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"cups-common", ver:"1.5.3-5+deb7u4", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"cups-dbg", ver:"1.5.3-5+deb7u4", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"cups-ppdc", ver:"1.5.3-5+deb7u4", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"cupsddk", ver:"1.5.3-5+deb7u4", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libcups2", ver:"1.5.3-5+deb7u4", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libcups2-dev", ver:"1.5.3-5+deb7u4", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libcupscgi1", ver:"1.5.3-5+deb7u4", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libcupscgi1-dev", ver:"1.5.3-5+deb7u4", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libcupsdriver1", ver:"1.5.3-5+deb7u4", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libcupsdriver1-dev", ver:"1.5.3-5+deb7u4", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libcupsimage2", ver:"1.5.3-5+deb7u4", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libcupsimage2-dev", ver:"1.5.3-5+deb7u4", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libcupsmime1", ver:"1.5.3-5+deb7u4", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libcupsmime1-dev", ver:"1.5.3-5+deb7u4", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libcupsppdc1", ver:"1.5.3-5+deb7u4", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libcupsppdc1-dev", ver:"1.5.3-5+deb7u4", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"cups", ver:"1.5.3-5+deb7u4", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"cups-bsd", ver:"1.5.3-5+deb7u4", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"cups-client", ver:"1.5.3-5+deb7u4", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"cups-common", ver:"1.5.3-5+deb7u4", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"cups-dbg", ver:"1.5.3-5+deb7u4", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"cups-ppdc", ver:"1.5.3-5+deb7u4", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"cupsddk", ver:"1.5.3-5+deb7u4", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libcups2", ver:"1.5.3-5+deb7u4", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libcups2-dev", ver:"1.5.3-5+deb7u4", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libcupscgi1", ver:"1.5.3-5+deb7u4", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libcupscgi1-dev", ver:"1.5.3-5+deb7u4", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libcupsdriver1", ver:"1.5.3-5+deb7u4", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libcupsdriver1-dev", ver:"1.5.3-5+deb7u4", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libcupsimage2", ver:"1.5.3-5+deb7u4", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libcupsimage2-dev", ver:"1.5.3-5+deb7u4", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libcupsmime1", ver:"1.5.3-5+deb7u4", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libcupsmime1-dev", ver:"1.5.3-5+deb7u4", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libcupsppdc1", ver:"1.5.3-5+deb7u4", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libcupsppdc1-dev", ver:"1.5.3-5+deb7u4", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"cups", ver:"1.5.3-5+deb7u4", rls:"DEB7.3")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"cups-bsd", ver:"1.5.3-5+deb7u4", rls:"DEB7.3")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"cups-client", ver:"1.5.3-5+deb7u4", rls:"DEB7.3")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"cups-common", ver:"1.5.3-5+deb7u4", rls:"DEB7.3")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"cups-dbg", ver:"1.5.3-5+deb7u4", rls:"DEB7.3")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"cups-ppdc", ver:"1.5.3-5+deb7u4", rls:"DEB7.3")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"cupsddk", ver:"1.5.3-5+deb7u4", rls:"DEB7.3")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libcups2", ver:"1.5.3-5+deb7u4", rls:"DEB7.3")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libcups2-dev", ver:"1.5.3-5+deb7u4", rls:"DEB7.3")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libcupscgi1", ver:"1.5.3-5+deb7u4", rls:"DEB7.3")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libcupscgi1-dev", ver:"1.5.3-5+deb7u4", rls:"DEB7.3")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libcupsdriver1", ver:"1.5.3-5+deb7u4", rls:"DEB7.3")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libcupsdriver1-dev", ver:"1.5.3-5+deb7u4", rls:"DEB7.3")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libcupsimage2", ver:"1.5.3-5+deb7u4", rls:"DEB7.3")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libcupsimage2-dev", ver:"1.5.3-5+deb7u4", rls:"DEB7.3")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libcupsmime1", ver:"1.5.3-5+deb7u4", rls:"DEB7.3")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libcupsmime1-dev", ver:"1.5.3-5+deb7u4", rls:"DEB7.3")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libcupsppdc1", ver:"1.5.3-5+deb7u4", rls:"DEB7.3")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libcupsppdc1-dev", ver:"1.5.3-5+deb7u4", rls:"DEB7.3")) != NULL) {
    report += res;
}

if (report != "") {
    security_message(data:report);
} else if (__pkg_match) {
    exit(99); # Not vulnerable.
}
