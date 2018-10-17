# OpenVAS Vulnerability Test
# $Id: deb_2729.nasl 9353 2018-04-06 07:14:20Z cfischer $
# Auto-generated from advisory DSA 2729-1 using nvtgen 1.0
# Script version: 1.0
#
# Author:
# Greenbone Networks
#
# Copyright:
# Copyright (c) 2013 Greenbone Networks GmbH http://greenbone.net
# Text descriptions are largely excerpted from the referenced
# advisory, and are Copyright (c) the respective author(s)
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.
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

tag_affected  = "openafs on Debian Linux";
tag_insight   = "AFS is a distributed filesystem allowing cross-platform sharing of files
among multiple computers.";
tag_solution  = "For the oldstable distribution (squeeze), these problems have been fixed in
version 1.4.12.1+dfsg-4+squeeze2.

For the stable distribution (wheezy), these problems have been fixed in
version 1.6.1-3+deb7u1.

For the unstable distribution (sid), these problems have been fixed in
version 1.6.5-1.

We recommend that you upgrade your openafs packages.";
tag_summary   = "OpenAFS, the implementation of the distributed filesystem AFS, has been
updated to no longer use DES for the encryption of tickets. Additional
migration steps are needed to fully set the update into effect. For more
information please see the upstream advisory:
OPENAFS-SA-2013-003In addition the encrypt option to the vos 
tool was fixed.";
tag_vuldetect = "This check tests the installed software version using the apt package manager.";

if(description)
{
    script_oid("1.3.6.1.4.1.25623.1.0.892729");
    script_version("$Revision: 9353 $");
    script_cve_id("CVE-2013-4134", "CVE-2013-4135");
    script_name("Debian Security Advisory DSA 2729-1 (openafs - several vulnerabilities)");
    script_tag(name: "last_modification", value:"$Date: 2018-04-06 09:14:20 +0200 (Fri, 06 Apr 2018) $");
    script_tag(name: "creation_date", value:"2013-07-28 00:00:00 +0200 (Sun, 28 Jul 2013)");
    script_tag(name:"cvss_base", value:"4.3");
    script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:N/A:N");

    script_xref(name: "URL", value: "http://www.debian.org/security/2013/dsa-2729.html");


    script_category(ACT_GATHER_INFO);

    script_copyright("Copyright (c) 2013 Greenbone Networks GmbH http://greenbone.net");
    script_family("Debian Local Security Checks");
    script_dependencies("gather-package-list.nasl");
    script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages");
    script_tag(name: "affected",  value: tag_affected);
    script_tag(name: "insight",   value: tag_insight);
#    script_tag(name: "impact",    value: tag_impact);
    script_tag(name: "solution",  value: tag_solution);
    script_tag(name: "summary",   value: tag_summary);
    script_tag(name: "vuldetect", value: tag_vuldetect);
    script_tag(name:"qod_type", value:"package");
    script_tag(name:"solution_type", value:"VendorFix");

    exit(0);
}

include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"libopenafs-dev", ver:"1.4.12.1+dfsg-4+squeeze2", rls:"DEB6.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libpam-openafs-kaserver", ver:"1.4.12.1+dfsg-4+squeeze2", rls:"DEB6.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"openafs-client", ver:"1.4.12.1+dfsg-4+squeeze2", rls:"DEB6.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"openafs-dbg", ver:"1.4.12.1+dfsg-4+squeeze2", rls:"DEB6.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"openafs-dbserver", ver:"1.4.12.1+dfsg-4+squeeze2", rls:"DEB6.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"openafs-doc", ver:"1.4.12.1+dfsg-4+squeeze2", rls:"DEB6.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"openafs-fileserver", ver:"1.4.12.1+dfsg-4+squeeze2", rls:"DEB6.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"openafs-kpasswd", ver:"1.4.12.1+dfsg-4+squeeze2", rls:"DEB6.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"openafs-krb5", ver:"1.4.12.1+dfsg-4+squeeze2", rls:"DEB6.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"openafs-modules-dkms", ver:"1.4.12.1+dfsg-4+squeeze2", rls:"DEB6.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"openafs-modules-source", ver:"1.4.12.1+dfsg-4+squeeze2", rls:"DEB6.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libafsauthent1", ver:"1.6.1-3+deb7u1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libafsrpc1", ver:"1.6.1-3+deb7u1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libkopenafs1", ver:"1.6.1-3+deb7u1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libopenafs-dev", ver:"1.6.1-3+deb7u1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libpam-openafs-kaserver", ver:"1.6.1-3+deb7u1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"openafs-client", ver:"1.6.1-3+deb7u1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"openafs-dbg", ver:"1.6.1-3+deb7u1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"openafs-dbserver", ver:"1.6.1-3+deb7u1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"openafs-doc", ver:"1.6.1-3+deb7u1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"openafs-fileserver", ver:"1.6.1-3+deb7u1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"openafs-fuse", ver:"1.6.1-3+deb7u1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"openafs-kpasswd", ver:"1.6.1-3+deb7u1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"openafs-krb5", ver:"1.6.1-3+deb7u1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"openafs-modules-dkms", ver:"1.6.1-3+deb7u1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"openafs-modules-source", ver:"1.6.1-3+deb7u1", rls:"DEB7.0")) != NULL) {
    report += res;
}

if (report != "") {
    security_message(data:report);
} else if (__pkg_match) {
    exit(99); # Not vulnerable.
}
