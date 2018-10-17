###############################################################################
# OpenVAS Vulnerability Test
# $Id: deb_4046.nasl 8247 2017-12-26 13:32:16Z cfischer $
#
# Auto-generated from advisory DSA 4046-1 using nvtgen 1.0
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
  script_oid("1.3.6.1.4.1.25623.1.0.704046");
  script_version("$Revision: 8247 $");
  script_cve_id("CVE-2017-8028");
  script_name("Debian Security Advisory DSA 4046-1 (libspring-ldap-java - security update)");
  script_tag(name:"last_modification", value:"$Date: 2017-12-26 14:32:16 +0100 (Tue, 26 Dec 2017) $");
  script_tag(name:"creation_date", value:"2017-11-22 00:00:00 +0100 (Wed, 22 Nov 2017)");
  script_tag(name:"cvss_base", value:"5.1");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:H/Au:N/C:P/I:P/A:P");
  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"package");

  script_xref(name:"URL", value:"https://www.debian.org/security/2017/dsa-4046.html");

  script_category(ACT_GATHER_INFO);

  script_copyright("Copyright (c) 2017 Greenbone Networks GmbH http://greenbone.net");
  script_family("Debian Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages");
  script_tag(name:"affected", value:"libspring-ldap-java on Debian Linux");
  script_tag(name:"insight", value:"Spring LDAP is built on the same principles as the JdbcTemplate in Spring
JDBC. It completely eliminates the need to worry about creating and closing
LdapContext and looping through NamingEnumeration. It also provides a
more comprehensive unchecked Exception hierarchy, built on Spring's
DataAccessException. As a bonus, it also contains classes for dynamically
building LDAP filters and DNs (Distinguished Names), LDAP attribute
management, and client-side LDAP transaction management.");
  script_tag(name:"solution", value:"For the oldstable distribution (jessie), this problem has been fixed
in version 1.3.1.RELEASE-5+deb8u1.

We recommend that you upgrade your libspring-ldap-java packages.

For the detailed security status of libspring-ldap-java please refer to
its security tracker page at:
https://security-tracker.debian.org/tracker/libspring-ldap-java");
  script_tag(name:"summary",  value:"Tobias Schneider discovered that libspring-ldap-java, a Java library
for Spring-based applications using the Lightweight Directory Access
Protocol, would under some circumstances allow authentication with a
correct username but an arbitrary password.");
  script_tag(name:"vuldetect", value:"This check tests the installed software version using the apt package manager.");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"libspring-ldap-java", ver:"1.3.1.RELEASE-5+deb8u1", rls_regex:"DEB8.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libspring-ldap-java-doc", ver:"1.3.1.RELEASE-5+deb8u1", rls_regex:"DEB8.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}

if (report != "") {
  security_message(data:report);
} else if (__pkg_match) {
  exit(99); # Not vulnerable.
}
