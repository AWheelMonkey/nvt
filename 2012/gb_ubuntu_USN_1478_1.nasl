###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ubuntu_USN_1478_1.nasl 12379 2018-11-16 10:51:56Z cfischer $
#
# Ubuntu Update for libav USN-1478-1
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (c) 2012 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_xref(name:"URL", value:"http://www.ubuntu.com/usn/usn-1478-1/");
  script_oid("1.3.6.1.4.1.25623.1.0.841046");
  script_version("$Revision: 12379 $");
  script_tag(name:"last_modification", value:"$Date: 2018-11-16 11:51:56 +0100 (Fri, 16 Nov 2018) $");
  script_tag(name:"creation_date", value:"2012-06-19 09:41:48 +0530 (Tue, 19 Jun 2012)");
  script_cve_id("CVE-2011-3929", "CVE-2011-3936", "CVE-2011-3940", "CVE-2011-3945",
                "CVE-2011-3947", "CVE-2011-3951", "CVE-2011-3952", "CVE-2011-4031",
                "CVE-2012-0848", "CVE-2012-0850", "CVE-2012-0851", "CVE-2012-0852",
                "CVE-2012-0853", "CVE-2012-0858", "CVE-2012-0859", "CVE-2012-0947");
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_xref(name:"USN", value:"1478-1");
  script_name("Ubuntu Update for libav USN-1478-1");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2012 Greenbone Networks GmbH");
  script_family("Ubuntu Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/ubuntu_linux", "ssh/login/packages", re:"ssh/login/release=UBUNTU(12\.04 LTS|11\.10|11\.04)");
  script_tag(name:"summary", value:"Ubuntu Update for Linux kernel vulnerabilities USN-1478-1");
  script_tag(name:"affected", value:"libav on Ubuntu 12.04 LTS,
  Ubuntu 11.10,
  Ubuntu 11.04");
  script_tag(name:"solution", value:"Please Install the Updated Packages.");
  script_tag(name:"insight", value:"Mateusz Jurczyk and Gynvael Coldwind discovered that Libav incorrectly
  handled certain malformed DV files. If a user were tricked into opening a
  crafted DV file, an attacker could cause a denial of service via
  application crash, or possibly execute arbitrary code with the privileges
  of the user invoking the program. This issue only affected Ubuntu 11.10.
  (CVE-2011-3929, CVE-2011-3936)

  Mateusz Jurczyk and Gynvael Coldwind discovered that Libav incorrectly
  handled certain malformed NSV files. If a user were tricked into opening a
  crafted NSV file, an attacker could cause a denial of service via
  application crash, or possibly execute arbitrary code with the privileges
  of the user invoking the program. This issue only affected Ubuntu 11.04 and
  Ubuntu 11.10. (CVE-2011-3940)

  Mateusz Jurczyk and Gynvael Coldwind discovered that Libav incorrectly
  handled certain malformed Kega Game Video (KGV1) files. If a user were
  tricked into opening a crafted Kega Game Video (KGV1) file, an attacker
  could cause a denial of service via application crash, or possibly execute
  arbitrary code with the privileges of the user invoking the program. This
  issue only affected Ubuntu 11.04 and Ubuntu 11.10. (CVE-2011-3945)

  Mateusz Jurczyk and Gynvael Coldwind discovered that Libav incorrectly
  handled certain malformed MJPEG-B files. If a user were tricked into
  opening a crafted MJPEG-B file, an attacker could cause a denial of service
  via application crash, or possibly execute arbitrary code with the
  privileges of the user invoking the program. This issue only affected
  Ubuntu 11.04 and Ubuntu 11.10. (CVE-2011-3947)

  Mateusz Jurczyk and Gynvael Coldwind discovered that Libav incorrectly
  handled certain malformed DPCM files. If a user were tricked into opening a
  crafted DPCM file, an attacker could cause a denial of service via
  application crash, or possibly execute arbitrary code with the privileges
  of the user invoking the program. This issue only affected Ubuntu 11.04 and
  Ubuntu 11.10. (CVE-2011-3951)

  Mateusz Jurczyk and Gynvael Coldwind discovered that Libav incorrectly
  handled certain malformed KMVC files. If a user were tricked into opening a
  crafted KMVC file, an attacker could cause a denial of service via
  application crash, or possibly execute arbitrary code with the privileges
  of the user invoking the program. This issue only affected Ubuntu 11.04 and
  Ubuntu 11.10. (CVE-2011-3952)

  Jeong Wook Oh discovered that Libav incorrectly handled certain malformed
  ASF files. If a user were tricked into  ...

  Description truncated, please see the referenced URL(s) for more information.");
  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");
  exit(0);
}


include("pkg-lib-deb.inc");

release = dpkg_get_ssh_release();

res = "";
if(release == NULL){
  exit(0);
}

if(release == "UBUNTU12.04 LTS")
{

  if ((res = isdpkgvuln(pkg:"libavcodec53", ver:"0.8.3-0ubuntu0.12.04.1", rls:"UBUNTU12.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"libavformat53", ver:"0.8.3-0ubuntu0.12.04.1", rls:"UBUNTU12.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}


if(release == "UBUNTU11.10")
{

  if ((res = isdpkgvuln(pkg:"libavcodec53", ver:"0.7.6-0ubuntu0.11.10.1", rls:"UBUNTU11.10")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"libavformat53", ver:"0.7.6-0ubuntu0.11.10.1", rls:"UBUNTU11.10")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}


if(release == "UBUNTU11.04")
{

  if ((res = isdpkgvuln(pkg:"libavcodec52", ver:"0.6.6-0ubuntu0.11.04.1", rls:"UBUNTU11.04")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"libavformat52", ver:"0.6.6-0ubuntu0.11.04.1", rls:"UBUNTU11.04")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
