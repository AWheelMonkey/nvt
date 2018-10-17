# OpenVAS Vulnerability Test
# $Id: deb_2867.nasl 9354 2018-04-06 07:15:32Z cfischer $
# Auto-generated from advisory DSA 2867-1 using nvtgen 1.0
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

tag_affected  = "otrs2 on Debian Linux";
tag_insight   = "OTRS is an Open source Ticket Request System (also well known as
trouble ticket system) with many features to manage customer telephone
calls and e-mails. The system is built to allow your support, sales,
pre-sales, billing, internal IT, helpdesk, etc. department to react
quickly to inbound inquiries. For a detailed documentation see package
otrs-doc-en or otrs-doc-de.";
tag_solution  = "For the oldstable distribution (squeeze), these problems have been fixed in
version 2.4.9+dfsg1-3+squeeze5.

For the stable distribution (wheezy), these problems have been fixed in
version 3.1.7+dfsg1-8+deb7u4.

For the testing distribution (jessie) and the unstable distribution
(sid), these problems have been fixed in version 3.3.4-1.

We recommend that you upgrade your otrs2 packages.";
tag_summary   = "Several vulnerabilities were discovered in otrs2, the Open Ticket
Request System. The Common Vulnerabilities and Exposures project
identifies the following problems:

CVE-2014-1694 
Norihiro Tanaka reported missing challenge token checks. An attacker
that managed to take over the session of a logged in customer could
create tickets and/or send follow-ups to existing tickets due to
these missing checks.

CVE-2014-1471 
Karsten Nielsen from Vasgard GmbH discovered that an attacker with a
valid customer or agent login could inject SQL code through the
ticket search URL.";
tag_vuldetect = "This check tests the installed software version using the apt package manager.";

if(description)
{
    script_oid("1.3.6.1.4.1.25623.1.0.702867");
    script_version("$Revision: 9354 $");
    script_cve_id("CVE-2014-1471", "CVE-2014-1694");
    script_name("Debian Security Advisory DSA 2867-1 (otrs2 - several vulnerabilities)");
    script_tag(name: "last_modification", value:"$Date: 2018-04-06 09:15:32 +0200 (Fri, 06 Apr 2018) $");
    script_tag(name: "creation_date", value:"2014-02-23 00:00:00 +0100 (Sun, 23 Feb 2014)");
    script_tag(name: "cvss_base", value:"7.5");
    script_tag(name: "cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");

    script_xref(name: "URL", value: "http://www.debian.org/security/2014/dsa-2867.html");


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
if ((res = isdpkgvuln(pkg:"otrs2", ver:"2.4.9+dfsg1-3+squeeze5", rls:"DEB6.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"otrs", ver:"3.1.7+dfsg1-8+deb7u4", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"otrs2", ver:"3.1.7+dfsg1-8+deb7u4", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"otrs", ver:"3.1.7+dfsg1-8+deb7u4", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"otrs2", ver:"3.1.7+dfsg1-8+deb7u4", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"otrs", ver:"3.1.7+dfsg1-8+deb7u4", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"otrs2", ver:"3.1.7+dfsg1-8+deb7u4", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"otrs", ver:"3.1.7+dfsg1-8+deb7u4", rls:"DEB7.3")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"otrs2", ver:"3.1.7+dfsg1-8+deb7u4", rls:"DEB7.3")) != NULL) {
    report += res;
}

if (report != "") {
    security_message(data:report);
} else if (__pkg_match) {
    exit(99); # Not vulnerable.
}
