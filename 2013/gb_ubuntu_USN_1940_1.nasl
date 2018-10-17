###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ubuntu_USN_1940_1.nasl 11037 2018-08-17 11:51:16Z cfischer $
#
# Ubuntu Update for linux-ec2 USN-1940-1
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (c) 2013 Greenbone Networks GmbH, http://www.greenbone.net
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

include("revisions-lib.inc");

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.841548");
  script_version("$Revision: 11037 $");
  script_tag(name:"last_modification", value:"$Date: 2018-08-17 13:51:16 +0200 (Fri, 17 Aug 2018) $");
  script_tag(name:"creation_date", value:"2013-09-12 11:45:59 +0530 (Thu, 12 Sep 2013)");
  script_cve_id("CVE-2013-1060", "CVE-2013-1943", "CVE-2013-2206", "CVE-2013-4162");
  script_tag(name:"cvss_base", value:"6.9");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:M/Au:N/C:C/I:C/A:C");
  script_name("Ubuntu Update for linux-ec2 USN-1940-1");


  script_tag(name:"affected", value:"linux-ec2 on Ubuntu 10.04 LTS");
  script_tag(name:"insight", value:"Vasily Kulikov discovered a flaw in the Linux Kernel's perf tool that
allows for privilege escalation. A local user could exploit this flaw to
run commands as root when using the perf tool. (CVE-2013-1060)

Michael S. Tsirkin discovered a flaw in how the Linux kernel's KVM
subsystem allocates memory slots for the guest's address space. A local
user could exploit this flaw to gain system privileges or obtain sensitive
information from kernel memory. (CVE-2013-1943)

A flaw was discovered in the SCTP (stream control transfer protocol)
network protocol's handling of duplicate cookies in the Linux kernel. A
remote attacker could exploit this flaw to cause a denial of service
(system crash) on another remote user querying the SCTP connection.
(CVE-2013-2206)

Hannes Frederic Sowa discovered a flaw in setsockopt UDP_CORK option in the
Linux kernel's IPv6 stack. A local user could exploit this flaw to cause a
denial of service (system crash). (CVE-2013-4162)");
  script_tag(name:"solution", value:"Please Install the Updated Packages.");
  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");
  script_xref(name:"USN", value:"1940-1");
  script_xref(name:"URL", value:"http://www.ubuntu.com/usn/usn-1940-1/");
  script_tag(name:"summary", value:"Check for the Version of linux-ec2");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2013 Greenbone Networks GmbH");
  script_family("Ubuntu Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/ubuntu_linux", "ssh/login/packages", re:"ssh/login/release=UBUNTU10\.04 LTS");
  exit(0);
}


include("pkg-lib-deb.inc");

release = dpkg_get_ssh_release();

res = "";
if(release == NULL){
  exit(0);
}

if(release == "UBUNTU10.04 LTS")
{

  if ((res = isdpkgvuln(pkg:"linux-image-2.6.32-356-ec2", ver:"2.6.32-356.69", rls:"UBUNTU10.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}