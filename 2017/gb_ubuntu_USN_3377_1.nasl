###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ubuntu_USN_3377_1.nasl 11897 2018-10-15 05:26:22Z cfischer $
#
# Ubuntu Update for linux USN-3377-1
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (C) 2017 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.843271");
  script_version("$Revision: 11897 $");
  script_tag(name:"last_modification", value:"$Date: 2018-10-15 07:26:22 +0200 (Mon, 15 Oct 2018) $");
  script_tag(name:"creation_date", value:"2017-08-04 07:16:37 +0200 (Fri, 04 Aug 2017)");
  script_cve_id("CVE-2017-7533", "CVE-2017-1000365", "CVE-2017-10810", "CVE-2017-7482");
  script_tag(name:"cvss_base", value:"7.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:C");
  script_tag(name:"qod_type", value:"package");
  script_name("Ubuntu Update for linux USN-3377-1");
  script_tag(name:"summary", value:"Check the version of linux");
  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");
  script_tag(name:"insight", value:"Fan Wu and Shixiong Zhao discovered a race
  condition between inotify events and vfs rename operations in the Linux kernel.
  An unprivileged local attacker could use this to cause a denial of service
  (system crash) or execute arbitrary code. (CVE-2017-7533) It was discovered that
  the Linux kernel did not properly restrict RLIMIT_STACK size. A local attacker
  could use this in conjunction with another vulnerability to possibly execute
  arbitrary code. (CVE-2017-1000365) &#26446 &#24378 discovered that the Virtio
  GPU driver in the Linux kernel did not properly free memory in some situations.
  A local attacker could use this to cause a denial of service (memory
  consumption). (CVE-2017-10810) &#30707 &#30922 discovered that the RxRPC
  Kerberos 5 ticket handling code in the Linux kernel did not properly verify
  metadata. A remote attacker could use this to cause a denial of service (system
  crash) or possibly execute arbitrary code. (CVE-2017-7482)");
  script_tag(name:"affected", value:"linux on Ubuntu 17.04");
  script_tag(name:"solution", value:"Please Install the Updated Packages.");

  script_xref(name:"USN", value:"3377-1");
  script_xref(name:"URL", value:"http://www.ubuntu.com/usn/usn-3377-1/");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("Ubuntu Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/ubuntu_linux", "ssh/login/packages", re:"ssh/login/release=UBUNTU17\.04");
  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

release = dpkg_get_ssh_release();

res = "";
if(release == NULL){
  exit(0);
}

if(release == "UBUNTU17.04")
{

  if ((res = isdpkgvuln(pkg:"linux-image-4.10.0-1013-raspi2", ver:"4.10.0-1013.16", rls:"UBUNTU17.04")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"linux-image-4.10.0-30-generic", ver:"4.10.0-30.34", rls:"UBUNTU17.04")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"linux-image-4.10.0-30-generic-lpae", ver:"4.10.0-30.34", rls:"UBUNTU17.04")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"linux-image-4.10.0-30-lowlatency", ver:"4.10.0-30.34", rls:"UBUNTU17.04")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"linux-image-generic", ver:"4.10.0.30.31", rls:"UBUNTU17.04")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"linux-image-generic-lpae", ver:"4.10.0.30.31", rls:"UBUNTU17.04")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"linux-image-lowlatency", ver:"4.10.0.30.31", rls:"UBUNTU17.04")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"linux-image-raspi2", ver:"4.10.0.1013.15", rls:"UBUNTU17.04")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}