# OpenVAS Vulnerability Test
# $Id: deb_2233_1.nasl 9351 2018-04-06 07:05:43Z cfischer $
# Description: Auto-generated from advisory DSA 2233-1 (postfix)
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
tag_insight = "Several vulnerabilities were discovered in Postfix, a mail transfer
agent.  The Common Vulnerabilities and Exposures project identifies
the following problems:

CVE-2009-2939
The postinst script grants the postfix user write access to
/var/spool/postfix/pid, which might allow local users to
conduct symlink attacks that overwrite arbitrary files.

CVE-2011-0411
The STARTTLS implementation does not properly restrict I/O
buffering, which allows man-in-the-middle attackers to insert
commands into encrypted SMTP sessions by sending a cleartext
command that is processed after TLS is in place.

CVE-2011-1720
A heap-based read-only buffer overflow allows malicious
clients to crash the smtpd server process using a crafted SASL
authentication request.

For the oldstable distribution (lenny), this problem has been fixed in
version 2.5.5-1.1+lenny1.

For the stable distribution (squeeze), this problem has been fixed in
version 2.7.1-1+squeeze1.

For the unstable distribution (sid), this problem has been fixed in
version 2.8.0-1.

We recommend that you upgrade your postfix packages.";
tag_summary = "The remote host is missing an update to postfix
announced via advisory DSA 2233-1.";

tag_solution = "https://secure1.securityspace.com/smysecure/catid.html?in=DSA%202233-1";


if(description)
{
 script_oid("1.3.6.1.4.1.25623.1.0.69733");
 script_version("$Revision: 9351 $");
 script_tag(name:"last_modification", value:"$Date: 2018-04-06 09:05:43 +0200 (Fri, 06 Apr 2018) $");
 script_tag(name:"creation_date", value:"2011-08-03 04:36:20 +0200 (Wed, 03 Aug 2011)");
 script_tag(name:"cvss_base", value:"6.9");
 script_tag(name:"cvss_base_vector", value:"AV:L/AC:M/Au:N/C:C/I:C/A:C");
 script_cve_id("CVE-2009-2939", "CVE-2011-0411", "CVE-2011-1720");
 script_name("Debian Security Advisory DSA 2233-1 (postfix)");



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
if ((res = isdpkgvuln(pkg:"postfix", ver:"2.5.5-1.1+lenny1", rls:"DEB5.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"postfix-cdb", ver:"2.5.5-1.1+lenny1", rls:"DEB5.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"postfix-dev", ver:"2.5.5-1.1+lenny1", rls:"DEB5.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"postfix-doc", ver:"2.5.5-1.1+lenny1", rls:"DEB5.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"postfix-ldap", ver:"2.5.5-1.1+lenny1", rls:"DEB5.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"postfix-mysql", ver:"2.5.5-1.1+lenny1", rls:"DEB5.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"postfix-pcre", ver:"2.5.5-1.1+lenny1", rls:"DEB5.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"postfix-pgsql", ver:"2.5.5-1.1+lenny1", rls:"DEB5.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"postfix", ver:"2.7.1-1+squeeze1", rls:"DEB6.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"postfix-cdb", ver:"2.7.1-1+squeeze1", rls:"DEB6.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"postfix-dev", ver:"2.7.1-1+squeeze1", rls:"DEB6.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"postfix-doc", ver:"2.7.1-1+squeeze1", rls:"DEB6.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"postfix-ldap", ver:"2.7.1-1+squeeze1", rls:"DEB6.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"postfix-mysql", ver:"2.7.1-1+squeeze1", rls:"DEB6.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"postfix-pcre", ver:"2.7.1-1+squeeze1", rls:"DEB6.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"postfix-pgsql", ver:"2.7.1-1+squeeze1", rls:"DEB6.0")) != NULL) {
    report += res;
}

if (report != "") {
    security_message(data:report);
} else if (__pkg_match) {
    exit(99); # Not vulnerable.
}
