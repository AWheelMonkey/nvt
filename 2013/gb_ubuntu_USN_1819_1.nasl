###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ubuntu_USN_1819_1.nasl 12381 2018-11-16 11:16:30Z cfischer $
#
# Ubuntu Update for openjdk-6 USN-1819-1
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
  script_oid("1.3.6.1.4.1.25623.1.0.841421");
  script_version("$Revision: 12381 $");
  script_tag(name:"last_modification", value:"$Date: 2018-11-16 12:16:30 +0100 (Fri, 16 Nov 2018) $");
  script_tag(name:"creation_date", value:"2013-05-09 10:26:30 +0530 (Thu, 09 May 2013)");
  script_cve_id("CVE-2013-0401", "CVE-2013-1488", "CVE-2013-1518", "CVE-2013-1537",
                "CVE-2013-1557", "CVE-2013-1558", "CVE-2013-1569", "CVE-2013-2383",
                "CVE-2013-2384", "CVE-2013-2420", "CVE-2013-2421", "CVE-2013-2422",
                "CVE-2013-2426", "CVE-2013-2429", "CVE-2013-2430", "CVE-2013-2431",
                "CVE-2013-2436", "CVE-2013-2415", "CVE-2013-2424", "CVE-2013-2417",
                "CVE-2013-2419");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_name("Ubuntu Update for openjdk-6 USN-1819-1");

  script_xref(name:"USN", value:"1819-1");
  script_xref(name:"URL", value:"http://www.ubuntu.com/usn/usn-1819-1/");
  script_tag(name:"summary", value:"The remote host is missing an update for the 'openjdk-6'
  package(s) announced via the referenced advisory.");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2013 Greenbone Networks GmbH");
  script_family("Ubuntu Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/ubuntu_linux", "ssh/login/packages", re:"ssh/login/release=UBUNTU(12\.04 LTS|11\.10|10\.04 LTS)");
  script_tag(name:"affected", value:"openjdk-6 on Ubuntu 12.04 LTS,
  Ubuntu 11.10,
  Ubuntu 10.04 LTS");
  script_tag(name:"solution", value:"Please Install the Updated Packages.");
  script_tag(name:"insight", value:"Ben Murphy discovered a vulnerability in the OpenJDK JRE related to
  information disclosure and data integrity. An attacker could exploit this
  to execute arbitrary code. (CVE-2013-0401)

  James Forshaw discovered a vulnerability in the OpenJDK JRE related to
  information disclosure, data integrity and availability. An attacker could
  exploit this to execute arbitrary code. (CVE-2013-1488)

  Several vulnerabilities were discovered in the OpenJDK JRE related to
  information disclosure, data integrity and availability. An attacker could
  exploit these to cause a denial of service or expose sensitive data over
  the network. (CVE-2013-1518, CVE-2013-1537, CVE-2013-1557, CVE-2013-1558,
  CVE-2013-1569, CVE-2013-2383, CVE-2013-2384, CVE-2013-2420, CVE-2013-2421,
  CVE-2013-2422, CVE-2013-2426, CVE-2013-2429, CVE-2013-2430, CVE-2013-2431,
  CVE-2013-2436)

  Two vulnerabilities were discovered in the OpenJDK JRE related to
  confidentiality. An attacker could exploit these to expose sensitive data
  over the network. (CVE-2013-2415, CVE-2013-2424)

  Two vulnerabilities were discovered in the OpenJDK JRE related to
  availability. An attacker could exploit these to cause a denial of service.
  (CVE-2013-2417, CVE-2013-2419)");
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

  if ((res = isdpkgvuln(pkg:"icedtea-6-jre-cacao", ver:"6b27-1.12.5-0ubuntu0.12.04.1", rls:"UBUNTU12.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"icedtea-6-jre-jamvm", ver:"6b27-1.12.5-0ubuntu0.12.04.1", rls:"UBUNTU12.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"openjdk-6-jre", ver:"6b27-1.12.5-0ubuntu0.12.04.1", rls:"UBUNTU12.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"openjdk-6-jre-headless", ver:"6b27-1.12.5-0ubuntu0.12.04.1", rls:"UBUNTU12.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"openjdk-6-jre-lib", ver:"6b27-1.12.5-0ubuntu0.12.04.1", rls:"UBUNTU12.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"openjdk-6-jre-zero", ver:"6b27-1.12.5-0ubuntu0.12.04.1", rls:"UBUNTU12.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}


if(release == "UBUNTU11.10")
{

  if ((res = isdpkgvuln(pkg:"icedtea-6-jre-cacao", ver:"6b27-1.12.5-0ubuntu0.11.10.1", rls:"UBUNTU11.10")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"icedtea-6-jre-jamvm", ver:"6b27-1.12.5-0ubuntu0.11.10.1", rls:"UBUNTU11.10")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"openjdk-6-jre", ver:"6b27-1.12.5-0ubuntu0.11.10.1", rls:"UBUNTU11.10")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"openjdk-6-jre-headless", ver:"6b27-1.12.5-0ubuntu0.11.10.1", rls:"UBUNTU11.10")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"openjdk-6-jre-lib", ver:"6b27-1.12.5-0ubuntu0.11.10.1", rls:"UBUNTU11.10")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"openjdk-6-jre-zero", ver:"6b27-1.12.5-0ubuntu0.11.10.1", rls:"UBUNTU11.10")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}


if(release == "UBUNTU10.04 LTS")
{

  if ((res = isdpkgvuln(pkg:"icedtea-6-jre-cacao", ver:"6b27-1.12.5-0ubuntu0.10.04.1", rls:"UBUNTU10.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"openjdk-6-jre", ver:"6b27-1.12.5-0ubuntu0.10.04.1", rls:"UBUNTU10.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"openjdk-6-jre-headless", ver:"6b27-1.12.5-0ubuntu0.10.04.1", rls:"UBUNTU10.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"openjdk-6-jre-lib", ver:"6b27-1.12.5-0ubuntu0.10.04.1", rls:"UBUNTU10.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"openjdk-6-jre-zero", ver:"6b27-1.12.5-0ubuntu0.10.04.1", rls:"UBUNTU10.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
