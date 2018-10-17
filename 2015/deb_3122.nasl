# OpenVAS Vulnerability Test
# $Id: deb_3122.nasl 9355 2018-04-06 07:16:07Z cfischer $
# Auto-generated from advisory DSA 3122-1 using nvtgen 1.0
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
    script_oid("1.3.6.1.4.1.25623.1.0.703122");
    script_version("$Revision: 9355 $");
    script_cve_id("CVE-2014-8150");
    script_name("Debian Security Advisory DSA 3122-1 (curl - security update)");
    script_tag(name: "last_modification", value: "$Date: 2018-04-06 09:16:07 +0200 (Fri, 06 Apr 2018) $");
    script_tag(name: "creation_date", value: "2015-01-08 00:00:00 +0100 (Thu, 08 Jan 2015)");
    script_tag(name:"cvss_base", value:"4.3");
    script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:P/A:N");
    script_tag(name: "solution_type", value: "VendorFix");

    script_xref(name: "URL", value: "http://www.debian.org/security/2015/dsa-3122.html");


    script_category(ACT_GATHER_INFO);

    script_copyright("Copyright (c) 2015 Greenbone Networks GmbH http://greenbone.net");
    script_family("Debian Local Security Checks");
    script_dependencies("gather-package-list.nasl");
    script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages");
    script_tag(name: "affected",  value: "curl on Debian Linux");
    script_tag(name: "insight",   value: "curl is a command line tool for
transferring data with URL syntax, supporting DICT, FILE, FTP, FTPS, GOPHER,
HTTP, HTTPS, IMAP, IMAPS, LDAP, POP3, POP3S, RTMP, RTSP, SCP, SFTP, SMTP, SMTPS,
TELNET and TFTP.");
    script_tag(name: "solution",  value: "For the stable distribution (wheezy),
this problem has been fixed in version 7.26.0-1+wheezy12.

For the upcoming stable distribution (jessie), this problem will be
fixed soon.

For the unstable distribution (sid), this problem has been fixed in
version 7.38.0-4.

We recommend that you upgrade your curl packages.");
    script_tag(name: "summary",   value: "Andrey Labunets of Facebook discovered
that cURL, an URL transfer library, fails to properly handle URLs with embedded
end-of-line characters. An attacker able to make an application using libcurl to
access a specially crafted URL via an HTTP proxy could use this flaw to
do additional requests in a way that was not intended, or insert
additional request headers into the request.");
    script_tag(name: "vuldetect", value: "This check tests the installed software version using the apt package manager.");
    script_tag(name:"qod_type", value:"package");
    exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"curl", ver:"7.26.0-1+wheezy12", rls_regex:"DEB7.[0-9]")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libcurl3", ver:"7.26.0-1+wheezy12", rls_regex:"DEB7.[0-9]")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libcurl3-dbg", ver:"7.26.0-1+wheezy12", rls_regex:"DEB7.[0-9]")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libcurl3-gnutls", ver:"7.26.0-1+wheezy12", rls_regex:"DEB7.[0-9]")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libcurl3-nss", ver:"7.26.0-1+wheezy12", rls_regex:"DEB7.[0-9]")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libcurl4-gnutls-dev", ver:"7.26.0-1+wheezy12", rls_regex:"DEB7.[0-9]")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libcurl4-nss-dev", ver:"7.26.0-1+wheezy12", rls_regex:"DEB7.[0-9]")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libcurl4-openssl-dev", ver:"7.26.0-1+wheezy12", rls_regex:"DEB7.[0-9]")) != NULL) {
    report += res;
}

if (report != "") {
    security_message(data:report);
} else if (__pkg_match) {
    exit(99); # Not vulnerable.
}
