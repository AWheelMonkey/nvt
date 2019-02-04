###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ubuntu_USN_3834_1.nasl 12938 2019-01-04 07:18:11Z asteins $
#
# Ubuntu Update for perl USN-3834-1
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (C) 2018 Greenbone Networks GmbH, http://www.greenbone.net
# Text descriptions are largely excerpted from the referenced
# advisory, and are Copyright (c) the respective author(s)
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
  script_oid("1.3.6.1.4.1.25623.1.0.843844");
  script_version("$Revision: 12938 $");
  script_cve_id("CVE-2018-18311", "CVE-2018-18312", "CVE-2018-18313", "CVE-2018-18314");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_tag(name:"last_modification", value:"$Date: 2019-01-04 08:18:11 +0100 (Fri, 04 Jan 2019) $");
  script_tag(name:"creation_date", value:"2018-12-04 07:53:49 +0100 (Tue, 04 Dec 2018)");
  script_name("Ubuntu Update for perl USN-3834-1");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
  script_family("Ubuntu Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/ubuntu_linux", "ssh/login/packages", re:"ssh/login/release=UBUNTU(14\.04 LTS|18\.04 LTS|18\.10|16\.04 LTS)");

  script_xref(name:"USN", value:"3834-1");
  script_xref(name:"URL", value:"https://lists.ubuntu.com/archives/ubuntu-security-announce/2018-December/004691.html");

  script_tag(name:"summary", value:"The remote host is missing an update for the 'perl'
  package(s) announced via the USN-3834-1 advisory.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable package version is present on the target host.");

  script_tag(name:"insight", value:"Jayakrishna Menon discovered that Perl incorrectly handled Perl_my_setenv.
An attacker could use this issue to cause Perl to crash, resulting in a
denial of service, or possibly execute arbitrary code. (CVE-2018-18311)

Eiichi Tsukata discovered that Perl incorrectly handled certain regular
expressions. An attacker could use this issue to cause Perl to crash,
resulting in a denial of service, or possibly execute arbitrary code. This
issue only affected Ubuntu 16.04 LTS, Ubuntu 18.04 LTS, and Ubuntu 18.10.
(CVE-2018-18312)

Eiichi Tsukata discovered that Perl incorrectly handled certain regular
expressions. An attacker could use this issue to cause Perl to crash,
resulting in a denial of service. (CVE-2018-18313)

Jakub Wilk discovered that Perl incorrectly handled certain regular
expressions. An attacker could use this issue to cause Perl to crash,
resulting in a denial of service. This issue only affected Ubuntu 16.04
LTS, Ubuntu 18.04 LTS, and Ubuntu 18.10. (CVE-2018-18314)");

  script_tag(name:"affected", value:"perl on Ubuntu 18.10,
  Ubuntu 18.04 LTS,
  Ubuntu 16.04 LTS,
  Ubuntu 14.04 LTS.");

  script_tag(name:"solution", value:"Please install the updated package(s).");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"package");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

release = dpkg_get_ssh_release();
if(!release) exit(0);

res = "";

if(release == "UBUNTU14.04 LTS")
{

  if ((res = isdpkgvuln(pkg:"perl", ver:"5.18.2-2ubuntu1.7", rls:"UBUNTU14.04 LTS", remove_arch:TRUE )) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}


if(release == "UBUNTU18.04 LTS")
{

  if ((res = isdpkgvuln(pkg:"perl", ver:"5.26.1-6ubuntu0.3", rls:"UBUNTU18.04 LTS", remove_arch:TRUE )) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}


if(release == "UBUNTU18.10")
{

  if ((res = isdpkgvuln(pkg:"perl", ver:"5.26.2-7ubuntu0.1", rls:"UBUNTU18.10", remove_arch:TRUE )) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}


if(release == "UBUNTU16.04 LTS")
{

  if ((res = isdpkgvuln(pkg:"perl", ver:"5.22.1-9ubuntu0.6", rls:"UBUNTU16.04 LTS", remove_arch:TRUE )) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
