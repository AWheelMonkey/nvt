# OpenVAS Vulnerability Test
# $Id: deb_2897.nasl 9354 2018-04-06 07:15:32Z cfischer $
# Auto-generated from advisory DSA 2897-1 using nvtgen 1.0
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
    script_oid("1.3.6.1.4.1.25623.1.0.702897");
    script_version("$Revision: 9354 $");
    script_cve_id("CVE-2013-2067", "CVE-2013-2071", "CVE-2013-4286", "CVE-2013-4322",
                  "CVE-2014-0050");
    script_name("Debian Security Advisory DSA 2897-1 (tomcat7 - security update)");
    script_tag(name: "last_modification", value: "$Date: 2018-04-06 09:15:32 +0200 (Fri, 06 Apr 2018) $");
    script_tag(name: "creation_date", value: "2014-04-08 00:00:00 +0200 (Tue, 08 Apr 2014)");
    script_tag(name:"cvss_base", value:"7.5");
    script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
    script_tag(name: "solution_type", value: "VendorFix");

    script_xref(name: "URL", value: "http://www.debian.org/security/2014/dsa-2897.html");


    script_category(ACT_GATHER_INFO);

    script_copyright("Copyright (c) 2015 Greenbone Networks GmbH http://greenbone.net");
    script_family("Debian Local Security Checks");
    script_dependencies("gather-package-list.nasl");
    script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages");
    script_tag(name: "affected",  value: "tomcat7 on Debian Linux");
    script_tag(name: "insight",   value: "Apache Tomcat implements the Java Servlet and the JavaServer Pages (JSP)
specifications from Sun Microsystems, and provides a 'pure Java' HTTP web
server environment for Java code to run.");
    script_tag(name: "solution",  value: "For the stable distribution (wheezy),
these problems have been fixed in version 7.0.28-4+deb7u1.

For the testing distribution (jessie), these problems have been fixed in
version 7.0.52-1.

For the unstable distribution (sid), these problems have been fixed in
version 7.0.52-1.

We recommend that you upgrade your tomcat7 packages.");
    script_tag(name: "summary",   value: "Multiple security issues were found
in the Tomcat servlet and JSP engine:

CVE-2013-2067
FORM authentication associates the most recent request requiring
authentication with the current session. By repeatedly sending a request
for an authenticated resource while the victim is completing the login
form, an attacker could inject a request that would be executed using the
victim's credentials.

CVE-2013-2071
A runtime exception in AsyncListener.onComplete() prevents the request from
being recycled. This may expose elements of a previous request to a current
request.

CVE-2013-4286
Reject requests with multiple content-length headers or with a content-length
header when chunked encoding is being used.

CVE-2013-4322
When processing a request submitted using the chunked transfer encoding,
Tomcat ignored but did not limit any extensions that were included. This allows
a client to perform a limited denial of service by streaming an unlimited amount
of data to the server.

CVE-2014-0050
Multipart requests with a malformed Content-Type header could trigger an
infinite loop causing a denial of service.");
    script_tag(name: "vuldetect", value: "This check tests the installed software version using the apt package manager.");
    script_tag(name:"qod_type", value:"package");
    exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"libservlet3.0-java", ver:"7.0.28-4+deb7u1", rls_regex:"DEB7.[0-9]")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libservlet3.0-java-doc", ver:"7.0.28-4+deb7u1", rls_regex:"DEB7.[0-9]")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libtomcat7-java", ver:"7.0.28-4+deb7u1", rls_regex:"DEB7.[0-9]")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"tomcat7", ver:"7.0.28-4+deb7u1", rls_regex:"DEB7.[0-9]")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"tomcat7-admin", ver:"7.0.28-4+deb7u1", rls_regex:"DEB7.[0-9]")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"tomcat7-common", ver:"7.0.28-4+deb7u1", rls_regex:"DEB7.[0-9]")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"tomcat7-docs", ver:"7.0.28-4+deb7u1", rls_regex:"DEB7.[0-9]")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"tomcat7-examples", ver:"7.0.28-4+deb7u1", rls_regex:"DEB7.[0-9]")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"tomcat7-user", ver:"7.0.28-4+deb7u1", rls_regex:"DEB7.[0-9]")) != NULL) {
    report += res;
}

if (report != "") {
    security_message(data:report);
} else if (__pkg_match) {
    exit(99); # Not vulnerable.
}
