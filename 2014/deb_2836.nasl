# OpenVAS Vulnerability Test
# $Id: deb_2836.nasl 9354 2018-04-06 07:15:32Z cfischer $
# Auto-generated from advisory DSA 2836-1 using nvtgen 1.0
# Script version: 1.2
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

tag_affected  = "devscripts on Debian Linux";
tag_insight   = "Contains the following scripts, dependencies/recommendations shown in
brackets afterwards:";
tag_solution  = "For the stable distribution (wheezy), these problems have been fixed in
version 2.12.6+deb7u2.

For the testing distribution (jessie) and the unstable distribution
(sid), these problems have been fixed in version 2.13.9.

We recommend that you upgrade your devscripts packages.";
tag_summary   = "Several vulnerabilities have been discovered in uscan, a tool to scan
upstream sites for new releases of packages, which is part of the
devscripts package. An attacker controlling a website from which uscan
would attempt to download a source tarball could execute arbitrary code
with the privileges of the user running uscan.

The Common Vulnerabilities and Exposures project id CVE-2013-6888 
has
been assigned to identify them.";
tag_vuldetect = "This check tests the installed software version using the apt package manager.";

if(description)
{
    script_oid("1.3.6.1.4.1.25623.1.0.702836");
    script_version("$Revision: 9354 $");
    script_cve_id("CVE-2013-6888", "CVE-2013-7325");
    script_name("Debian Security Advisory DSA 2836-1 (devscripts - arbitrary code execution)");
    script_tag(name: "last_modification", value:"$Date: 2018-04-06 09:15:32 +0200 (Fri, 06 Apr 2018) $");
    script_tag(name: "creation_date", value:"2014-01-05 00:00:00 +0100 (Sun, 05 Jan 2014)");
    script_tag(name: "cvss_base", value:"10.0");
    script_tag(name: "cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");

    script_xref(name: "URL", value: "http://www.debian.org/security/2014/dsa-2836.html");


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
if ((res = isdpkgvuln(pkg:"devscripts", ver:"2.12.6+deb7u2", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"devscripts", ver:"2.12.6+deb7u2", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"devscripts", ver:"2.12.6+deb7u2", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"devscripts", ver:"2.12.6+deb7u2", rls:"DEB7.3")) != NULL) {
    report += res;
}

if (report != "") {
    security_message(data:report);
} else if (__pkg_match) {
    exit(99); # Not vulnerable.
}
