###############################################################################
# OpenVAS Vulnerability Test
# $Id: deb_4257.nasl 11768 2018-10-05 14:07:38Z cfischer $
#
# Auto-generated from advisory DSA 4257-1 using nvtgen 1.0
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
  script_oid("1.3.6.1.4.1.25623.1.0.704257");
  script_version("$Revision: 11768 $");
  script_cve_id("CVE-2018-10906");
  script_name("Debian Security Advisory DSA 4257-1 (fuse - security update)");
  script_tag(name:"last_modification", value:"$Date: 2018-10-05 16:07:38 +0200 (Fri, 05 Oct 2018) $");
  script_tag(name:"creation_date", value:"2018-07-28 00:00:00 +0200 (Sat, 28 Jul 2018)");
  script_tag(name:"cvss_base", value:"4.6");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:L/Au:N/C:P/I:P/A:P");
  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"package");

  script_xref(name:"URL", value:"https://www.debian.org/security/2018/dsa-4257.html");

  script_category(ACT_GATHER_INFO);

  script_copyright("Copyright (c) 2018 Greenbone Networks GmbH http://greenbone.net");
  script_family("Debian Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages", re:"ssh/login/release=DEB9\.[0-9]+");
  script_tag(name:"affected", value:"fuse on Debian Linux");
  script_tag(name:"insight", value:"Filesystem in Userspace (FUSE) is a simple interface for userspace programs to
export a virtual filesystem to the Linux kernel. It also aims to provide a
secure method for non privileged users to create and mount their own filesystem
implementations.");
  script_tag(name:"solution", value:"For the stable distribution (stretch), this problem has been fixed in
version 2.9.7-1+deb9u1.

We recommend that you upgrade your fuse packages.

For the detailed security status of fuse please refer to its security
tracker page at:
https://security-tracker.debian.org/tracker/fuse");
  script_tag(name:"summary",  value:"Jann Horn discovered that FUSE, a Filesystem in USErspace, allows the
bypass of the user_allow_other restriction when SELinux is active
(including in permissive mode). A local user can take advantage of this
flaw in the fusermount utility to bypass the system configuration and
mount a FUSE filesystem with the allow_other 
mount option.");
  script_tag(name:"vuldetect", value:"This check tests the installed software version using the apt package manager.");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"fuse", ver:"2.9.7-1+deb9u1", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"fuse-dbg", ver:"2.9.7-1+deb9u1", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libfuse-dev", ver:"2.9.7-1+deb9u1", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libfuse2", ver:"2.9.7-1+deb9u1", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}

if (report != "") {
  security_message(data:report);
} else if (__pkg_match) {
  exit(99);
}
