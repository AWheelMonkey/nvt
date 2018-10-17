# OpenVAS Vulnerability Test
# $Id: deb_3075.nasl 9354 2018-04-06 07:15:32Z cfischer $
# Auto-generated from advisory DSA 3075-1 using nvtgen 1.0
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
    script_oid("1.3.6.1.4.1.25623.1.0.703075");
    script_version("$Revision: 9354 $");
    script_cve_id("CVE-2014-9015", "CVE-2014-9016");
    script_name("Debian Security Advisory DSA 3075-1 (drupal7 - security update)");
    script_tag(name: "last_modification", value: "$Date: 2018-04-06 09:15:32 +0200 (Fri, 06 Apr 2018) $");
    script_tag(name: "creation_date", value: "2014-11-20 00:00:00 +0100 (Thu, 20 Nov 2014)");
    script_tag(name:"cvss_base", value:"6.8");
    script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");

    script_xref(name: "URL", value: "http://www.debian.org/security/2014/dsa-3075.html");


    script_category(ACT_GATHER_INFO);

    script_copyright("Copyright (c) 2014 Greenbone Networks GmbH http://greenbone.net");
    script_family("Debian Local Security Checks");
    script_dependencies("gather-package-list.nasl");
    script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages");
    script_tag(name: "affected",  value: "drupal7 on Debian Linux");
        script_tag(name: "insight",   value: "Drupal is a dynamic web site platform which allows an individual or
community of users to publish, manage and organize a variety of
content, Drupal integrates many popular features of content
management systems, weblogs, collaborative tools and discussion-based
community software into one easy-to-use package.");
    script_tag(name: "solution",  value: "For the stable distribution (wheezy), these problems have been fixed in
version 7.14-2+deb7u8.

We recommend that you upgrade your drupal7 packages.");
    script_tag(name: "summary",   value: "Two vulnerabilities were discovered in Drupal, a fully-featured content
management framework. The Common Vulnerabilities and Exposures project
identifies the following issues:

CVE-2014-9015 
Aaron Averill discovered that a specially crafted request can give a
user access to another user's session, allowing an attacker to
hijack a random session.

CVE-2014-9016 
Michael Cullum, Javier Nieto and Andres Rojas Guerrero discovered
that the password hashing API allows an attacker to send
specially crafted requests resulting in CPU and memory
exhaustion. This may lead to the site becoming unavailable or
unresponsive (denial of service).

Custom configured session.inc and password.inc need to be audited as
well to verify if they are prone to these vulnerabilities. More
information can be found in the upstream advisory at
https://www.drupal.org/SA-CORE-2014-006");
    script_tag(name: "vuldetect", value: "This check tests the installed software version using the apt package manager.");
    script_tag(name:"qod_type", value:"package");
    script_tag(name:"solution_type", value:"VendorFix");
    exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"drupal7", ver:"7.14-2+deb7u8", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"drupal7", ver:"7.14-2+deb7u8", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"drupal7", ver:"7.14-2+deb7u8", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"drupal7", ver:"7.14-2+deb7u8", rls:"DEB7.3")) != NULL) {
    report += res;
}

if (report != "") {
    security_message(data:report);
} else if (__pkg_match) {
    exit(99); # Not vulnerable.
}
