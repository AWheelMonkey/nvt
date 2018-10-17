# OpenVAS Vulnerability Test
# $Id: deb_3828.nasl 11109 2018-08-24 14:47:20Z mmartin $
# Auto-generated from advisory DSA 3828-1 using nvtgen 1.0
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
    script_oid("1.3.6.1.4.1.25623.1.0.703828");
    script_version("$Revision: 11109 $");
    script_cve_id("CVE-2017-2669");
    script_name("Debian Security Advisory DSA 3828-1 (dovecot - security update)");
    script_tag(name: "last_modification", value: "$Date: 2018-08-24 16:47:20 +0200 (Fri, 24 Aug 2018) $");
    script_tag(name: "creation_date", value: "2017-04-10 00:00:00 +0200 (Mon, 10 Apr 2017)");
    script_tag(name:"cvss_base", value:"5.0");
    script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:P");
    script_tag(name: "solution_type", value: "VendorFix");
    script_tag(name: "qod_type", value: "package");

    script_xref(name: "URL", value: "http://www.debian.org/security/2017/dsa-3828.html");

    script_category(ACT_GATHER_INFO);

    script_copyright("Copyright (c) 2017 Greenbone Networks GmbH http://greenbone.net");
    script_family("Debian Local Security Checks");
    script_dependencies("gather-package-list.nasl");
    script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages");
    script_tag(name: "affected",  value: "dovecot on Debian Linux");
    script_tag(name: "solution",  value: "For the stable distribution (jessie), this problem has been fixed in
version 1:2.2.13-12~deb8u2.

We recommend that you upgrade your dovecot packages.");
    script_tag(name: "summary",   value: "It was discovered that the Dovecot email server is vulnerable to a
denial of service attack. When the dict 
passdb and userdb are used
for user authentication, the username sent by the IMAP/POP3 client is
sent through var_expand() to perform %variable expansion. Sending
specially crafted %variable fields could result in excessive memory
usage causing the process to crash (and restart).");
    script_tag(name: "vuldetect", value: "This check tests the installed software version using the apt package manager.");

    exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"dovecot-core", ver:"1:2.2.13-12~deb8u2", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"dovecot-dbg", ver:"1:2.2.13-12~deb8u2", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"dovecot-dev", ver:"1:2.2.13-12~deb8u2", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"dovecot-gssapi", ver:"1:2.2.13-12~deb8u2", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"dovecot-imapd", ver:"1:2.2.13-12~deb8u2", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"dovecot-ldap", ver:"1:2.2.13-12~deb8u2", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"dovecot-lmtpd", ver:"1:2.2.13-12~deb8u2", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"dovecot-lucene", ver:"1:2.2.13-12~deb8u2", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"dovecot-managesieved", ver:"1:2.2.13-12~deb8u2", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"dovecot-mysql", ver:"1:2.2.13-12~deb8u2", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"dovecot-pgsql", ver:"1:2.2.13-12~deb8u2", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"dovecot-pop3d", ver:"1:2.2.13-12~deb8u2", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"dovecot-sieve", ver:"1:2.2.13-12~deb8u2", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"dovecot-solr", ver:"1:2.2.13-12~deb8u2", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"dovecot-sqlite", ver:"1:2.2.13-12~deb8u2", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}

if (report != "") {
    security_message(data:report);
} else if (__pkg_match) {
    exit(99); # Not vulnerable.
}
