# OpenVAS Vulnerability Test
# $Id: deb_2235_1.nasl 9351 2018-04-06 07:05:43Z cfischer $
# Description: Auto-generated from advisory DSA 2235-1 (icedove)
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
tag_insight = "Several vulnerabilities have been discovered in Icedove, an unbranded
version of the Thunderbird mail/news client.

CVE-2011-0069 CVE-2011-0070 CVE-2011-0072 CVE-2011-0074 CVE-2011-0075 CVE-2011-0077 CVE-2011-0078 CVE-2011-0080 CVE-2011-0081

Scoobidiver, Ian Beer Bob Clary, Henri Sivonen, Marco Bonardo,
Mats Palmgren, Jesse Ruderman, Aki Kelin and Martin Barbella
discovered memory corruption bugs, which may lead to the execution
of arbitrary code.

CVE-2011-0065 CVE-2011-0066 CVE-2011-0073

regenrecht discovered several dangling pointer vulnerabilities,
which may lead to the execution of arbitrary code.

CVE-2011-0067

Paul Stone discovered that Java applets could steal information
from the autocompletion history.

CVE-2011-0071

Soroush Dalili discovered a directory traversal vulnerability in
handling resource URIs.

As indicated in the Lenny (oldstable) release notes, security support for
the Icedove packages in the oldstable needed to be stopped before the end
of the regular Lenny security maintenance life cycle.
You are strongly encouraged to upgrade to stable or switch to a different
mail client.

For the stable distribution (squeeze), this problem has been fixed in
version 3.0.11-1+squeeze2.

For the unstable distribution (sid), this problem will be fixed soon.

We recommend that you upgrade your icedove packages.";
tag_summary = "The remote host is missing an update to icedove
announced via advisory DSA 2235-1.";

tag_solution = "https://secure1.securityspace.com/smysecure/catid.html?in=DSA%202235-1";


if(description)
{
 script_oid("1.3.6.1.4.1.25623.1.0.69731");
 script_version("$Revision: 9351 $");
 script_tag(name:"last_modification", value:"$Date: 2018-04-06 09:05:43 +0200 (Fri, 06 Apr 2018) $");
 script_tag(name:"creation_date", value:"2011-08-03 04:36:20 +0200 (Wed, 03 Aug 2011)");
 script_cve_id("CVE-2011-0065", "CVE-2011-0066", "CVE-2011-0067", "CVE-2011-0069", "CVE-2011-0070", "CVE-2011-0071", "CVE-2011-0072", "CVE-2011-0073", "CVE-2011-0074", "CVE-2011-0075", "CVE-2011-0077", "CVE-2011-0078", "CVE-2011-0080", "CVE-2011-0081");
 script_tag(name:"cvss_base", value:"10.0");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
 script_name("Debian Security Advisory DSA 2235-1 (icedove)");



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
if ((res = isdpkgvuln(pkg:"icedove", ver:"3.0.11-1+squeeze2", rls:"DEB6.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"icedove-dbg", ver:"3.0.11-1+squeeze2", rls:"DEB6.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"icedove-dev", ver:"3.0.11-1+squeeze2", rls:"DEB6.0")) != NULL) {
    report += res;
}

if (report != "") {
    security_message(data:report);
} else if (__pkg_match) {
    exit(99); # Not vulnerable.
}
