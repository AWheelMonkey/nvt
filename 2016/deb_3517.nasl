# OpenVAS Vulnerability Test
# $Id: deb_3517.nasl 8131 2017-12-15 07:30:28Z teissa $
# Auto-generated from advisory DSA 3517-1 using nvtgen 1.0
# Script version: 1.0
#
# Author:
# Greenbone Networks
#
# Copyright:
# Copyright (c) 2016 Greenbone Networks GmbH http://greenbone.net
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
    script_oid("1.3.6.1.4.1.25623.1.0.703517");
    script_version("$Revision: 8131 $");
    script_cve_id("CVE-2016-1531");
    script_name("Debian Security Advisory DSA 3517-1 (exim4 - security update)");
    script_tag(name: "last_modification", value: "$Date: 2017-12-15 08:30:28 +0100 (Fri, 15 Dec 2017) $");
    script_tag(name: "creation_date", value: "2016-03-14 00:00:00 +0100 (Mon, 14 Mar 2016)");
    script_tag(name:"cvss_base", value:"6.9");
    script_tag(name:"cvss_base_vector", value:"AV:L/AC:M/Au:N/C:C/I:C/A:C");
    script_tag(name: "solution_type", value: "VendorFix");
    script_tag(name: "qod_type", value: "package");

    script_xref(name: "URL", value: "http://www.debian.org/security/2016/dsa-3517.html");


    script_category(ACT_GATHER_INFO);

    script_copyright("Copyright (c) 2016 Greenbone Networks GmbH http://greenbone.net");
    script_family("Debian Local Security Checks");
    script_dependencies("gather-package-list.nasl");
    script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages");
    script_tag(name: "affected",  value: "exim4 on Debian Linux");
    script_tag(name: "insight",   value: "Exim (v4) is a mail transport agent.
exim4 is the metapackage depending on the essential components for a basic
exim4 installation.");
    script_tag(name: "solution",  value: "For the oldstable distribution
(wheezy), this problem has been fixed in version 4.80-7+deb7u2.

For the stable distribution (jessie), this problem has been fixed in
version 4.84.2-1.

For the testing distribution (stretch), this problem has been fixed
in version 4.86.2-1.

For the unstable distribution (sid), this problem has been fixed in
version 4.86.2-1.

We recommend that you upgrade your exim4 packages.");
    script_tag(name: "summary",   value: "A local root privilege escalation
vulnerability was found in Exim, Debian's default mail transfer agent, in
configurations using the perl_startup option (Only Exim via
exim4-daemon-heavy enables Perl support).

To address the vulnerability, updated Exim versions clean the complete
execution environment by default, affecting Exim and subprocesses such
as transports calling other programs, and thus may break existing
installations. New configuration options (keep_environment,
add_environment) were introduced to adjust this behavior.

More information can be found in the upstream advisory at
https://www.exim.org/static/doc/CVE-2016-1531.txt");
    script_tag(name: "vuldetect", value: "This check tests the installed software
version using the apt package manager.");
    exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"exim4", ver:"4.80-7+deb7u2", rls_regex:"DEB7.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"exim4-base", ver:"4.80-7+deb7u2", rls_regex:"DEB7.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"exim4-config", ver:"4.80-7+deb7u2", rls_regex:"DEB7.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"exim4-daemon-heavy", ver:"4.80-7+deb7u2", rls_regex:"DEB7.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"exim4-daemon-heavy-dbg", ver:"4.80-7+deb7u2", rls_regex:"DEB7.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"exim4-daemon-light", ver:"4.80-7+deb7u2", rls_regex:"DEB7.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"exim4-daemon-light-dbg", ver:"4.80-7+deb7u2", rls_regex:"DEB7.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"exim4-dbg", ver:"4.80-7+deb7u2", rls_regex:"DEB7.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"exim4-dev", ver:"4.80-7+deb7u2", rls_regex:"DEB7.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"eximon4", ver:"4.80-7+deb7u2", rls_regex:"DEB7.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"exim4", ver:"4.84.2-1", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"exim4-base", ver:"4.84.2-1", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"exim4-config", ver:"4.84.2-1", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"exim4-daemon-heavy", ver:"4.84.2-1", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"exim4-daemon-heavy-dbg", ver:"4.84.2-1", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"exim4-daemon-light", ver:"4.84.2-1", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"exim4-daemon-light-dbg", ver:"4.84.2-1", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"exim4-dbg", ver:"4.84.2-1", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"exim4-dev", ver:"4.84.2-1", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"eximon4", ver:"4.84.2-1", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"exim4", ver:"4.86.2-1", rls_regex:"DEB9.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"exim4-base", ver:"4.86.2-1", rls_regex:"DEB9.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"exim4-config", ver:"4.86.2-1", rls_regex:"DEB9.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"exim4-daemon-heavy", ver:"4.86.2-1", rls_regex:"DEB9.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"exim4-daemon-heavy-dbg", ver:"4.86.2-1", rls_regex:"DEB9.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"exim4-daemon-light", ver:"4.86.2-1", rls_regex:"DEB9.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"exim4-daemon-light-dbg", ver:"4.86.2-1", rls_regex:"DEB9.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"exim4-dbg", ver:"4.86.2-1", rls_regex:"DEB9.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"exim4-dev", ver:"4.86.2-1", rls_regex:"DEB9.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"eximon4", ver:"4.86.2-1", rls_regex:"DEB9.[0-9]+")) != NULL) {
    report += res;
}

if (report != "") {
    security_message(data:report);
} else if (__pkg_match) {
    exit(99); # Not vulnerable.
}
