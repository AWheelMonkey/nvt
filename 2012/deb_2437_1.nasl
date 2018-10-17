# OpenVAS Vulnerability Test
# $Id: deb_2437_1.nasl 9352 2018-04-06 07:13:02Z cfischer $
# Description: Auto-generated from advisory DSA 2437-1 (icedove)
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
tag_insight = "Several vulnerabilities have been discovered in Icedove, an unbranded
version of the Thunderbird mail/news client.

CVE-2012-0455

Soroush Dalili discovered that a cross-site scripting countermeasure
related to Javascript URLs could be bypassed.

CVE-2012-0456

Atte Kettunen discovered an out of bounds read in the SVG Filters,
resulting in memory disclosure.

CVE-2012-0458

Mariusz Mlynski discovered that privileges could be escalated through
a Javascript URL as the home page.

CVE-2012-0461

Bob Clary discovered memory corruption bugs, which may lead to the
execution of arbitrary code.

For the stable distribution (squeeze), this problem has been fixed in
version icedove 3.0.11-1+squeeze8.

For the unstable distribution (sid), this problem will be fixed soon.

We recommend that you upgrade your icedove packages.";
tag_summary = "The remote host is missing an update to icedove
announced via advisory DSA 2437-1.";

tag_solution = "https://secure1.securityspace.com/smysecure/catid.html?in=DSA%202437-1";

if(description)
{
 script_oid("1.3.6.1.4.1.25623.1.0.71241");
 script_tag(name:"cvss_base", value:"7.5");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
 script_cve_id("CVE-2012-0455", "CVE-2012-0456", "CVE-2012-0458", "CVE-2012-0461");
 script_version("$Revision: 9352 $");
 script_tag(name:"last_modification", value:"$Date: 2018-04-06 09:13:02 +0200 (Fri, 06 Apr 2018) $");
 script_tag(name:"creation_date", value:"2012-04-30 07:54:53 -0400 (Mon, 30 Apr 2012)");
 script_name("Debian Security Advisory DSA 2437-1 (icedove)");



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
if((res = isdpkgvuln(pkg:"icedove", ver:"3.0.11-1+squeeze8", rls:"DEB6.0")) != NULL) {
    report += res;
}
if((res = isdpkgvuln(pkg:"icedove-dbg", ver:"3.0.11-1+squeeze8", rls:"DEB6.0")) != NULL) {
    report += res;
}
if((res = isdpkgvuln(pkg:"icedove-dev", ver:"3.0.11-1+squeeze8", rls:"DEB6.0")) != NULL) {
    report += res;
}

if(report != "") {
    security_message(data:report);
} else if (__pkg_match) {
    exit(99); # Not vulnerable.
}
