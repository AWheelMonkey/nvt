# OpenVAS Vulnerability Test
# $Id: deb_2263_1.nasl 9351 2018-04-06 07:05:43Z cfischer $
# Description: Auto-generated from advisory DSA 2263-1 (movabletype-opensource)
#
# Authors:
# Thomas Reinke <reinke@securityspace.com>
#
# Copyright:
# Copyright (c) 2011 E-Soft Inc. http://www.securityspace.com
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
tag_insight = "It was discovered that Movable Type, a weblog publishing system,
contains several security vulnerabilities:

A remote attacker could execute arbitrary code in a logged-in users'
web browser.

A remote attacker could read or modify the contents in the system
under certain circumstances.

For the oldstable distribution (lenny), no update is available at this
time.

For the stable distribution (squeeze), these problems have been fixed in
version 4.3.5+dfsg-2+squeeze2.

For the testing distribution (wheezy) and for the unstable
distribution (sid), these problems have been fixed in version
4.3.6.1+dfsg-1.

We recommend that you upgrade your movabletype-opensource packages.";
tag_summary = "The remote host is missing an update to movabletype-opensource
announced via advisory DSA 2263-1.";

tag_solution = "https://secure1.securityspace.com/smysecure/catid.html?in=DSA%202263-1";


if(description)
{
 script_oid("1.3.6.1.4.1.25623.1.0.69969");
 script_version("$Revision: 9351 $");
 script_tag(name:"last_modification", value:"$Date: 2018-04-06 09:05:43 +0200 (Fri, 06 Apr 2018) $");
 script_tag(name:"creation_date", value:"2011-08-03 04:36:20 +0200 (Wed, 03 Aug 2011)");
 script_tag(name:"cvss_base", value:"9.3");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
 script_name("Debian Security Advisory DSA 2263-1 (movabletype-opensource)");



 script_category(ACT_GATHER_INFO);

 script_copyright("Copyright (c) 2011 E-Soft Inc. http://www.securityspace.com");
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
if ((res = isdpkgvuln(pkg:"movabletype-opensource", ver:"4.3.5+dfsg-2+squeeze2", rls:"DEB6.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"movabletype-plugin-core", ver:"4.3.5+dfsg-2+squeeze2", rls:"DEB6.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"movabletype-plugin-zemanta", ver:"4.3.5+dfsg-2+squeeze2", rls:"DEB6.0")) != NULL) {
    report += res;
}

if (report != "") {
    security_message(data:report);
} else if (__pkg_match) {
    exit(99); # Not vulnerable.
}
