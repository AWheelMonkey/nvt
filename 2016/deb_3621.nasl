# OpenVAS Vulnerability Test
# $Id: deb_3621.nasl 8131 2017-12-15 07:30:28Z teissa $
# Auto-generated from advisory DSA 3621-1 using nvtgen 1.0
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
    script_oid("1.3.6.1.4.1.25623.1.0.703621");
    script_version("$Revision: 8131 $");
    script_cve_id("CVE-2015-2575");
    script_name("Debian Security Advisory DSA 3621-1 (mysql-connector-java - security update)");
    script_tag(name: "last_modification", value: "$Date: 2017-12-15 08:30:28 +0100 (Fri, 15 Dec 2017) $");
    script_tag(name: "creation_date", value: "2016-07-18 00:00:00 +0200 (Mon, 18 Jul 2016)");
    script_tag(name:"cvss_base", value:"4.9");
    script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:S/C:P/I:P/A:N");
    script_tag(name: "solution_type", value: "VendorFix");
    script_tag(name: "qod_type", value: "package");

    script_xref(name: "URL", value: "http://www.debian.org/security/2016/dsa-3621.html");


    script_category(ACT_GATHER_INFO);

    script_copyright("Copyright (c) 2016 Greenbone Networks GmbH http://greenbone.net");
    script_family("Debian Local Security Checks");
    script_dependencies("gather-package-list.nasl");
    script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages");
    script_tag(name: "affected",  value: "mysql-connector-java on Debian Linux");
    script_tag(name: "solution",  value: "For the stable distribution (jessie),
this problem has been fixed in version 5.1.39-1~deb8u1.

We recommend that you upgrade your mysql-connector-java packages.");
    script_tag(name: "summary",   value: "A vulnerability was discovered in
mysql-connector-java, a Java database (JDBC) driver for MySQL, which may result
in unauthorized update, insert or delete access to some MySQL Connectors
accessible data as well as read access to a subset of MySQL Connectors accessible
data. The vulnerability was addressed by upgrading mysql-connector-java to the new
upstream version 5.1.39, which includes additional changes, such as bug
fixes, new features, and possibly incompatible changes. Please see the
MySQL Connector/J Release Notes and Oracle's Critical Patch Update
advisory for further details:

https://dev.mysql.com/doc/relnotes/connector-j/5.1/en/news-5-1.html
http://www.oracle.com/technetwork/topics/security/cpuapr2015-2365600.html#AppendixMSQL");
    script_tag(name: "vuldetect", value: "This check tests the installed software
version using the apt package manager.");
    exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"libmysql-java", ver:"5.1.39-1~deb8u1", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}

if (report != "") {
    security_message(data:report);
} else if (__pkg_match) {
    exit(99); # Not vulnerable.
}
