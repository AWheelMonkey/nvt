###############################################################################
# OpenVAS Vulnerability Test
#
# Ubuntu Update for linux-lts-trusty USN-3083-2
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
  script_oid("1.3.6.1.4.1.25623.1.0.842887");
  script_version("$Revision: 11037 $");
  script_tag(name:"last_modification", value:"$Date: 2018-08-17 13:51:16 +0200 (Fri, 17 Aug 2018) $");
  script_tag(name:"creation_date", value:"2016-09-20 05:41:42 +0200 (Tue, 20 Sep 2016)");
  script_cve_id("CVE-2016-3841", "CVE-2015-8767");
  script_tag(name:"cvss_base", value:"7.2");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"qod_type", value:"package");
  script_name("Ubuntu Update for linux-lts-trusty USN-3083-2");
  script_tag(name:"summary", value:"Check the version of linux-lts-trusty");
  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");
  script_tag(name:"insight", value:"USN-3083-1 fixed vulnerabilities in the Linux
  kernel for Ubuntu 14.04 LTS. This update provides the corresponding updates for
  the Linux Hardware Enablement (HWE) kernel from Ubuntu 14.04 LTS for Ubuntu
  12.04 LTS.

Dmitry Vyukov discovered that the IPv6 implementation in the Linux kernel
did not properly handle options data, including a use-after-free. A local
attacker could use this to cause a denial of service (system crash) or
possibly execute arbitrary code. (CVE-2016-3841)

It was discovered that a race condition existed when handling heartbeat-
timeout events in the SCTP implementation of the Linux kernel. A remote
attacker could use this to cause a denial of service. (CVE-2015-8767)");
  script_tag(name:"affected", value:"linux-lts-trusty on Ubuntu 12.04 LTS");
  script_tag(name:"solution", value:"Please Install the Updated Packages.");

  script_xref(name:"USN", value:"3083-2");
  script_xref(name:"URL", value:"http://www.ubuntu.com/usn/usn-3083-2/");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
  script_family("Ubuntu Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/ubuntu_linux", "ssh/login/packages", re:"ssh/login/release=UBUNTU12\.04 LTS");
  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

release = dpkg_get_ssh_release();

res = "";
if(release == NULL){
  exit(0);
}

if(release == "UBUNTU12.04 LTS")
{

  if ((res = isdpkgvuln(pkg:"linux-image-3.13.0-96-generic", ver:"3.13.0-96.143~precise1", rls:"UBUNTU12.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"linux-image-3.13.0-96-generic-lpae", ver:"3.13.0-96.143~precise1", rls:"UBUNTU12.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
