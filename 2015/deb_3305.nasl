# OpenVAS Vulnerability Test
# $Id: deb_3305.nasl 9355 2018-04-06 07:16:07Z cfischer $
# Auto-generated from advisory DSA 3305-1 using nvtgen 1.0
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
    script_oid("1.3.6.1.4.1.25623.1.0.703305");
    script_version("$Revision: 9355 $");
    script_cve_id("CVE-2015-5143", "CVE-2015-5144");
    script_name("Debian Security Advisory DSA 3305-1 (python-django - security update)");
    script_tag(name: "last_modification", value: "$Date: 2018-04-06 09:16:07 +0200 (Fri, 06 Apr 2018) $");
    script_tag(name: "creation_date", value: "2015-07-08 00:00:00 +0200 (Wed, 08 Jul 2015)");
    script_tag(name:"cvss_base", value:"7.8");
    script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:C");
    script_tag(name: "solution_type", value: "VendorFix");
    script_tag(name: "qod_type", value: "package");

    script_xref(name: "URL", value: "http://www.debian.org/security/2015/dsa-3305.html");


    script_category(ACT_GATHER_INFO);

    script_copyright("Copyright (c) 2015 Greenbone Networks GmbH http://greenbone.net");
    script_family("Debian Local Security Checks");
    script_dependencies("gather-package-list.nasl");
    script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages");
    script_tag(name: "affected",  value: "python-django on Debian Linux");
    script_tag(name: "insight",   value: "Django is a high-level web application
framework that loosely follows the model-view-controller design pattern.");
    script_tag(name: "solution",  value: "For the oldstable distribution (wheezy),
these problems have been fixed in version 1.4.5-1+deb7u12.

For the stable distribution (jessie), these problems have been fixed in
version 1.7.7-1+deb8u1.

For the unstable distribution (sid), these problems will be fixed soon.

We recommend that you upgrade your python-django packages.");
    script_tag(name: "summary",   value: "Several vulnerabilities were discovered
in Django, a high-level Python web development framework:

CVE-2015-5143 
Eric Peterson and Lin Hua Cheng discovered that a new empty record
used to be created in the session storage every time a session was
accessed and an unknown session key was provided in the request
cookie. This could allow remote attackers to saturate the session
store or cause other users' session records to be evicted.

CVE-2015-5144 
Sjoerd Job Postmus discovered that some built-in validators did not
properly reject newlines in input values. This could allow remote
attackers to inject headers in emails and HTTP responses.");
    script_tag(name: "vuldetect", value: "This check tests the installed software
version using the apt package manager.");
    exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"python-django", ver:"1.4.5-1+deb7u12", rls_regex:"DEB7.[0-9]")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"python-django-doc", ver:"1.4.5-1+deb7u12", rls_regex:"DEB7.[0-9]")) != NULL) {
    report += res;
}

if (report != "") {
    security_message(data:report);
} else if (__pkg_match) {
    exit(99); # Not vulnerable.
}
