# OpenVAS Vulnerability Test
# $Id: deb_2989.nasl 9354 2018-04-06 07:15:32Z cfischer $
# Auto-generated from advisory DSA 2989-1 using nvtgen 1.0
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

tag_affected  = "apache2 on Debian Linux";
tag_insight   = "The Apache Software Foundation's goal is to build a secure, efficient and
extensible HTTP server as standards-compliant open source software. The
result has long been the number one web server on the Internet.";
tag_solution  = "For the stable distribution (wheezy), these problems have been fixed in
version 2.2.22-13+deb7u3.

For the testing distribution (jessie), these problems will be fixed in
version 2.4.10-1.

For the unstable distribution (sid), these problems have been fixed in
version 2.4.10-1.

We recommend that you upgrade your apache2 packages.";
tag_summary   = "Several security issues were found in the Apache HTTP server.

CVE-2014-0118 
The DEFLATE input filter (inflates request bodies) in mod_deflate
allows remote attackers to cause a denial of service (resource
consumption) via crafted request data that decompresses to a much
larger size.

CVE-2014-0226 
A race condition was found in mod_status. An attacker able to
access a public server status page on a server could send carefully
crafted requests which could lead to a heap buffer overflow,
causing denial of service, disclosure of sensitive information, or
potentially the execution of arbitrary code.

CVE-2014-0231 
A flaw was found in mod_cgid. If a server using mod_cgid hosted
CGI scripts which did not consume standard input, a remote attacker
could cause child processes to hang indefinitely, leading to denial
of service.";
tag_vuldetect = "This check tests the installed software version using the apt package manager.";

if(description)
{
    script_oid("1.3.6.1.4.1.25623.1.0.702989");
    script_version("$Revision: 9354 $");
    script_cve_id("CVE-2014-0118", "CVE-2014-0226", "CVE-2014-0231");
    script_name("Debian Security Advisory DSA 2989-1 (apache2 - security update)");
    script_tag(name: "last_modification", value:"$Date: 2018-04-06 09:15:32 +0200 (Fri, 06 Apr 2018) $");
    script_tag(name: "creation_date", value:"2014-07-24 00:00:00 +0200 (Thu, 24 Jul 2014)");
    script_tag(name:"cvss_base", value:"6.8");
    script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");

    script_xref(name: "URL", value: "http://www.debian.org/security/2014/dsa-2989.html");


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
if ((res = isdpkgvuln(pkg:"apache2", ver:"2.2.22-13+deb7u3", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"apache2-dbg", ver:"2.2.22-13+deb7u3", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"apache2-doc", ver:"2.2.22-13+deb7u3", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"apache2-mpm-event", ver:"2.2.22-13+deb7u3", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"apache2-mpm-itk", ver:"2.2.22-13+deb7u3", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"apache2-mpm-prefork", ver:"2.2.22-13+deb7u3", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"apache2-mpm-worker", ver:"2.2.22-13+deb7u3", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"apache2-prefork-dev", ver:"2.2.22-13+deb7u3", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"apache2-suexec", ver:"2.2.22-13+deb7u3", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"apache2-suexec-custom", ver:"2.2.22-13+deb7u3", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"apache2-threaded-dev", ver:"2.2.22-13+deb7u3", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"apache2-utils", ver:"2.2.22-13+deb7u3", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"apache2.2-bin", ver:"2.2.22-13+deb7u3", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"apache2.2-common", ver:"2.2.22-13+deb7u3", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"apache2", ver:"2.2.22-13+deb7u3", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"apache2-dbg", ver:"2.2.22-13+deb7u3", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"apache2-doc", ver:"2.2.22-13+deb7u3", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"apache2-mpm-event", ver:"2.2.22-13+deb7u3", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"apache2-mpm-itk", ver:"2.2.22-13+deb7u3", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"apache2-mpm-prefork", ver:"2.2.22-13+deb7u3", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"apache2-mpm-worker", ver:"2.2.22-13+deb7u3", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"apache2-prefork-dev", ver:"2.2.22-13+deb7u3", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"apache2-suexec", ver:"2.2.22-13+deb7u3", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"apache2-suexec-custom", ver:"2.2.22-13+deb7u3", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"apache2-threaded-dev", ver:"2.2.22-13+deb7u3", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"apache2-utils", ver:"2.2.22-13+deb7u3", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"apache2.2-bin", ver:"2.2.22-13+deb7u3", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"apache2.2-common", ver:"2.2.22-13+deb7u3", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"apache2", ver:"2.2.22-13+deb7u3", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"apache2-dbg", ver:"2.2.22-13+deb7u3", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"apache2-doc", ver:"2.2.22-13+deb7u3", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"apache2-mpm-event", ver:"2.2.22-13+deb7u3", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"apache2-mpm-itk", ver:"2.2.22-13+deb7u3", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"apache2-mpm-prefork", ver:"2.2.22-13+deb7u3", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"apache2-mpm-worker", ver:"2.2.22-13+deb7u3", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"apache2-prefork-dev", ver:"2.2.22-13+deb7u3", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"apache2-suexec", ver:"2.2.22-13+deb7u3", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"apache2-suexec-custom", ver:"2.2.22-13+deb7u3", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"apache2-threaded-dev", ver:"2.2.22-13+deb7u3", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"apache2-utils", ver:"2.2.22-13+deb7u3", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"apache2.2-bin", ver:"2.2.22-13+deb7u3", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"apache2.2-common", ver:"2.2.22-13+deb7u3", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"apache2", ver:"2.2.22-13+deb7u3", rls:"DEB7.3")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"apache2-dbg", ver:"2.2.22-13+deb7u3", rls:"DEB7.3")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"apache2-doc", ver:"2.2.22-13+deb7u3", rls:"DEB7.3")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"apache2-mpm-event", ver:"2.2.22-13+deb7u3", rls:"DEB7.3")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"apache2-mpm-itk", ver:"2.2.22-13+deb7u3", rls:"DEB7.3")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"apache2-mpm-prefork", ver:"2.2.22-13+deb7u3", rls:"DEB7.3")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"apache2-mpm-worker", ver:"2.2.22-13+deb7u3", rls:"DEB7.3")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"apache2-prefork-dev", ver:"2.2.22-13+deb7u3", rls:"DEB7.3")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"apache2-suexec", ver:"2.2.22-13+deb7u3", rls:"DEB7.3")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"apache2-suexec-custom", ver:"2.2.22-13+deb7u3", rls:"DEB7.3")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"apache2-threaded-dev", ver:"2.2.22-13+deb7u3", rls:"DEB7.3")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"apache2-utils", ver:"2.2.22-13+deb7u3", rls:"DEB7.3")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"apache2.2-bin", ver:"2.2.22-13+deb7u3", rls:"DEB7.3")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"apache2.2-common", ver:"2.2.22-13+deb7u3", rls:"DEB7.3")) != NULL) {
    report += res;
}

if (report != "") {
    security_message(data:report);
} else if (__pkg_match) {
    exit(99); # Not vulnerable.
}
