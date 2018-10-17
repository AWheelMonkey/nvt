###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ubuntu_USN_1209_1.nasl 11037 2018-08-17 11:51:16Z cfischer $
#
# Ubuntu Update for ffmpeg USN-1209-1
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (c) 2011 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_xref(name:"URL", value:"http://www.ubuntu.com/usn/usn-1209-1/");
  script_oid("1.3.6.1.4.1.25623.1.0.840750");
  script_version("$Revision: 11037 $");
  script_tag(name:"last_modification", value:"$Date: 2018-08-17 13:51:16 +0200 (Fri, 17 Aug 2018) $");
  script_tag(name:"creation_date", value:"2011-09-23 16:39:49 +0200 (Fri, 23 Sep 2011)");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_xref(name:"USN", value:"1209-1");
  script_cve_id("CVE-2011-1196", "CVE-2011-1931", "CVE-2011-2161", "CVE-2011-3362");
  script_name("Ubuntu Update for ffmpeg USN-1209-1");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2011 Greenbone Networks GmbH");
  script_family("Ubuntu Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/ubuntu_linux", "ssh/login/packages", re:"ssh/login/release=UBUNTU(10\.04 LTS|10\.10)");
  script_tag(name:"summary", value:"Ubuntu Update for Linux kernel vulnerabilities USN-1209-1");
  script_tag(name:"affected", value:"ffmpeg on Ubuntu 10.10,
  Ubuntu 10.04 LTS");
  script_tag(name:"solution", value:"Please Install the Updated Packages.");
  script_tag(name:"insight", value:"It was discovered that FFmpeg incorrectly handled certain malformed ogg
  files. If a user were tricked into opening a crafted ogg file, an attacker
  could cause a denial of service via application crash, or possibly execute
  arbitrary code with the privileges of the user invoking the program. This
  issue only affected Ubuntu 10.10. (CVE-2011-1196)

  It was discovered that FFmpeg incorrectly handled certain malformed AMV
  files. If a user were tricked into opening a crafted AMV file, an attacker
  could cause a denial of service via application crash, or possibly execute
  arbitrary code with the privileges of the user invoking the program. This
  issue only affected Ubuntu 10.10. (CVE-2011-1931)

  It was discovered that FFmpeg incorrectly handled certain malformed APE
  files. If a user were tricked into opening a crafted APE file, an attacker
  could cause a denial of service via application crash. (CVE-2011-2161)

  Emmanouel Kellinis discovered that FFmpeg incorrectly handled certain
  malformed CAVS files. If a user were tricked into opening a crafted CAVS
  file, an attacker could cause a denial of service via application crash, or
  possibly execute arbitrary code with the privileges of the user invoking
  the program. (CVE-2011-3362)");
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

if(release == "UBUNTU10.04 LTS")
{

  if ((res = isdpkgvuln(pkg:"libavcodec52", ver:"4:0.5.1-1ubuntu1.2", rls:"UBUNTU10.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"libavformat52", ver:"4:0.5.1-1ubuntu1.2", rls:"UBUNTU10.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}


if(release == "UBUNTU10.10")
{

  if ((res = isdpkgvuln(pkg:"libavcodec52", ver:"4:0.6-2ubuntu6.2", rls:"UBUNTU10.10")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"libavformat52", ver:"4:0.6-2ubuntu6.2", rls:"UBUNTU10.10")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
