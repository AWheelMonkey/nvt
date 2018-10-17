###############################################################################
# OpenVAS Vulnerability Test
# $Id: deb_4135.nasl 9543 2018-04-20 01:56:24Z ckuersteiner $
#
# Auto-generated from advisory DSA 4135-1 using nvtgen 1.0
# Script version: 1.0
#
# Author:
# Greenbone Networks
#
# Copyright:
# Copyright (c) 2018 Greenbone Networks GmbH http://greenbone.net
# Text descriptions are largely excerpted from the referenced
# advisory, and are Copyright (c) the respective author(s)
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
###############################################################################

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.704135");
  script_version("$Revision: 9543 $");
  script_cve_id("CVE-2018-1050", "CVE-2018-1057");
  script_name("Debian Security Advisory DSA 4135-1 (samba - security update)");
  script_tag(name:"last_modification", value:"$Date: 2018-04-20 03:56:24 +0200 (Fri, 20 Apr 2018) $");
  script_tag(name:"creation_date", value:"2018-03-13 00:00:00 +0100 (Tue, 13 Mar 2018)");
  script_tag(name:"cvss_base", value:"6.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:S/C:P/I:P/A:P");
  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"package");

  script_xref(name:"URL", value:"https://www.debian.org/security/2018/dsa-4135.html");

  script_category(ACT_GATHER_INFO);

  script_copyright("Copyright (c) 2018 Greenbone Networks GmbH http://greenbone.net");
  script_family("Debian Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages");
  script_tag(name:"affected", value:"samba on Debian Linux");
  script_tag(name:"insight", value:"Samba is an implementation of the SMB/CIFS protocol for Unix systems,
providing support for cross-platform file and printer sharing with
Microsoft Windows, OS X, and other Unix systems. Samba can also function
as an NT4-style domain controller, and can integrate with both NT4 domains
and Active Directory realms as a member server.");
  script_tag(name:"solution", value:"For the oldstable distribution (jessie), CVE-2018-1050 will be addressed
in a later update. Unfortunately the changes required to fix
CVE-2018-1057 for Debian oldstable are too invasive to be backported.
Users using Samba as an AD-compatible domain controller are encouraged
to apply the workaround described in the Samba wiki and upgrade to
Debian stretch.

For the stable distribution (stretch), these problems have been fixed in
version 2:4.5.12+dfsg-2+deb9u2.

We recommend that you upgrade your samba packages.

For the detailed security status of samba please refer to its security
tracker page at:
https://security-tracker.debian.org/tracker/samba");
  script_tag(name:"summary",  value:"Several vulnerabilities have been discovered in Samba, a SMB/CIFS file,
print, and login server for Unix. The Common Vulnerabilities and
Exposures project identifies the following issues:

CVE-2018-1050 
It was discovered that Samba is prone to a denial of service
attack when the RPC spoolss service is configured to be run as an
external daemon.

https://www.samba.org/samba/security/CVE-2018-1050.htmlCVE-2018-1057 
Bjoern Baumbach from Sernet discovered that on Samba 4 AD DC the
LDAP server incorrectly validates permissions to modify passwords
over LDAP allowing authenticated users to change any other users
passwords, including administrative users.

https://www.samba.org/samba/security/CVE-2018-1057.htmlhttps://wiki.samba.org/index.php/CVE-2018-1057");
  script_tag(name:"vuldetect", value:"This check tests the installed software version using the apt package manager.");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"ctdb", ver:"2:4.5.12+dfsg-2+deb9u2", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libnss-winbind", ver:"2:4.5.12+dfsg-2+deb9u2", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libpam-winbind", ver:"2:4.5.12+dfsg-2+deb9u2", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libparse-pidl-perl", ver:"2:4.5.12+dfsg-2+deb9u2", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libsmbclient", ver:"2:4.5.12+dfsg-2+deb9u2", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libsmbclient-dev", ver:"2:4.5.12+dfsg-2+deb9u2", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libwbclient-dev", ver:"2:4.5.12+dfsg-2+deb9u2", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libwbclient0", ver:"2:4.5.12+dfsg-2+deb9u2", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"python-samba", ver:"2:4.5.12+dfsg-2+deb9u2", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"registry-tools", ver:"2:4.5.12+dfsg-2+deb9u2", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"samba", ver:"2:4.5.12+dfsg-2+deb9u2", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"samba-common", ver:"2:4.5.12+dfsg-2+deb9u2", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"samba-common-bin", ver:"2:4.5.12+dfsg-2+deb9u2", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"samba-dev", ver:"2:4.5.12+dfsg-2+deb9u2", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"samba-dsdb-modules", ver:"2:4.5.12+dfsg-2+deb9u2", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"samba-libs", ver:"2:4.5.12+dfsg-2+deb9u2", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"samba-testsuite", ver:"2:4.5.12+dfsg-2+deb9u2", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"samba-vfs-modules", ver:"2:4.5.12+dfsg-2+deb9u2", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"smbclient", ver:"2:4.5.12+dfsg-2+deb9u2", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"winbind", ver:"2:4.5.12+dfsg-2+deb9u2", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}

if (report != "") {
  security_message(data:report);
} else if (__pkg_match) {
  exit(99); # Not vulnerable.
}