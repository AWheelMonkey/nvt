###############################################################################
# OpenVAS Vulnerability Test
#
# Ubuntu Update for linux-lts-vivid USN-3053-1
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (C) 2016 Greenbone Networks GmbH, http://www.greenbone.net
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 2
# (or any later version), as published by the Free Software Foundation.
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
  script_oid("1.3.6.1.4.1.25623.1.0.842859");
  script_version("$Revision: 12381 $");
  script_tag(name:"last_modification", value:"$Date: 2018-11-16 12:16:30 +0100 (Fri, 16 Nov 2018) $");
  script_tag(name:"creation_date", value:"2016-08-11 05:37:57 +0200 (Thu, 11 Aug 2016)");
  script_cve_id("CVE-2016-1237", "CVE-2016-4470", "CVE-2016-4794", "CVE-2016-5243");
  script_tag(name:"cvss_base", value:"7.2");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"qod_type", value:"package");
  script_name("Ubuntu Update for linux-lts-vivid USN-3053-1");
  script_tag(name:"summary", value:"The remote host is missing an update for the 'linux-lts-vivid'
  package(s) announced via the referenced advisory.");
  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");
  script_tag(name:"insight", value:"A missing permission check when settings
  ACLs was discovered in nfsd. A local user could exploit this flaw to gain access
  to any file by setting an ACL. (CVE-2016-1237)

It was discovered that the keyring implementation in the Linux kernel did
not ensure a data structure was initialized before referencing it after an
error condition occurred. A local attacker could use this to cause a denial
of service (system crash). (CVE-2016-4470)

Sasha Levin discovered that a use-after-free existed in the percpu
allocator in the Linux kernel. A local attacker could use this to cause a
denial of service (system crash) or possibly execute arbitrary code with
administrative privileges. (CVE-2016-4794)

Kangjie Lu discovered an information leak in the netlink implementation of
the Linux kernel. A local attacker could use this to obtain sensitive
information from kernel memory. (CVE-2016-5243)");
  script_tag(name:"affected", value:"linux-lts-vivid on Ubuntu 14.04 LTS");
  script_tag(name:"solution", value:"Please Install the Updated Packages.");

  script_xref(name:"USN", value:"3053-1");
  script_xref(name:"URL", value:"http://www.ubuntu.com/usn/usn-3053-1/");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
  script_family("Ubuntu Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/ubuntu_linux", "ssh/login/packages", re:"ssh/login/release=UBUNTU14\.04 LTS");
  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

release = dpkg_get_ssh_release();

res = "";
if(release == NULL){
  exit(0);
}

if(release == "UBUNTU14.04 LTS")
{

  if ((res = isdpkgvuln(pkg:"linux-image-3.19.0-66-generic", ver:"3.19.0-66.74~14.04.1", rls:"UBUNTU14.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"linux-image-3.19.0-66-generic-lpae", ver:"3.19.0-66.74~14.04.1", rls:"UBUNTU14.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"linux-image-3.19.0-66-lowlatency", ver:"3.19.0-66.74~14.04.1", rls:"UBUNTU14.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"linux-image-3.19.0-66-powerpc-e500mc", ver:"3.19.0-66.74~14.04.1", rls:"UBUNTU14.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"linux-image-3.19.0-66-powerpc-smp", ver:"3.19.0-66.74~14.04.1", rls:"UBUNTU14.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"linux-image-3.19.0-66-powerpc64-emb", ver:"3.19.0-66.74~14.04.1", rls:"UBUNTU14.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"linux-image-3.19.0-66-powerpc64-smp", ver:"3.19.0-66.74~14.04.1", rls:"UBUNTU14.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
