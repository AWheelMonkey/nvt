# OpenVAS Vulnerability Test
# $Id: deb_2784.nasl 9353 2018-04-06 07:14:20Z cfischer $
# Auto-generated from advisory DSA 2784-1 using nvtgen 1.0
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

tag_affected  = "xorg-server on Debian Linux";
tag_insight   = "The Xorg X server is an X server for several architectures and operating
systems, which is derived from the XFree86 4.x series of X servers.";
tag_solution  = "For the oldstable distribution (squeeze), this problem has been fixed in
version 1.7.7-17.

For the stable distribution (wheezy), this problem has been fixed in
version 1.12.4-6+deb7u1.

For the testing distribution (jessie), this problem has been fixed in
version 1.14.3-4.

For the unstable distribution (sid), this problem has been fixed in
version 1.14.3-4.

We recommend that you upgrade your xorg-server packages.";
tag_summary   = "Pedro Ribeiro discovered a use-after-free in the handling of ImageText
requests in the Xorg Xserver, which could result in denial of service
or privilege escalation.";
tag_vuldetect = "This check tests the installed software version using the apt package manager.";

if(description)
{
    script_oid("1.3.6.1.4.1.25623.1.0.892784");
    script_version("$Revision: 9353 $");
    script_cve_id("CVE-2013-4396");
    script_name("Debian Security Advisory DSA 2784-1 (xorg-server - use-after-free)");
    script_tag(name: "last_modification", value:"$Date: 2018-04-06 09:14:20 +0200 (Fri, 06 Apr 2018) $");
    script_tag(name: "creation_date", value:"2013-10-22 00:00:00 +0200 (Tue, 22 Oct 2013)");
    script_tag(name: "cvss_base", value:"6.5");
    script_tag(name: "cvss_base_vector", value:"AV:N/AC:L/Au:S/C:P/I:P/A:P");

    script_xref(name: "URL", value: "http://www.debian.org/security/2013/dsa-2784.html");


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
if ((res = isdpkgvuln(pkg:"xdmx", ver:"1.7.7-17", rls:"DEB6.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"xdmx-tools", ver:"1.7.7-17", rls:"DEB6.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"xnest", ver:"1.7.7-17", rls:"DEB6.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"xserver-common", ver:"1.7.7-17", rls:"DEB6.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"xserver-xephyr", ver:"1.7.7-17", rls:"DEB6.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"xserver-xfbdev", ver:"1.7.7-17", rls:"DEB6.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"xserver-xorg-core", ver:"1.7.7-17", rls:"DEB6.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"xserver-xorg-core-dbg", ver:"1.7.7-17", rls:"DEB6.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"xserver-xorg-dev", ver:"1.7.7-17", rls:"DEB6.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"xvfb", ver:"1.7.7-17", rls:"DEB6.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"xdmx", ver:"1.12.4-6+deb7u1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"xdmx-tools", ver:"1.12.4-6+deb7u1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"xnest", ver:"1.12.4-6+deb7u1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"xserver-common", ver:"1.12.4-6+deb7u1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"xserver-xephyr", ver:"1.12.4-6+deb7u1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"xserver-xfbdev", ver:"1.12.4-6+deb7u1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"xserver-xorg-core", ver:"1.12.4-6+deb7u1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"xserver-xorg-core-dbg", ver:"1.12.4-6+deb7u1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"xserver-xorg-dev", ver:"1.12.4-6+deb7u1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"xvfb", ver:"1.12.4-6+deb7u1", rls:"DEB7.0")) != NULL) {
    report += res;
}

if (report != "") {
    security_message(data:report);
} else if (__pkg_match) {
    exit(99); # Not vulnerable.
}
