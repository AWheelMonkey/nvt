###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ubuntu_USN_3686_1.nasl 12381 2018-11-16 11:16:30Z cfischer $
#
# Ubuntu Update for file USN-3686-1
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (C) 2018 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.843561");
  script_version("$Revision: 12381 $");
  script_tag(name:"last_modification", value:"$Date: 2018-11-16 12:16:30 +0100 (Fri, 16 Nov 2018) $");
  script_tag(name:"creation_date", value:"2018-06-15 05:47:38 +0200 (Fri, 15 Jun 2018)");
  script_cve_id("CVE-2014-9620", "CVE-2014-9653", "CVE-2015-8865", "CVE-2018-10360",
                "CVE-2014-9621");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_tag(name:"qod_type", value:"package");
  script_name("Ubuntu Update for file USN-3686-1");
  script_tag(name:"summary", value:"The remote host is missing an update for the 'file'
  package(s) announced via the referenced advisory.");
  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");
  script_tag(name:"insight", value:"Alexander Cherepanov discovered that
file incorrectly handled a large number of notes. An attacker could use
this issue to cause a denial of service. This issue only affected Ubuntu
14.04 LTS. (CVE-2014-9620)

Alexander Cherepanov discovered that file incorrectly handled certain long
strings. An attacker could use this issue to cause a denial of service.
This issue only affected Ubuntu 14.04 LTS. (CVE-2014-9620)

Alexander Cherepanov discovered that file incorrectly handled certain
malformed ELF files. An attacker could use this issue to cause a denial of
service, or possibly execute arbitrary code. This issue only affected
Ubuntu 14.04 LTS. (CVE-2014-9653)

It was discovered that file incorrectly handled certain magic files. An
attacker could use this issue with a specially crafted magic file to cause
a denial of service, or possibly execute arbitrary code. This issue only
affected Ubuntu 14.04 LTS. (CVE-2015-8865)

It was discovered that file incorrectly handled certain malformed ELF
files. An attacker could use this issue to cause a denial of service.
(CVE-2018-10360)");
  script_tag(name:"affected", value:"file on Ubuntu 18.04 LTS,
  Ubuntu 17.10,
  Ubuntu 16.04 LTS,
  Ubuntu 14.04 LTS");
  script_tag(name:"solution", value:"Please install the updated packages.");

  script_xref(name:"USN", value:"3686-1");
  script_xref(name:"URL", value:"http://www.ubuntu.com/usn/usn-3686-1/");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
  script_family("Ubuntu Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/ubuntu_linux", "ssh/login/packages", re:"ssh/login/release=UBUNTU(14\.04 LTS|17\.10|18\.04 LTS|16\.04 LTS)");
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

  if ((res = isdpkgvuln(pkg:"file", ver:"1:5.14-2ubuntu3.4", rls:"UBUNTU14.04 LTS", remove_arch:TRUE )) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"libmagic1", ver:"1:5.14-2ubuntu3.4", rls:"UBUNTU14.04 LTS", remove_arch:TRUE )) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}


if(release == "UBUNTU17.10")
{

  if ((res = isdpkgvuln(pkg:"file", ver:"1:5.32-1ubuntu0.1", rls:"UBUNTU17.10", remove_arch:TRUE )) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"libmagic1", ver:"1:5.32-1ubuntu0.1", rls:"UBUNTU17.10", remove_arch:TRUE )) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}


if(release == "UBUNTU18.04 LTS")
{

  if ((res = isdpkgvuln(pkg:"file", ver:"1:5.32-2ubuntu0.1", rls:"UBUNTU18.04 LTS", remove_arch:TRUE )) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"libmagic1", ver:"1:5.32-2ubuntu0.1", rls:"UBUNTU18.04 LTS", remove_arch:TRUE )) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}


if(release == "UBUNTU16.04 LTS")
{

  if ((res = isdpkgvuln(pkg:"file", ver:"1:5.25-2ubuntu1.1", rls:"UBUNTU16.04 LTS", remove_arch:TRUE )) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"libmagic1", ver:"1:5.25-2ubuntu1.1", rls:"UBUNTU16.04 LTS", remove_arch:TRUE )) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
