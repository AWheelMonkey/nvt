# OpenVAS Vulnerability Test
# $Id: esoft_slk_ssa_2007_085_01.nasl 8671 2018-02-05 16:38:48Z teissa $
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
tag_insight = "New mozilla-firefox packages are available for Slackware 10.2, 11.0,
and -current to fix security issues.

Note that firefox-1.5.x will reach end-of-life next month, so upgrading
to the 2.x branch soon is probably a good idea.

- From http://developer.mozilla.org/devnews/index.php/2007/03/
'Note: Firefox 1.5.0.x will be maintained with security and stability
updates until April 24, 2007. All users are encouraged to upgrade
to Firefox 2.'

Since Slackware packages the official Firefox binaries, the Firefox 2
packages in Slackware 11.0 and -current should run on many earlier
Slackware versions as well, though there are some known problems with
plugins (such as gxine).";
tag_summary = "The remote host is missing an update as announced
via advisory SSA:2007-085-01.";

tag_solution = "https://secure1.securityspace.com/smysecure/catid.html?in=SSA:2007-085-01";
                                                                                
if(description)
{
 script_oid("1.3.6.1.4.1.25623.1.0.58163");
 script_tag(name:"creation_date", value:"2012-09-11 01:34:21 +0200 (Tue, 11 Sep 2012)");
 script_tag(name:"last_modification", value:"$Date: 2018-02-05 17:38:48 +0100 (Mon, 05 Feb 2018) $");
 script_tag(name:"cvss_base", value:"5.8");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:N");
 script_version("$Revision: 8671 $");
 name = "Slackware Advisory SSA:2007-085-01 mozilla-firefox ";
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
if(isslkpkgvuln(pkg:"mozilla-firefox", ver:"1.5.0.11-i686-1", rls:"SLK10.2")) {
    vuln = 1;
}
if(isslkpkgvuln(pkg:"mozilla-firefox", ver:"2.0.0.3-i686-1", rls:"SLK11.0")) {
    vuln = 1;
}

if(vuln) {
    security_message(0);
} else if (__pkg_match) {
    exit(99); # Not vulnerable.
}
