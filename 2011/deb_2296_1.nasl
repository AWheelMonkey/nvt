# OpenVAS Vulnerability Test
# $Id: deb_2296_1.nasl 9351 2018-04-06 07:05:43Z cfischer $
# Description: Auto-generated from advisory DSA 2296-1 (iceweasel)
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
tag_insight = "Several vulnerabilities have been discovered in Iceweasel, a web browser
based on Firefox. The included XULRunner library provides rendering
services for several other applications included in Debian.

CVE-2011-0084

regenrecht discovered that incorrect pointer handling in the SVG
processing code could lead to the execution of arbitrary code.

CVE-2011-2378

regenrecht discovered that incorrect memory management in DOM
processing could lead to the execution of arbitrary code.

CVE-2011-2981

moz_bug_r_a_4 discovered a Chrome privilege escalation
vulnerability in the event handler code.

CVE-2011-2982

Gary Kwong, Igor Bukanov, Nils and Bob Clary discovered memory
corruption bugs, which may lead to the execution of arbitrary code.

CVE-2011-2983

shutdown discovered an information leak in the handling of
RegExp.input.

CVE-2011-2984

moz_bug_r_a4 discovered a Chrome privilege escalation vulnerability.


For the oldstable distribution (lenny), this problem has been fixed in
version 1.9.0.19-13 of the xulrunner source package.

For the stable distribution (squeeze), this problem has been fixed in
version 3.5.16-9.

For the unstable distribution (sid), this problem has been fixed in
version 6.0-1

We recommend that you upgrade your iceweasel packages.";
tag_summary = "The remote host is missing an update to iceweasel
announced via advisory DSA 2296-1.";

tag_solution = "https://secure1.securityspace.com/smysecure/catid.html?in=DSA%202296-1";


if(description)
{
 script_oid("1.3.6.1.4.1.25623.1.0.70231");
 script_version("$Revision: 9351 $");
 script_tag(name:"last_modification", value:"$Date: 2018-04-06 09:05:43 +0200 (Fri, 06 Apr 2018) $");
 script_tag(name:"creation_date", value:"2011-09-21 05:47:11 +0200 (Wed, 21 Sep 2011)");
 script_tag(name:"cvss_base", value:"10.0");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
 script_cve_id("CVE-2011-0084", "CVE-2011-2378", "CVE-2011-2981", "CVE-2011-2982", "CVE-2011-2983", "CVE-2011-2984");
 script_name("Debian Security Advisory DSA 2296-1 (iceweasel)");



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
if ((res = isdpkgvuln(pkg:"iceweasel", ver:"3.5.16-9", rls:"DEB6.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-dbg", ver:"3.5.16-9", rls:"DEB6.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libmozjs-dev", ver:"1.9.1.16-9", rls:"DEB6.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libmozjs2d", ver:"1.9.1.16-9", rls:"DEB6.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libmozjs2d-dbg", ver:"1.9.1.16-9", rls:"DEB6.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"spidermonkey-bin", ver:"1.9.1.16-9", rls:"DEB6.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"xulrunner-1.9.1", ver:"1.9.1.16-9", rls:"DEB6.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"xulrunner-1.9.1-dbg", ver:"1.9.1.16-9", rls:"DEB6.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"xulrunner-dev", ver:"1.9.1.16-9", rls:"DEB6.0")) != NULL) {
    report += res;
}

if (report != "") {
    security_message(data:report);
} else if (__pkg_match) {
    exit(99); # Not vulnerable.
}
