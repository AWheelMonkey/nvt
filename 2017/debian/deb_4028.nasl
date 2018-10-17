###############################################################################
# OpenVAS Vulnerability Test
# $Id: deb_4028.nasl 8149 2017-12-15 14:58:09Z cfischer $
#
# Auto-generated from advisory DSA 4028-1 using nvtgen 1.0
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
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
###############################################################################

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.704028");
  script_version("$Revision: 8149 $");
  script_cve_id("CVE-2017-15098", "CVE-2017-15099");
  script_name("Debian Security Advisory DSA 4028-1 (postgresql-9.6 - security update)");
  script_tag(name:"last_modification", value:"$Date: 2017-12-15 15:58:09 +0100 (Fri, 15 Dec 2017) $");
  script_tag(name:"creation_date", value:"2017-11-09 00:00:00 +0100 (Thu, 09 Nov 2017)");
  script_tag(name:"cvss_base", value:"5.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:S/C:P/I:N/A:P");
  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"package");

  script_xref(name:"URL", value:"https://www.debian.org/security/2017/dsa-4028.html");

  script_category(ACT_GATHER_INFO);

  script_copyright("Copyright (c) 2017 Greenbone Networks GmbH http://greenbone.net");
  script_family("Debian Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages");
  script_tag(name:"affected", value:"postgresql-9.6 on Debian Linux");
  script_tag(name:"insight", value:"PostgreSQL is a powerful, open source object-relational database
system. It is fully ACID compliant, has full support for foreign
keys, joins, views, triggers, and stored procedures (in multiple
languages). It includes most SQL:2008 data types, including INTEGER,
NUMERIC, BOOLEAN, CHAR, VARCHAR, DATE, INTERVAL, and TIMESTAMP. It
also supports storage of binary large objects, including pictures,
sounds, or video. It has native programming interfaces for C/C++,
Java, .Net, Perl, Python, Ruby, Tcl, ODBC, among others, and
exceptional documentation.");
  script_tag(name:"solution", value:"For the stable distribution (stretch), these problems have been fixed in
version 9.6.6-0+deb9u1.

We recommend that you upgrade your postgresql-9.6 packages.");
  script_tag(name:"summary",  value:"Several vulnerabilities have been found in the PostgreSQL database system:

CVE-2017-15098 
Denial of service and potential memory disclosure in the
json_populate_recordset() and jsonb_populate_recordset() functions

CVE-2017-15099Insufficient permissions checks in INSERT ... ON CONFLICT DO UPDATE 

statements.");
  script_tag(name:"vuldetect", value:"This check tests the installed software version using the apt package manager.");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"libecpg-compat3", ver:"9.6.6-0+deb9u1", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libecpg-dev", ver:"9.6.6-0+deb9u1", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libecpg6", ver:"9.6.6-0+deb9u1", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libpgtypes3", ver:"9.6.6-0+deb9u1", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libpq-dev", ver:"9.6.6-0+deb9u1", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libpq5", ver:"9.6.6-0+deb9u1", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"postgresql-9.6", ver:"9.6.6-0+deb9u1", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"postgresql-9.6-dbg", ver:"9.6.6-0+deb9u1", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"postgresql-client-9.6", ver:"9.6.6-0+deb9u1", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"postgresql-contrib-9.6", ver:"9.6.6-0+deb9u1", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"postgresql-doc-9.6", ver:"9.6.6-0+deb9u1", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"postgresql-plperl-9.6", ver:"9.6.6-0+deb9u1", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"postgresql-plpython-9.6", ver:"9.6.6-0+deb9u1", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"postgresql-plpython3-9.6", ver:"9.6.6-0+deb9u1", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"postgresql-pltcl-9.6", ver:"9.6.6-0+deb9u1", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"postgresql-server-dev-9.6", ver:"9.6.6-0+deb9u1", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}

if (report != "") {
  security_message(data:report);
} else if (__pkg_match) {
  exit(99); # Not vulnerable.
}
