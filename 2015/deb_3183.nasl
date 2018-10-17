# OpenVAS Vulnerability Test
# $Id: deb_3183.nasl 9355 2018-04-06 07:16:07Z cfischer $
# Auto-generated from advisory DSA 3183-1 using nvtgen 1.0
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
    script_oid("1.3.6.1.4.1.25623.1.0.703183");
    script_version("$Revision: 9355 $");
    script_cve_id("CVE-2013-2184", "CVE-2014-9057", "CVE-2015-1592");
    script_name("Debian Security Advisory DSA 3183-1 (movabletype-opensource - security update)");
    script_tag(name: "last_modification", value: "$Date: 2018-04-06 09:16:07 +0200 (Fri, 06 Apr 2018) $");
    script_tag(name: "creation_date", value: "2015-03-12 00:00:00 +0100 (Thu, 12 Mar 2015)");
    script_tag(name:"cvss_base", value:"7.5");
    script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
    script_tag(name: "solution_type", value: "VendorFix");

    script_xref(name: "URL", value: "http://www.debian.org/security/2015/dsa-3183.html");


    script_category(ACT_GATHER_INFO);

    script_copyright("Copyright (c) 2015 Greenbone Networks GmbH http://greenbone.net");
    script_family("Debian Local Security Checks");
    script_dependencies("gather-package-list.nasl");
    script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages");
    script_tag(name: "affected",  value: "movabletype-opensource on Debian Linux");
    script_tag(name: "insight",   value: "MovableType is a popular blogging,
or web publishing platform. It provides an easy to use web interface to
publishing blogs and contains many features and plugins.");
    script_tag(name: "solution",  value: "For the stable distribution (wheezy),
these problems have been fixed in version 5.1.4+dfsg-4+deb7u2.

We recommend that you upgrade your movabletype-opensource packages.");
    script_tag(name: "summary",   value: "Multiple vulnerabilities have been
discovered in Movable Type, a blogging system. The Common Vulnerabilities and
Exposures project identifies the following problems:

CVE-2013-2184 
Unsafe use of Storable::thaw in the handling of comments to blog
posts could allow remote attackers to include and execute arbitrary
local Perl files or possibly remotely execute arbitrary code.

CVE-2014-9057 
Netanel Rubin from Check Point Software Technologies discovered a
SQL injection vulnerability in the XML-RPC interface allowing
remote attackers to execute arbitrary SQL commands.

CVE-2015-1592 
The Perl Storable::thaw function is not properly used, allowing
remote attackers to include and execute arbitrary local Perl files
and possibly remotely execute arbitrary code.");
    script_tag(name: "vuldetect", value: "This check tests the installed
software version using the apt package manager.");
    script_tag(name:"qod_type", value:"package");
    exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"movabletype-opensource", ver:"5.1.4+dfsg-4+deb7u2", rls_regex:"DEB7.[0-9]")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"movabletype-plugin-core", ver:"5.1.4+dfsg-4+deb7u2", rls_regex:"DEB7.[0-9]")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"movabletype-plugin-zemanta", ver:"5.1.4+dfsg-4+deb7u2", rls_regex:"DEB7.[0-9]")) != NULL) {
    report += res;
}

if (report != "") {
    security_message(data:report);
} else if (__pkg_match) {
    exit(99); # Not vulnerable.
}
