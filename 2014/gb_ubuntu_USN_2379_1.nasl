###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ubuntu_USN_2379_1.nasl 12381 2018-11-16 11:16:30Z cfischer $
#
# Ubuntu Update for linux USN-2379-1
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
  script_oid("1.3.6.1.4.1.25623.1.0.841998");
  script_version("$Revision: 12381 $");
  script_tag(name:"last_modification", value:"$Date: 2018-11-16 12:16:30 +0100 (Fri, 16 Nov 2018) $");
  script_tag(name:"creation_date", value:"2014-10-10 06:10:10 +0200 (Fri, 10 Oct 2014)");
  script_cve_id("CVE-2014-3181", "CVE-2014-3184", "CVE-2014-3185", "CVE-2014-3186", "CVE-2014-3631", "CVE-2014-6410", "CVE-2014-6416", "CVE-2014-6417", "CVE-2014-6418");
  script_tag(name:"cvss_base", value:"7.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:C");
  script_name("Ubuntu Update for linux USN-2379-1");
  script_tag(name:"summary", value:"The remote host is missing an update for the 'linux'
  package(s) announced via the referenced advisory.");
  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");
  script_tag(name:"insight", value:"Steven Vittitoe reported multiple stack buffer overflows in Linux kernel's
magicmouse HID driver. A physically proximate attacker could exploit this
flaw to cause a denial of service (system crash) or possibly execute
arbitrary code via specially crafted devices. (CVE-2014-3181)

Ben Hawkes reported some off by one errors for report descriptors in the
Linux kernel's HID stack. A physically proximate attacker could exploit
these flaws to cause a denial of service (out-of-bounds write) via a
specially crafted device. (CVE-2014-3184)

Several bounds check flaws allowing for buffer overflows were discovered in
the Linux kernel's Whiteheat USB serial driver. A physically proximate
attacker could exploit these flaws to cause a denial of service (system
crash) via a specially crafted device. (CVE-2014-3185)

Steven Vittitoe reported a buffer overflow in the Linux kernel's PicoLCD
HID device driver. A physically proximate attacker could exploit this flaw
to cause a denial of service (system crash) or possibly execute arbitrary
code via a specially craft device. (CVE-2014-3186)

A flaw was discovered in the Linux kernel's associative-array garbage
collection implementation. A local user could exploit this flaw to cause a
denial of service (system crash) or possibly have other unspecified impact
by using keyctl operations. (CVE-2014-3631)

A flaw was discovered in the Linux kernel's UDF filesystem (used on some
CD-ROMs and DVDs) when processing indirect ICBs. An attacker who can cause
CD, DVD or image file with a specially crafted inode to be mounted can
cause a denial of service (infinite loop or stack consumption).
(CVE-2014-6410)

James Eckersall discovered a buffer overflow in the Ceph filesystem in the
Linux kernel. A remote attacker could exploit this flaw to cause a denial
of service (memory consumption and panic) or possibly have other
unspecified impact via a long unencrypted auth ticket. (CVE-2014-6416)

James Eckersall discovered a flaw in the handling of memory allocation
failures in the Ceph filesystem. A remote attacker could exploit this flaw
to cause a denial of service (system crash) or possibly have unspecified
other impact. (CVE-2014-6417)

James Eckersall discovered a flaw in how the Ceph filesystem validates auth
replies. A remote attacker could exploit this flaw to cause a denial of
service (system crash) or possibly have other unspecified impact.
(CVE-2014-6418)");
  script_tag(name:"affected", value:"linux on Ubuntu 14.04 LTS");
  script_tag(name:"solution", value:"Please Install the Updated Packages.");
  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");
  script_xref(name:"USN", value:"2379-1");
  script_xref(name:"URL", value:"http://www.ubuntu.com/usn/usn-2379-1/");
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

  if ((res = isdpkgvuln(pkg:"linux-image-3.13.0-37-generic", ver:"3.13.0-37.64", rls:"UBUNTU14.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"linux-image-3.13.0-37-generic-lpae", ver:"3.13.0-37.64", rls:"UBUNTU14.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"linux-image-3.13.0-37-lowlatency", ver:"3.13.0-37.64", rls:"UBUNTU14.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"linux-image-3.13.0-37-powerpc-e500", ver:"3.13.0-37.64", rls:"UBUNTU14.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"linux-image-3.13.0-37-powerpc-e500mc", ver:"3.13.0-37.64", rls:"UBUNTU14.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"linux-image-3.13.0-37-powerpc-smp", ver:"3.13.0-37.64", rls:"UBUNTU14.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"linux-image-3.13.0-37-powerpc64-emb", ver:"3.13.0-37.64", rls:"UBUNTU14.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"linux-image-3.13.0-37-powerpc64-smp", ver:"3.13.0-37.64", rls:"UBUNTU14.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}