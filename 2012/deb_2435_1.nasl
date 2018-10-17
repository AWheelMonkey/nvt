# OpenVAS Vulnerability Test
# $Id: deb_2435_1.nasl 9352 2018-04-06 07:13:02Z cfischer $
# Description: Auto-generated from advisory DSA 2435-1 (gnash)
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
tag_insight = "Several vulnerabilities have been identified in Gnash, the GNU Flash
player.

CVE-2012-1175

Tielei Wang from Georgia Tech Information Security Center discovered a
vulnerability in GNU Gnash which is due to an integer overflow
error and can be exploited to cause a heap-based buffer overflow by
tricking a user into opening a specially crafted SWF file.

CVE-2011-4328

Alexander Kurtz discovered an unsafe management of HTTP cookies. Cookie
files are stored under /tmp and have predictable names, vulnerability
that allows a local attacker to overwrite arbitrary files the users has
write permissions for, and are also world-readable which may cause
information leak.

CVE-2010-4337

Jakub Wilk discovered an unsafe management of temporary files during the
build process. Files are stored under /tmp and have predictable names,
vulnerability that allows a local attacker to overwrite arbitrary files
the users has write permissions for.

For the stable distribution (squeeze), this problem has been fixed in
version 0.8.8-5+squeeze1.

For the unstable distribution (sid), this problem has been fixed in
version 0.8.10-5.

We recommend that you upgrade your gnash packages.";
tag_summary = "The remote host is missing an update to gnash
announced via advisory DSA 2435-1.";

tag_solution = "https://secure1.securityspace.com/smysecure/catid.html?in=DSA%202435-1";

if(description)
{
 script_oid("1.3.6.1.4.1.25623.1.0.71240");
 script_tag(name:"cvss_base", value:"6.8");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
 script_cve_id("CVE-2010-4337", "CVE-2011-4328", "CVE-2012-1175");
 script_version("$Revision: 9352 $");
 script_tag(name:"last_modification", value:"$Date: 2018-04-06 09:13:02 +0200 (Fri, 06 Apr 2018) $");
 script_tag(name:"creation_date", value:"2012-04-30 07:54:49 -0400 (Mon, 30 Apr 2012)");
 script_name("Debian Security Advisory DSA 2435-1 (gnash)");



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
if((res = isdpkgvuln(pkg:"browser-plugin-gnash", ver:"0.8.8-5+squeeze1", rls:"DEB6.0")) != NULL) {
    report += res;
}
if((res = isdpkgvuln(pkg:"gnash", ver:"0.8.8-5+squeeze1", rls:"DEB6.0")) != NULL) {
    report += res;
}
if((res = isdpkgvuln(pkg:"gnash-common", ver:"0.8.8-5+squeeze1", rls:"DEB6.0")) != NULL) {
    report += res;
}
if((res = isdpkgvuln(pkg:"gnash-common-opengl", ver:"0.8.8-5+squeeze1", rls:"DEB6.0")) != NULL) {
    report += res;
}
if((res = isdpkgvuln(pkg:"gnash-cygnal", ver:"0.8.8-5+squeeze1", rls:"DEB6.0")) != NULL) {
    report += res;
}
if((res = isdpkgvuln(pkg:"gnash-dbg", ver:"0.8.8-5+squeeze1", rls:"DEB6.0")) != NULL) {
    report += res;
}
if((res = isdpkgvuln(pkg:"gnash-doc", ver:"0.8.8-5+squeeze1", rls:"DEB6.0")) != NULL) {
    report += res;
}
if((res = isdpkgvuln(pkg:"gnash-opengl", ver:"0.8.8-5+squeeze1", rls:"DEB6.0")) != NULL) {
    report += res;
}
if((res = isdpkgvuln(pkg:"gnash-tools", ver:"0.8.8-5+squeeze1", rls:"DEB6.0")) != NULL) {
    report += res;
}
if((res = isdpkgvuln(pkg:"klash", ver:"0.8.8-5+squeeze1", rls:"DEB6.0")) != NULL) {
    report += res;
}
if((res = isdpkgvuln(pkg:"klash-opengl", ver:"0.8.8-5+squeeze1", rls:"DEB6.0")) != NULL) {
    report += res;
}
if((res = isdpkgvuln(pkg:"konqueror-plugin-gnash", ver:"0.8.8-5+squeeze1", rls:"DEB6.0")) != NULL) {
    report += res;
}
if((res = isdpkgvuln(pkg:"mozilla-plugin-gnash", ver:"0.8.8-5+squeeze1", rls:"DEB6.0")) != NULL) {
    report += res;
}
if((res = isdpkgvuln(pkg:"swfdec-gnome", ver:"1:0.8.8-5+squeeze1", rls:"DEB6.0")) != NULL) {
    report += res;
}
if((res = isdpkgvuln(pkg:"swfdec-mozilla", ver:"0.8.8-5+squeeze1", rls:"DEB6.0")) != NULL) {
    report += res;
}

if(report != "") {
    security_message(data:report);
} else if (__pkg_match) {
    exit(99); # Not vulnerable.
}
