# OpenVAS Vulnerability Test
# $Id: deb_2262_1.nasl 9351 2018-04-06 07:05:43Z cfischer $
# Description: Auto-generated from advisory DSA 2262-1 (moodle)
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
tag_insight = "Several cross-site scripting and information disclosure issues have
been fixed in Moodle, a course management system for online learning:

* MSA-11-0002 Cross-site request forgery vulnerability in RSS block
* MSA-11-0003 Cross-site scripting vulnerability in tag autocomplete
* MSA-11-0008 IMS enterprise enrolment file may disclose sensitive
information
* MSA-11-0011 Multiple cross-site scripting problems in media filter
* MSA-11-0015 Cross Site Scripting through URL encoding
* MSA-11-0013 Group/Quiz permissions issue

For the stable distribution (squeeze), this problem has been fixed in
version 1.9.9.dfsg2-2.1+squeeze1.

For the unstable distribution (sid), this problem has been fixed in
version 1.9.9.dfsg2-3.

We recommend that you upgrade your moodle packages.";
tag_summary = "The remote host is missing an update to moodle
announced via advisory DSA 2262-1.";

tag_solution = "https://secure1.securityspace.com/smysecure/catid.html?in=DSA%202262-1";


if(description)
{
 script_oid("1.3.6.1.4.1.25623.1.0.69967");
 script_version("$Revision: 9351 $");
 script_tag(name:"last_modification", value:"$Date: 2018-04-06 09:05:43 +0200 (Fri, 06 Apr 2018) $");
 script_tag(name:"creation_date", value:"2011-08-03 04:36:20 +0200 (Wed, 03 Aug 2011)");
 script_tag(name:"cvss_base", value:"6.8");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
 script_name("Debian Security Advisory DSA 2262-1 (moodle)");
 script_cve_id("CVE-2011-4133", "CVE-2011-4278", "CVE-2011-4283", "CVE-2011-4286", "CVE-2011-4288", "CVE-2011-4290");

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
if ((res = isdpkgvuln(pkg:"moodle", ver:"1.9.9.dfsg2-2.1+squeeze1", rls:"DEB6.0")) != NULL) {
    report += res;
}

if (report != "") {
    security_message(data:report);
} else if (__pkg_match) {
    exit(99); # Not vulnerable.
}
