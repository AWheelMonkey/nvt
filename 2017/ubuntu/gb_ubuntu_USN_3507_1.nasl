###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ubuntu_USN_3507_1.nasl 12381 2018-11-16 11:16:30Z cfischer $
#
# Ubuntu Update for linux USN-3507-1
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
  script_oid("1.3.6.1.4.1.25623.1.0.843399");
  script_version("$Revision: 12381 $");
  script_tag(name:"last_modification", value:"$Date: 2018-11-16 12:16:30 +0100 (Fri, 16 Nov 2018) $");
  script_tag(name:"creation_date", value:"2017-12-09 07:39:06 +0100 (Sat, 09 Dec 2017)");
  script_cve_id("CVE-2017-16939", "CVE-2017-1000405", "CVE-2017-12193", "CVE-2017-15299",
                "CVE-2017-15306", "CVE-2017-15951", "CVE-2017-16535", "CVE-2017-16643");
  script_tag(name:"cvss_base", value:"7.2");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"qod_type", value:"package");
  script_name("Ubuntu Update for linux USN-3507-1");
  script_tag(name:"summary", value:"The remote host is missing an update for the 'linux'
  package(s) announced via the referenced advisory.");
  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");
  script_tag(name:"insight", value:"Mohamed Ghannam discovered that a
  use-after-free vulnerability existed in the Netlink subsystem (XFRM) in the
  Linux kernel. A local attacker could use this to cause a denial of service
  (system crash) or possibly execute arbitrary code. (CVE-2017-16939) It was
  discovered that the Linux kernel did not properly handle copy-on- write of
  transparent huge pages. A local attacker could use this to cause a denial of
  service (application crashes) or possibly gain administrative privileges.
  (CVE-2017-1000405) Fan Wu, Haoran Qiu, and Shixiong Zhao discovered that the
  associative array implementation in the Linux kernel sometimes did not properly
  handle adding a new entry. A local attacker could use this to cause a denial of
  service (system crash). (CVE-2017-12193) Eric Biggers discovered that the key
  management subsystem in the Linux kernel did not properly restrict adding a key
  that already exists but is uninstantiated. A local attacker could use this to
  cause a denial of service (system crash) or possibly execute arbitrary code.
  (CVE-2017-15299) It was discovered that a null pointer dereference error existed
  in the PowerPC KVM implementation in the Linux kernel. A local attacker could
  use this to cause a denial of service (system crash). (CVE-2017-15306) Eric
  Biggers discovered a race condition in the key management subsystem of the Linux
  kernel around keys in a negative state. A local attacker could use this to cause
  a denial of service (system crash) or possibly execute arbitrary code.
  (CVE-2017-15951) Andrey Konovalov discovered that the USB subsystem in the Linux
  kernel did not properly validate USB BOS metadata. A physically proximate
  attacker could use this to cause a denial of service (system crash).
  (CVE-2017-16535) Andrey Konovalov discovered an out-of-bounds read in the GTCO
  digitizer USB driver for the Linux kernel. A physically proximate attacker could
  use this to cause a denial of service (system crash) or possibly execute
  arbitrary code. (CVE-2017-16643)");
  script_tag(name:"affected", value:"linux on Ubuntu 17.10");
  script_tag(name:"solution", value:"Please Install the Updated Packages.");

  script_xref(name:"USN", value:"3507-1");
  script_xref(name:"URL", value:"http://www.ubuntu.com/usn/usn-3507-1/");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("Ubuntu Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/ubuntu_linux", "ssh/login/packages", re:"ssh/login/release=UBUNTU17\.10");
  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

release = dpkg_get_ssh_release();

res = "";
if(release == NULL){
  exit(0);
}

if(release == "UBUNTU17.10")
{

  if ((res = isdpkgvuln(pkg:"linux-image-4.13.0-1008-raspi2", ver:"4.13.0-1008.8", rls:"UBUNTU17.10")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"linux-image-4.13.0-19-generic", ver:"4.13.0-19.22", rls:"UBUNTU17.10")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"linux-image-4.13.0-19-generic-lpae", ver:"4.13.0-19.22", rls:"UBUNTU17.10")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"linux-image-4.13.0-19-lowlatency", ver:"4.13.0-19.22", rls:"UBUNTU17.10")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"linux-image-generic", ver:"4.13.0.19.20", rls:"UBUNTU17.10")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"linux-image-generic-lpae", ver:"4.13.0.19.20", rls:"UBUNTU17.10")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"linux-image-lowlatency", ver:"4.13.0.19.20", rls:"UBUNTU17.10")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"linux-image-raspi2", ver:"4.13.0.1008.6", rls:"UBUNTU17.10")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
