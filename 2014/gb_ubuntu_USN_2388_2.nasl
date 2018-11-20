###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ubuntu_USN_2388_2.nasl 12381 2018-11-16 11:16:30Z cfischer $
#
# Ubuntu Update for openjdk-7 USN-2388-2
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
  script_oid("1.3.6.1.4.1.25623.1.0.842026");
  script_version("$Revision: 12381 $");
  script_tag(name:"last_modification", value:"$Date: 2018-11-16 12:16:30 +0100 (Fri, 16 Nov 2018) $");
  script_tag(name:"creation_date", value:"2014-11-11 06:22:50 +0100 (Tue, 11 Nov 2014)");
  script_cve_id("CVE-2014-6457", "CVE-2014-6502", "CVE-2014-6512", "CVE-2014-6519",
                "CVE-2014-6527", "CVE-2014-6558", "CVE-2014-6504", "CVE-2014-6511",
                "CVE-2014-6517", "CVE-2014-6531", "CVE-2014-6506", "CVE-2014-6513");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_name("Ubuntu Update for openjdk-7 USN-2388-2");
  script_tag(name:"summary", value:"The remote host is missing an update for the 'openjdk-7'
  package(s) announced via the referenced advisory.");
  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"USN-2388-1 fixed vulnerabilities in OpenJDK 7
for Ubuntu 14.04 LTS. This update provides the corresponding updates for
Ubuntu 14.10.

Original advisory details:

A vulnerability was discovered in the OpenJDK JRE related to information
disclosure and data integrity. An attacker could exploit this to expose
sensitive data over the network. (CVE-2014-6457)

Several vulnerabilities were discovered in the OpenJDK JRE related to data
integrity. (CVE-2014-6502, CVE-2014-6512, CVE-2014-6519, CVE-2014-6527,
CVE-2014-6558)

Several vulnerabilities were discovered in the OpenJDK JRE related to
information disclosure. An attacker could exploit these to expose sensitive
data over the network. (CVE-2014-6504, CVE-2014-6511, CVE-2014-6517,
CVE-2014-6531)

Two vulnerabilities were discovered in the OpenJDK JRE related to
information disclosure, data integrity and availability. An attacker could
exploit these to cause a denial of service or expose sensitive data over
the network. (CVE-2014-6506, CVE-2014-6513)");
  script_tag(name:"affected", value:"openjdk-7 on Ubuntu 14.10");
  script_tag(name:"solution", value:"Please Install the Updated Packages.");
  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");
  script_xref(name:"USN", value:"2388-2");
  script_xref(name:"URL", value:"http://www.ubuntu.com/usn/usn-2388-2/");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2014 Greenbone Networks GmbH");
  script_family("Ubuntu Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/ubuntu_linux", "ssh/login/packages", re:"ssh/login/release=UBUNTU14\.10");
  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

release = dpkg_get_ssh_release();

res = "";
if(release == NULL){
  exit(0);
}

if(release == "UBUNTU14.10")
{

  if ((res = isdpkgvuln(pkg:"icedtea-7-jre-jamvm:amd64", ver:"7u71-2.5.3-0ubuntu1", rls:"UBUNTU14.10")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"icedtea-7-jre-jamvm:i386", ver:"7u71-2.5.3-0ubuntu1", rls:"UBUNTU14.10")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"openjdk-7-jre:amd64", ver:"7u71-2.5.3-0ubuntu1", rls:"UBUNTU14.10")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"openjdk-7-jre:i386", ver:"7u71-2.5.3-0ubuntu1", rls:"UBUNTU14.10")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"openjdk-7-jre-headless:amd64", ver:"7u71-2.5.3-0ubuntu1", rls:"UBUNTU14.10")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"openjdk-7-jre-headless:i386", ver:"7u71-2.5.3-0ubuntu1", rls:"UBUNTU14.10")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"openjdk-7-jre-lib", ver:"7u71-2.5.3-0ubuntu1", rls:"UBUNTU14.10")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"openjdk-7-jre-zero:amd64", ver:"7u71-2.5.3-0ubuntu1", rls:"UBUNTU14.10")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"openjdk-7-jre-zero:i386", ver:"7u71-2.5.3-0ubuntu1", rls:"UBUNTU14.10")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
