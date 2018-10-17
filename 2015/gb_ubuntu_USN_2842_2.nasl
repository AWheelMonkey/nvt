###############################################################################
# OpenVAS Vulnerability Test
#
# Ubuntu Update for linux-lts-vivid USN-2842-2
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (C) 2015 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.842574");
  script_version("$Revision: 11037 $");
  script_tag(name:"last_modification", value:"$Date: 2018-08-17 13:51:16 +0200 (Fri, 17 Aug 2018) $");
  script_tag(name:"creation_date", value:"2015-12-18 05:44:55 +0100 (Fri, 18 Dec 2015)");
  script_cve_id("CVE-2015-8104", "CVE-2015-7799", "CVE-2015-7884", "CVE-2015-7885");
  script_tag(name:"cvss_base", value:"4.9");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:L/Au:N/C:N/I:N/A:C");
  script_tag(name:"qod_type", value:"package");
  script_name("Ubuntu Update for linux-lts-vivid USN-2842-2");
  script_tag(name:"summary", value:"Check the version of linux-lts-vivid");
  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");
  script_tag(name:"insight", value:"Jan Beulich discovered that the KVM svm
hypervisor implementation in the Linux kernel did not properly catch Debug
exceptions on AMD processors. An attacker in a guest virtual machine could use
this to cause a denial of service (system crash) in the host OS. (CVE-2015-8104)

&#37101 &#27704 &#21018  discovered that the ppp implementation in the Linux kernel did
not ensure that certain slot numbers are valid. A local attacker with the
privilege to call ioctl() on /dev/ppp could cause a denial of service
(system crash). (CVE-2015-7799)

It was discovered that the virtual video osd test driver in the Linux
kernel did not properly initialize data structures. A local attacker could
use this to obtain sensitive information from the kernel. (CVE-2015-7884)

It was discovered that the driver for Digi Neo and ClassicBoard devices did
not properly initialize data structures. A local attacker could use this to
obtain sensitive information from the kernel. (CVE-2015-7885)");
  script_tag(name:"affected", value:"linux-lts-vivid on Ubuntu 14.04 LTS");
  script_tag(name:"solution", value:"Please Install the Updated Packages.");
  script_xref(name:"USN", value:"2842-2");
  script_xref(name:"URL", value:"http://www.ubuntu.com/usn/usn-2842-2/");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2015 Greenbone Networks GmbH");
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

  if ((res = isdpkgvuln(pkg:"linux-image-3.19.0-41-generic", ver:"3.19.0-41.46~14.04.2", rls:"UBUNTU14.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"linux-image-3.19.0-41-generic-lpae", ver:"3.19.0-41.46~14.04.2", rls:"UBUNTU14.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"linux-image-3.19.0-41-lowlatency", ver:"3.19.0-41.46~14.04.2", rls:"UBUNTU14.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"linux-image-3.19.0-41-powerpc-e500mc", ver:"3.19.0-41.46~14.04.2", rls:"UBUNTU14.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"linux-image-3.19.0-41-powerpc-smp", ver:"3.19.0-41.46~14.04.2", rls:"UBUNTU14.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"linux-image-3.19.0-41-powerpc64-emb", ver:"3.19.0-41.46~14.04.2", rls:"UBUNTU14.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"linux-image-3.19.0-41-powerpc64-smp", ver:"3.19.0-41.46~14.04.2", rls:"UBUNTU14.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
