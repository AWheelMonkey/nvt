# OpenVAS Vulnerability Test
# $Id: deb_2631.nasl 9353 2018-04-06 07:14:20Z cfischer $
# Auto-generated from advisory DSA 2631-1 using nvtgen 1.0
# Script version: 1.0
#
# Author:
# Greenbone Networks
#
# Copyright:
# Copyright (c) 2013 Greenbone Networks GmbH http://greenbone.net
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

include("revisions-lib.inc");

tag_affected  = "squid3 on Debian Linux";
tag_insight   = "Squid is a high-performance proxy caching server for web clients, supporting
FTP, gopher, and HTTP data objects.";
tag_solution  = "For the stable distribution (squeeze), these problems have been fixed in
version 3.1.6-1.2+squeeze3.

For the testing distribution (wheezy), these problems have been fixed in
version 3.1.20-2.1.

For the unstable distribution (sid), these problems have been fixed in
version 3.1.20-2.1.

We recommend that you upgrade your squid3 packages.";
tag_summary   = "Squid3, a fully featured Web proxy cache, is prone to a denial of
service attack due to memory consumption caused by memory leaks in
cachemgr.cgi:

CVE-2012-5643 
squid's cachemgr.cgi was vulnerable to excessive resource use.
A remote attacker could exploit this flaw to perform a denial of
service attack on the server and other hosted services.

CVE-2013-0189The original patch for CVE-2012-5643 

was incomplete. A remote attacker still could exploit this flaw
to perform a denial of service attack.";
tag_vuldetect = "This check tests the installed software version using the apt package manager.";

if(description)
{
    script_oid("1.3.6.1.4.1.25623.1.0.892631");
    script_version("$Revision: 9353 $");
    script_cve_id("CVE-2013-0189", "CVE-2012-5643");
    script_name("Debian Security Advisory DSA 2631-1 (squid3 - denial of service)");
    script_tag(name: "last_modification", value:"$Date: 2018-04-06 09:14:20 +0200 (Fri, 06 Apr 2018) $");
    script_tag(name: "creation_date", value:"2013-02-24 00:00:00 +0100 (Sun, 24 Feb 2013)");
    script_tag(name: "cvss_base", value:"5.0");
    script_tag(name: "cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:P");

    script_xref(name: "URL", value: "http://www.debian.org/security/2013/dsa-2631.html");


    script_category(ACT_GATHER_INFO);

    script_copyright("Copyright (c) 2013 Greenbone Networks GmbH http://greenbone.net");
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

include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"squid-cgi", ver:"3.1.6-1.2+squeeze3", rls:"DEB6.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"squid3", ver:"3.1.6-1.2+squeeze3", rls:"DEB6.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"squid3-common", ver:"3.1.6-1.2+squeeze3", rls:"DEB6.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"squid3-dbg", ver:"3.1.6-1.2+squeeze3", rls:"DEB6.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"squidclient", ver:"3.1.6-1.2+squeeze3", rls:"DEB6.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"squid-cgi", ver:"3.1.20-2.1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"squid3", ver:"3.1.20-2.1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"squid3-common", ver:"3.1.20-2.1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"squid3-dbg", ver:"3.1.20-2.1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"squidclient", ver:"3.1.20-2.1", rls:"DEB7.0")) != NULL) {
    report += res;
}

if (report != "") {
    security_message(data:report);
} else if (__pkg_match) {
    exit(99); # Not vulnerable.
}
