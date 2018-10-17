# OpenVAS Vulnerability Test
# $Id: deb_3476.nasl 8131 2017-12-15 07:30:28Z teissa $
# Auto-generated from advisory DSA 3476-1 using nvtgen 1.0
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
    script_oid("1.3.6.1.4.1.25623.1.0.703476");
    script_version("$Revision: 8131 $");
    script_cve_id("CVE-2016-0766", "CVE-2016-0773");
    script_name("Debian Security Advisory DSA 3476-1 (postgresql-9.4 - security update)");
    script_tag(name: "last_modification", value: "$Date: 2017-12-15 08:30:28 +0100 (Fri, 15 Dec 2017) $");
    script_tag(name: "creation_date", value: "2016-02-13 00:00:00 +0100 (Sat, 13 Feb 2016)");
    script_tag(name:"cvss_base", value:"9.0");
    script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:S/C:C/I:C/A:C");
    script_tag(name: "solution_type", value: "VendorFix");
    script_tag(name: "qod_type", value: "package");

    script_xref(name: "URL", value: "http://www.debian.org/security/2016/dsa-3476.html");


    script_category(ACT_GATHER_INFO);

    script_copyright("Copyright (c) 2016 Greenbone Networks GmbH http://greenbone.net");
    script_family("Debian Local Security Checks");
    script_dependencies("gather-package-list.nasl");
    script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages");
    script_tag(name: "affected",  value: "postgresql-9.4 on Debian Linux");
    script_tag(name: "insight",   value: "PostgreSQL is a fully featured
object-relational database management system. It supports a large part of the SQL
standard and is designed to be extensible by users in many aspects. Some of the
features are: ACID transactions, foreign keys, views, sequences, subqueries,
triggers, user-defined types and functions, outer joins, multiversion
concurrency control. Graphical user interfaces and bindings for many
programming languages are available as well.");
    script_tag(name: "solution",  value: "For the stable distribution (jessie),
these problems have been fixed in version 9.4.6-0+deb8u1.

We recommend that you upgrade your postgresql-9.4 packages.");
    script_tag(name: "summary",   value: "Several vulnerabilities have been
found in PostgreSQL-9.4, a SQL database system.

CVE-2016-0766
A privilege escalation vulnerability for users of PL/Java was
discovered. Certain custom configuration settings (GUCs) for PL/Java
will now be modifiable only by the database superuser to mitigate
this issue.

CVE-2016-0773
Tom Lane and Greg Stark discovered a flaw in the way PostgreSQL
processes specially crafted regular expressions. Very large
character ranges in bracket expressions could cause infinite
loops or memory overwrites. A remote attacker can exploit this
flaw to cause a denial of service or, potentially, to execute
arbitrary code.");
    script_tag(name: "vuldetect", value: "This check tests the installed software
version using the apt package manager.");
    exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"libecpg-compat3", ver:"9.4.6-0+deb8u1", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libecpg-dev", ver:"9.4.6-0+deb8u1", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libecpg6", ver:"9.4.6-0+deb8u1", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libpgtypes3", ver:"9.4.6-0+deb8u1", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libpq-dev", ver:"9.4.6-0+deb8u1", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libpq5", ver:"9.4.6-0+deb8u1", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"postgresql-9.4", ver:"9.4.6-0+deb8u1", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"postgresql-9.4-dbg", ver:"9.4.6-0+deb8u1", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"postgresql-client-9.4", ver:"9.4.6-0+deb8u1", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"postgresql-contrib-9.4", ver:"9.4.6-0+deb8u1", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"postgresql-doc-9.4", ver:"9.4.6-0+deb8u1", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"postgresql-plperl-9.4", ver:"9.4.6-0+deb8u1", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"postgresql-plpython-9.4", ver:"9.4.6-0+deb8u1", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"postgresql-plpython3-9.4", ver:"9.4.6-0+deb8u1", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"postgresql-pltcl-9.4", ver:"9.4.6-0+deb8u1", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"postgresql-server-dev-9.4", ver:"9.4.6-0+deb8u1", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}

if (report != "") {
    security_message(data:report);
} else if (__pkg_match) {
    exit(99); # Not vulnerable.
}
