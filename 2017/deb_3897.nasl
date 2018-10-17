# OpenVAS Vulnerability Test
# $Id: deb_3897.nasl 9356 2018-04-06 07:17:02Z cfischer $
# Auto-generated from advisory DSA 3897-1 using nvtgen 1.0
# Script version: 1.0
#
# Author:
# Greenbone Networks
#
# Copyright:
# Copyright (c) 2017 Greenbone Networks GmbH http://greenbone.net
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
    script_oid("1.3.6.1.4.1.25623.1.0.703897");
    script_version("$Revision: 9356 $");
    script_cve_id("CVE-2015-7943", "CVE-2017-6922");
    script_name("Debian Security Advisory DSA 3897-1 (drupal7 - security update)");
    script_tag(name: "last_modification", value: "$Date: 2018-04-06 09:17:02 +0200 (Fri, 06 Apr 2018) $");
    script_tag(name: "creation_date", value: "2017-06-24 00:00:00 +0200 (Sat, 24 Jun 2017)");
    script_tag(name: "cvss_base", value: "10.0");
    script_tag(name: "cvss_base_vector", value: "AV:N/AC:L/Au:N/C:C/I:C/A:C");
    script_tag(name: "solution_type", value: "VendorFix");
    script_tag(name: "qod_type", value: "package");

    script_xref(name: "URL", value: "http://www.debian.org/security/2017/dsa-3897.html");

    script_category(ACT_GATHER_INFO);

    script_copyright("Copyright (c) 2017 Greenbone Networks GmbH http://greenbone.net");
    script_family("Debian Local Security Checks");
    script_dependencies("gather-package-list.nasl");
    script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages");
    script_tag(name: "affected",  value: "drupal7 on Debian Linux");
        script_tag(name: "insight",   value: "Drupal is a dynamic web site platform which allows an individual or
community of users to publish, manage and organize a variety of
content, Drupal integrates many popular features of content
management systems, weblogs, collaborative tools and discussion-based
community software into one easy-to-use package.");
    script_tag(name: "solution",  value: "For the oldstable distribution (jessie), these problems have been fixed
in version 7.32-1+deb8u9.

For the stable distribution (stretch), these problems have been fixed in
version 7.52-2+deb9u1. For the stable distribution (stretch),
CVE-2015-7943 
was already fixed before the initial release.

We recommend that you upgrade your drupal7 packages.");
    script_tag(name: "summary",   value: "Two vulnerabilities were discovered in Drupal, a fully-featured content
management framework. The Common Vulnerabilities and Exposures project
identifies the following issues:

CVE-2015-7943 
Samuel Mortenson and Pere Orga discovered that the overlay module
does not sufficiently validate URLs prior to displaying their
contents, leading to an open redirect vulnerability.

More information can be found at
https://www.drupal.org/SA-CORE-2015-004CVE-2017-6922 
Greg Knaddison, Mori Sugimoto and iancawthorne discovered that files
uploaded by anonymous users into a private file system can be
accessed by other anonymous users leading to an access bypass
vulnerability.

More information can be found at
https://www.drupal.org/SA-CORE-2017-003");
    script_tag(name: "vuldetect", value: "This check tests the installed software version using the apt package manager.");

    exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"drupal7", ver:"7.32-1+deb8u9", rls_regex:"DEB8.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"drupal7", ver:"7.52-2+deb9u1", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}

if (report != "") {
    security_message(data:report);
} else if (__pkg_match) {
    exit(99); # Not vulnerable.
}
