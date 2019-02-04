###############################################################################
# OpenVAS Vulnerability Test
# $Id: deb_dla_1610.nasl 12889 2018-12-28 07:52:20Z mmartin $
#
# Auto-generated from advisory DLA 1610-1 using nvtgen 1.0
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
  script_oid("1.3.6.1.4.1.25623.1.0.891610");
  script_version("$Revision: 12889 $");
  script_cve_id("CVE-2018-19497");
  script_name("Debian LTS Advisory ([SECURITY] [DLA 1610-1] sleuthkit security update)");
  script_tag(name:"last_modification", value:"$Date: 2018-12-28 08:52:20 +0100 (Fri, 28 Dec 2018) $");
  script_tag(name:"creation_date", value:"2018-12-18 00:00:00 +0100 (Tue, 18 Dec 2018)");
  script_tag(name:"cvss_base", value:"4.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:N/A:P");
  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"package");

  script_xref(name:"URL", value:"https://lists.debian.org/debian-lts-announce/2018/12/msg00008.html");

  script_category(ACT_GATHER_INFO);

  script_copyright("Copyright (c) 2018 Greenbone Networks GmbH http://greenbone.net");
  script_family("Debian Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages", re:"ssh/login/release=DEB8\.[0-9]+");
  script_tag(name:"affected", value:"sleuthkit on Debian Linux");
  script_tag(name:"insight", value:"The Sleuth Kit, also known as TSK, is a collection of UNIX-based command
line file and volume system forensic analysis tools. The filesystem tools
allow you to examine filesystems of a suspect computer in a non-intrusive
fashion. Because the tools do not rely on the operating system to process the
filesystems, deleted and hidden content is shown.");
  script_tag(name:"solution", value:"For Debian 8 'Jessie', this problem has been fixed in version
4.1.3-4+deb8u1.

We recommend that you upgrade your sleuthkit packages.");
  script_tag(name:"summary",  value:"It was discovered that the Sleuth Kit (TSK) through version 4.6.4 is
affected by a buffer over-read vulnerability. The tsk_getu16 call in
hfs_dir_open_meta_cb (tsk/fs/hfs_dent.c) does not properly check
boundaries. This vulnerability might be leveraged by remote attackers
using crafted filesystem images to cause denial of service or any other
unspecified behavior.");
  script_tag(name:"vuldetect", value:"This check tests the installed software version using the apt package manager.");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"libtsk-dev", ver:"4.1.3-4+deb8u1", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libtsk10", ver:"4.1.3-4+deb8u1", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"sleuthkit", ver:"4.1.3-4+deb8u1", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}

if (report != "") {
  security_message(data:report);
} else if (__pkg_match) {
  exit(99);
}
