###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ubuntu_USN_2333_1.nasl 12381 2018-11-16 11:16:30Z cfischer $
#
# Ubuntu Update for linux-ec2 USN-2333-1
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (C) 2014 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.841951");
  script_version("$Revision: 12381 $");
  script_tag(name:"last_modification", value:"$Date: 2018-11-16 12:16:30 +0100 (Fri, 16 Nov 2018) $");
  script_tag(name:"creation_date", value:"2014-09-03 05:55:58 +0200 (Wed, 03 Sep 2014)");
  script_cve_id("CVE-2014-0203", "CVE-2014-4508", "CVE-2014-4652", "CVE-2014-4653",
                "CVE-2014-4654", "CVE-2014-4655", "CVE-2014-4656", "CVE-2014-4667",
                "CVE-2014-5077");
  script_tag(name:"cvss_base", value:"6.6");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:L/Au:N/C:C/I:N/A:C");
  script_name("Ubuntu Update for linux-ec2 USN-2333-1");


  script_tag(name:"affected", value:"linux-ec2 on Ubuntu 10.04 LTS");
  script_tag(name:"insight", value:"A bug was discovered in the handling of pathname components
when used with an autofs direct mount. A local user could exploit this flaw to
cause a denial of service (system crash) via an open system call. (CVE-2014-0203)

Toralf F&#246 rster reported an error in the Linux kernels syscall auditing on
32 bit x86 platforms. A local user could exploit this flaw to cause a
denial of service (OOPS and system crash). (CVE-2014-4508)

An information leak was discovered in the control implementation of the
Advanced Linux Sound Architecture (ALSA) subsystem in the Linux kernel. A
local user could exploit this flaw to obtain sensitive information from
kernel memory. (CVE-2014-4652)

A use-after-free flaw was discovered in the Advanced Linux Sound
Architecture (ALSA) control implementation of the Linux kernel. A local
user could exploit this flaw to cause a denial of service (system crash).
(CVE-2014-4653)

A authorization bug was discovered with the snd_ctl_elem_add function of
the Advanced Linux Sound Architecture (ALSA) in the Linux kernel. A local
user could exploit his bug to cause a denial of service (remove kernel
controls). (CVE-2014-4654)

A flaw discovered in how the snd_ctl_elem function of the Advanced Linux
Sound Architecture (ALSA) handled a reference count. A local user could
exploit this flaw to cause a denial of service (integer overflow and limit
bypass). (CVE-2014-4655)

An integer overflow flaw was discovered in the control implementation of
the Advanced Linux Sound Architecture (ALSA). A local user could exploit
this flaw to cause a denial of service (system crash). (CVE-2014-4656)

An integer underflow flaw was discovered in the Linux kernel's handling of
the backlog value for certain SCTP packets. A remote attacker could exploit
this flaw to cause a denial of service (socket outage) via a crafted SCTP
packet. (CVE-2014-4667)

Jason Gunthorpe reported a flaw with SCTP authentication in the Linux
kernel. A remote attacker could exploit this flaw to cause a denial of
service (NULL pointer dereference and OOPS). (CVE-2014-5077)");
  script_tag(name:"solution", value:"Please Install the Updated Packages.");
  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");
  script_xref(name:"USN", value:"2333-1");
  script_xref(name:"URL", value:"http://www.ubuntu.com/usn/usn-2333-1/");
  script_tag(name:"summary", value:"The remote host is missing an update for the 'linux-ec2'
  package(s) announced via the referenced advisory.");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2014 Greenbone Networks GmbH");
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

  if ((res = isdpkgvuln(pkg:"linux-image-2.6.32-369-ec2", ver:"2.6.32-369.85", rls:"UBUNTU10.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
