# OpenVAS Vulnerability Test
# $Id: deb_2269_1.nasl 9351 2018-04-06 07:05:43Z cfischer $
# Description: Auto-generated from advisory DSA 2269-1 (iceape)
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
tag_insight = "Several vulnerabilities have been found in the Iceape internet suite, an
unbranded version of Seamonkey:

CVE-2011-0083 / CVE-2011-2363

regenrecht discovered two use-after-frees in SVG processing,
which could lead to the execution of arbitrary code.

CVE-2011-0085

regenrecht discovered a use-after-free in XUL processing, which
could lead to the execution of arbitrary code.

CVE-2011-2362

David Chan discovered that cookies were insufficiently isolated.

CVE-2011-2371

Chris Rohlf and Yan Ivnitskiy discovered an integer overflow in the
Javascript engine, which could lead to the execution of arbitrary
code.

CVE-2011-2373

Martin Barbella discovered a use-after-free in XUL processing,
which could lead to the execution of arbitrary code.

CVE-2011-2374

Bob Clary, Kevin Brosnan, Nils, Gary Kwong, Jesse Ruderman and
Christian Biesinger discovered memory corruption bugs, which may
lead to the execution of arbitrary code.

CVE-2011-2376

Luke Wagner and Gary Kwong discovered memory corruption bugs, which
may lead to the execution of arbitrary code.


The oldstable distribution (lenny) is not affected. The iceape
package only provides the XPCOM code.

For the stable distribution (squeeze), this problem has been fixed in
version 2.0.11-6.

For the unstable distribution (sid), this problem has been fixed in
version 2.0.14-3.

We recommend that you upgrade your iceape packages.";
tag_summary = "The remote host is missing an update to iceape
announced via advisory DSA 2269-1.";

tag_solution = "https://secure1.securityspace.com/smysecure/catid.html?in=DSA%202269-1";


if(description)
{
 script_oid("1.3.6.1.4.1.25623.1.0.69977");
 script_version("$Revision: 9351 $");
 script_tag(name:"last_modification", value:"$Date: 2018-04-06 09:05:43 +0200 (Fri, 06 Apr 2018) $");
 script_tag(name:"creation_date", value:"2011-08-03 04:36:20 +0200 (Wed, 03 Aug 2011)");
 script_cve_id("CVE-2011-0083", "CVE-2011-0085", "CVE-2011-2362", "CVE-2011-2363", "CVE-2011-2365", "CVE-2011-2371", "CVE-2011-2373", "CVE-2011-2374", "CVE-2011-2376");
 script_tag(name:"cvss_base", value:"10.0");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
 script_name("Debian Security Advisory DSA 2269-1 (iceape)");



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
if ((res = isdpkgvuln(pkg:"iceape", ver:"2.0.11-6", rls:"DEB6.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceape-browser", ver:"2.0.11-6", rls:"DEB6.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceape-chatzilla", ver:"2.0.11-6", rls:"DEB6.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceape-dbg", ver:"2.0.11-6", rls:"DEB6.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceape-dev", ver:"2.0.11-6", rls:"DEB6.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceape-mailnews", ver:"2.0.11-6", rls:"DEB6.0")) != NULL) {
    report += res;
}

if (report != "") {
    security_message(data:report);
} else if (__pkg_match) {
    exit(99); # Not vulnerable.
}
