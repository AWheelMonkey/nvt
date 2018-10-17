# OpenVAS Vulnerability Test
# $Id: deb_2480_1.nasl 9352 2018-04-06 07:13:02Z cfischer $
# Description: Auto-generated from advisory DSA 2480-1 (request-tracker3.8)
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
tag_insight = "Several vulnerabilities were discovered in Request Tracker, an issue
tracking system:

CVE-2011-2082

The vulnerable-passwords scripts introduced for CVE-2011-0009
failed to correct the password hashes of disabled users.

CVE-2011-2083

Several cross-site scripting issues have been discovered.

CVE-2011-2084

Password hashes could be disclosed by privileged users.

CVE-2011-2085

Several cross-site request forgery vulnerabilities have been
found. If this update breaks your setup, you can restore the old
behaviour by setting $RestrictReferrer to 0.

CVE-2011-4458

The code to support variable envelope return paths allowed the
execution of arbitrary code.

CVE-2011-4459

Disabled groups were not fully accounted as disabled.

CVE-2011-4460

SQL injection vulnerability, only exploitable by privileged users.


For the stable distribution (squeeze), this problem has been fixed in
version 3.8.8-7+squeeze2.

For the unstable distribution (sid), this problem has been fixed in
version 4.0.5-3.

We recommend that you upgrade your request-tracker3.8 packages.";
tag_summary = "The remote host is missing an update to request-tracker3.8
announced via advisory DSA 2480-1.";

tag_solution = "https://secure1.securityspace.com/smysecure/catid.html?in=DSA%202480-1";

if(description)
{
 script_oid("1.3.6.1.4.1.25623.1.0.71358");
 script_tag(name:"cvss_base", value:"6.8");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
 script_cve_id("CVE-2011-2082", "CVE-2011-2083", "CVE-2011-2084", "CVE-2011-2085", "CVE-2011-4458", "CVE-2011-4459", "CVE-2011-4460", "CVE-2011-0009");
 script_version("$Revision: 9352 $");
 script_tag(name:"last_modification", value:"$Date: 2018-04-06 09:13:02 +0200 (Fri, 06 Apr 2018) $");
 script_tag(name:"creation_date", value:"2012-05-31 11:52:03 -0400 (Thu, 31 May 2012)");
 script_name("Debian Security Advisory DSA 2480-1 (request-tracker3.8)");



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
if((res = isdpkgvuln(pkg:"request-tracker3.8", ver:"3.8.8-7+squeeze3", rls:"DEB6.0")) != NULL) {
    report += res;
}
if((res = isdpkgvuln(pkg:"rt3.8-apache2", ver:"3.8.8-7+squeeze3", rls:"DEB6.0")) != NULL) {
    report += res;
}
if((res = isdpkgvuln(pkg:"rt3.8-clients", ver:"3.8.8-7+squeeze3", rls:"DEB6.0")) != NULL) {
    report += res;
}
if((res = isdpkgvuln(pkg:"rt3.8-db-mysql", ver:"3.8.8-7+squeeze3", rls:"DEB6.0")) != NULL) {
    report += res;
}
if((res = isdpkgvuln(pkg:"rt3.8-db-postgresql", ver:"3.8.8-7+squeeze3", rls:"DEB6.0")) != NULL) {
    report += res;
}
if((res = isdpkgvuln(pkg:"rt3.8-db-sqlite", ver:"3.8.8-7+squeeze3", rls:"DEB6.0")) != NULL) {
    report += res;
}

if(report != "") {
    security_message(data:report);
} else if (__pkg_match) {
    exit(99); # Not vulnerable.
}
