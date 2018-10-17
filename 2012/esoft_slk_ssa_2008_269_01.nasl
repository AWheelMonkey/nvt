# OpenVAS Vulnerability Test
# $Id: esoft_slk_ssa_2008_269_01.nasl 9352 2018-04-06 07:13:02Z cfischer $
# Description: Auto-generated from the corresponding slackware advisory
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
tag_insight = "New mozilla-firefox packages are available for Slackware 10.2, 11.0, 12.0,
12.1, and -current to fix security issues.

More details about the issues may be found on the Mozilla site:

http://www.mozilla.org/security/known-vulnerabilities/firefox20.html";
tag_summary = "The remote host is missing an update as announced
via advisory SSA:2008-269-01.";

tag_solution = "https://secure1.securityspace.com/smysecure/catid.html?in=SSA:2008-269-01";
                                                                                
if(description)
{
 script_oid("1.3.6.1.4.1.25623.1.0.61675");
 script_tag(name:"creation_date", value:"2012-09-11 01:34:21 +0200 (Tue, 11 Sep 2012)");
 script_tag(name:"last_modification", value:"$Date: 2018-04-06 09:13:02 +0200 (Fri, 06 Apr 2018) $");
 script_version("$Revision: 9352 $");
 script_cve_id("CVE-2008-0016", "CVE-2008-3835", "CVE-2008-3836", "CVE-2008-3837",
               "CVE-2008-4058", "CVE-2008-4059", "CVE-2008-4060", "CVE-2008-4061",
               "CVE-2008-4062", "CVE-2008-4065", "CVE-2008-4066", "CVE-2008-4067",
               "CVE-2008-4068", "CVE-2008-4069");
 script_bugtraq_id(31397, 31346);
 script_tag(name:"cvss_base", value:"10.0");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
 name = "Slackware Advisory SSA:2008-269-01 mozilla-firefox ";
 script_name(name);



 script_category(ACT_GATHER_INFO);

 script_copyright("Copyright (c) 2012 E-Soft Inc. http://www.securityspace.com");
 script_family("Slackware Local Security Checks");
 script_dependencies("gather-package-list.nasl");
 script_mandatory_keys("ssh/login/slackware_linux", "ssh/login/slackpack");
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

include("pkg-lib-slack.inc");
vuln = 0;
if(isslkpkgvuln(pkg:"mozilla-firefox", ver:"2.0.0.17-i686-1", rls:"SLK10.2")) {
    vuln = 1;
}
if(isslkpkgvuln(pkg:"mozilla-firefox", ver:"2.0.0.17-i686-1", rls:"SLK11.0")) {
    vuln = 1;
}
if(isslkpkgvuln(pkg:"mozilla-firefox", ver:"2.0.0.17-i686-1", rls:"SLK12.0")) {
    vuln = 1;
}
if(isslkpkgvuln(pkg:"mozilla-firefox", ver:"2.0.0.17-i686-1", rls:"SLK12.1")) {
    vuln = 1;
}

if(vuln) {
    security_message(0);
} else if (__pkg_match) {
    exit(99); # Not vulnerable.
}
