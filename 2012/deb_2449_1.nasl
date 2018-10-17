# OpenVAS Vulnerability Test
# $Id: deb_2449_1.nasl 9352 2018-04-06 07:13:02Z cfischer $
# Description: Auto-generated from advisory DSA 2449-1 (sqlalchemy)
#
# Authors:
# Thomas Reinke <reinke@securityspace.com>
#
# Copyright:
# Copyright (c) 2012 E-Soft Inc. http://www.securityspace.com
# Text descriptions are largely excerpted from the referenced
# advisory, and are Copyright (c) the respective author(s)
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 2,
# or at your option, GNU General Public License version 3,
# as published by the Free Software Foundation
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

include("revisions-lib.inc");
tag_insight = "It was discovered that sqlalchemy, an SQL toolkit and object relational
mapper for python, is not sanitizing input passed to the limit/offset
keywords to select() as well as the value passed to select.limit()/offset().
This allows an attacker to perform SQL injection attacks against
applications using sqlalchemy that do not implement their own filtering.

For the stable distribution (squeeze), this problem has been fixed in
version 0.6.3-3+squeeze1.

For the testing distribution (wheezy), this problem has been fixed in
version 0.6.7-1.

For the unstable distribution (sid), this problem has been fixed in
version 0.6.7-1.

We recommend that you upgrade your sqlalchemy packages.";
tag_summary = "The remote host is missing an update to sqlalchemy
announced via advisory DSA 2449-1.";

tag_solution = "https://secure1.securityspace.com/smysecure/catid.html?in=DSA%202449-1";

if(description)
{
 script_oid("1.3.6.1.4.1.25623.1.0.71253");
 script_cve_id("CVE-2012-0805");
 script_tag(name:"cvss_base", value:"7.5");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
 script_version("$Revision: 9352 $");
 script_tag(name:"last_modification", value:"$Date: 2018-04-06 09:13:02 +0200 (Fri, 06 Apr 2018) $");
 script_tag(name:"creation_date", value:"2012-04-30 07:56:14 -0400 (Mon, 30 Apr 2012)");
 script_name("Debian Security Advisory DSA 2449-1 (sqlalchemy)");



 script_category(ACT_GATHER_INFO);

 script_copyright("Copyright (c) 2012 E-Soft Inc. http://www.securityspace.com");
 script_family("Debian Local Security Checks");
 script_dependencies("gather-package-list.nasl");
 script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages");
 script_tag(name : "solution" , value : tag_solution);
 script_tag(name : "insight" , value : tag_insight);
 script_tag(name : "summary" , value : tag_summary);
 script_tag(name:"qod_type", value:"package");
 script_tag(name:"solution_type", value:"VendorFix");
 exit(0);
}

#
# The script code starts here
#

include("pkg-lib-deb.inc");
res = "";
report = "";
if((res = isdpkgvuln(pkg:"python-sqlalchemy", ver:"0.6.3-3+squeeze1", rls:"DEB6.0")) != NULL) {
    report += res;
}
if((res = isdpkgvuln(pkg:"python-sqlalchemy-doc", ver:"0.6.3-3+squeeze1", rls:"DEB6.0")) != NULL) {
    report += res;
}
if((res = isdpkgvuln(pkg:"python-sqlalchemy-ext", ver:"0.6.3-3+squeeze1", rls:"DEB6.0")) != NULL) {
    report += res;
}
if((res = isdpkgvuln(pkg:"python3-sqlalchemy", ver:"0.6.3-3+squeeze1", rls:"DEB6.0")) != NULL) {
    report += res;
}
if((res = isdpkgvuln(pkg:"python-sqlalchemy", ver:"0.7.6-1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if((res = isdpkgvuln(pkg:"python-sqlalchemy-doc", ver:"0.7.6-1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if((res = isdpkgvuln(pkg:"python-sqlalchemy-ext", ver:"0.7.6-1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if((res = isdpkgvuln(pkg:"python3-sqlalchemy", ver:"0.7.6-1", rls:"DEB7.0")) != NULL) {
    report += res;
}

if(report != "") {
    security_message(data:report);
} else if (__pkg_match) {
    exit(99); # Not vulnerable.
}
