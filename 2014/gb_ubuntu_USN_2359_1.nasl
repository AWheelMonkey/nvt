###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ubuntu_USN_2359_1.nasl 12381 2018-11-16 11:16:30Z cfischer $
#
# Ubuntu Update for linux USN-2359-1
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

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.841976");
  script_version("$Revision: 12381 $");
  script_tag(name:"last_modification", value:"$Date: 2018-11-16 12:16:30 +0100 (Fri, 16 Nov 2018) $");
  script_tag(name:"creation_date", value:"2014-09-24 06:02:50 +0200 (Wed, 24 Sep 2014)");
  script_cve_id("CVE-2014-3601", "CVE-2014-5077", "CVE-2014-5471", "CVE-2014-5472");
  script_tag(name:"cvss_base", value:"5.4");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:H/Au:N/C:N/I:N/A:C");
  script_name("Ubuntu Update for linux USN-2359-1");
  script_tag(name:"insight", value:"Jack Morgenstein reported a flaw in the
page handling of the KVM (Kerenl Virtual Machine) subsystem in the Linux kernel.
A guest OS user could exploit this flaw to cause a denial of service (host OS
memory corruption) or possibly have other unspecified impact on the host OS.
(CVE-2014-3601)

Jason Gunthorpe reported a flaw with SCTP authentication in the Linux
kernel. A remote attacker could exploit this flaw to cause a denial of
service (NULL pointer dereference and OOPS). (CVE-2014-5077)

Chris Evans reported an flaw in the Linux kernel's handling of iso9660
(compact disk filesystem) images. An attacker who can mount a custom
iso9660 image either via a CD/DVD drive or a loopback mount could cause a
denial of service (system crash or reboot). (CVE-2014-5471)

Chris Evans reported an flaw in the Linux kernel's handling of iso9660
(compact disk filesystem) images. An attacker who can mount a custom
iso9660 image, with a self-referential CL entry, either via a CD/DVD drive
or a loopback mount could cause a denial of service (unkillable mount
process). (CVE-2014-5472)");
  script_tag(name:"affected", value:"linux on Ubuntu 14.04 LTS");
  script_tag(name:"solution", value:"Please Install the Updated Packages.");
  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");

  script_xref(name:"USN", value:"2359-1");
  script_xref(name:"URL", value:"http://www.ubuntu.com/usn/usn-2359-1/");
  script_tag(name:"summary", value:"The remote host is missing an update for the 'linux'
  package(s) announced via the referenced advisory.");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2014 Greenbone Networks GmbH");
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

  if ((res = isdpkgvuln(pkg:"linux-image-3.13.0-36-generic", ver:"3.13.0-36.63", rls:"UBUNTU14.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"linux-image-3.13.0-36-generic-lpae", ver:"3.13.0-36.63", rls:"UBUNTU14.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"linux-image-3.13.0-36-lowlatency", ver:"3.13.0-36.63", rls:"UBUNTU14.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"linux-image-3.13.0-36-powerpc-e500", ver:"3.13.0-36.63", rls:"UBUNTU14.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"linux-image-3.13.0-36-powerpc-e500mc", ver:"3.13.0-36.63", rls:"UBUNTU14.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"linux-image-3.13.0-36-powerpc-smp", ver:"3.13.0-36.63", rls:"UBUNTU14.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"linux-image-3.13.0-36-powerpc64-emb", ver:"3.13.0-36.63", rls:"UBUNTU14.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"linux-image-3.13.0-36-powerpc64-smp", ver:"3.13.0-36.63", rls:"UBUNTU14.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
