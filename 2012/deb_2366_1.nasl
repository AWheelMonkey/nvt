# OpenVAS Vulnerability Test
# $Id: deb_2366_1.nasl 9352 2018-04-06 07:13:02Z cfischer $
# Description: Auto-generated from advisory DSA 2366-1 (mediawiki)
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
tag_insight = "Several problems have been discovered in mediawiki, a website engine for
collaborative work.

CVE-2011-1578 CVE-2011-1587

Masato Kinugawa discovered a cross-site scripting (XSS) issue, which
affects Internet Explorer clients only, and only version 6 and
earlier. Web server configuration changes are required to fix this
issue. Upgrading MediaWiki will only be sufficient for people who use
Apache with AllowOverride enabled.

For details of the required configuration changes, see the upstream
announcements:
http://lists.wikimedia.org/pipermail/mediawiki-announce/2011-April/000096.html
http://lists.wikimedia.org/pipermail/mediawiki-announce/2011-April/000097.html

CVE-2011-1579

Wikipedia user Suffusion of Yellow discovered a CSS validation error
in the wikitext parser. This is an XSS issue for Internet Explorer
clients, and a privacy loss issue for other clients since it allows
the embedding of arbitrary remote images.

CVE-2011-1580

MediaWiki developer Happy-Melon discovered that the transwiki import
feature neglected to perform access control checks on form submission.
The transwiki import feature is disabled by default. If it is enabled,
it allows wiki pages to be copied from a remote wiki listed in
$wgImportSources. The issue means that any user can trigger such an
import to occur.

CVE-2011-4360

Alexandre Emsenhuber discovered an issue where page titles on private
wikis could be exposed bypassing different page ids to index.php. In the
case of the user not having correct permissions, they will now be redirected
to Special:BadTitle.

CVE-2011-4361

Tim Starling discovered that action=ajax requests were dispatched to the
relevant function without any read permission checks being done. This could
have led to data leakage on private wikis.

For the oldstable distribution (lenny), these problems have been fixed in
version 1:1.12.0-2lenny9.

For the stable distribution (squeeze), these problems have been fixed in
version 1:1.15.5-2squeeze2.

For the unstable distribution (sid), these problems have been fixed in
version 1:1.15.5-5.

We recommend that you upgrade your mediawiki packages.";
tag_summary = "The remote host is missing an update to mediawiki
announced via advisory DSA 2366-1.";

tag_solution = "https://secure1.securityspace.com/smysecure/catid.html?in=DSA%202366-1";

if(description)
{
 script_oid("1.3.6.1.4.1.25623.1.0.70578");
 script_tag(name:"cvss_base", value:"5.8");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:N");
 script_cve_id("CVE-2011-1578", "CVE-2011-1579", "CVE-2011-1580", "CVE-2011-1587", "CVE-2011-4360", "CVE-2011-4361");
 script_version("$Revision: 9352 $");
 script_tag(name:"last_modification", value:"$Date: 2018-04-06 09:13:02 +0200 (Fri, 06 Apr 2018) $");
 script_tag(name:"creation_date", value:"2012-02-11 02:34:53 -0500 (Sat, 11 Feb 2012)");
 script_name("Debian Security Advisory DSA 2366-1 (mediawiki)");


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
if((res = isdpkgvuln(pkg:"mediawiki", ver:"1:1.12.0-2lenny9", rls:"DEB5.0")) != NULL) {
    report += res;
}
if((res = isdpkgvuln(pkg:"mediawiki-math", ver:"1:1.12.0-2lenny9", rls:"DEB5.0")) != NULL) {
    report += res;
}
if((res = isdpkgvuln(pkg:"mediawiki", ver:"1:1.15.5-2squeeze2", rls:"DEB6.0")) != NULL) {
    report += res;
}
if((res = isdpkgvuln(pkg:"mediawiki-math", ver:"1:1.15.5-2squeeze2", rls:"DEB6.0")) != NULL) {
    report += res;
}

if(report != "") {
    security_message(data:report);
} else if (__pkg_match) {
    exit(99); # Not vulnerable.
}
