###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ubuntu_USN_2319_1.nasl 11037 2018-08-17 11:51:16Z cfischer $
#
# Ubuntu Update for openjdk-7 USN-2319-1
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
  script_oid("1.3.6.1.4.1.25623.1.0.841936");
  script_version("$Revision: 11037 $");
  script_tag(name:"last_modification", value:"$Date: 2018-08-17 13:51:16 +0200 (Fri, 17 Aug 2018) $");
  script_tag(name:"creation_date", value:"2014-08-20 05:55:53 +0200 (Wed, 20 Aug 2014)");
  script_cve_id("CVE-2014-2483", "CVE-2014-2490", "CVE-2014-4216", "CVE-2014-4219",
                "CVE-2014-4223", "CVE-2014-4262", "CVE-2014-4209", "CVE-2014-4244",
                "CVE-2014-4263", "CVE-2014-4218", "CVE-2014-4266", "CVE-2014-4264",
                "CVE-2014-4221", "CVE-2014-4252", "CVE-2014-4268");
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_name("Ubuntu Update for openjdk-7 USN-2319-1");


  script_tag(name:"affected", value:"openjdk-7 on Ubuntu 14.04 LTS");
  script_tag(name:"insight", value:"Several vulnerabilities were discovered in the OpenJDK JRE
related to information disclosure, data integrity and availability. An attacker
could exploit these to cause a denial of service or expose sensitive data over
the network. (CVE-2014-2483, CVE-2014-2490, CVE-2014-4216, CVE-2014-4219,
CVE-2014-4223, CVE-2014-4262)

Several vulnerabilities were discovered in the OpenJDK JRE related to
information disclosure and data integrity. An attacker could exploit these
to expose sensitive data over the network. (CVE-2014-4209, CVE-2014-4244,
CVE-2014-4263)

Two vulnerabilities were discovered in the OpenJDK JRE related to data
integrity. (CVE-2014-4218, CVE-2014-4266)

A vulnerability was discovered in the OpenJDK JRE related to availability.
An attacker could exploit this to cause a denial of service.
(CVE-2014-4264)

Several vulnerabilities were discovered in the OpenJDK JRE related to
information disclosure. An attacker could exploit these to expose sensitive
data over the network. (CVE-2014-4221, CVE-2014-4252, CVE-2014-4268)");
  script_tag(name:"solution", value:"Please Install the Updated Packages.");
  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");
  script_xref(name:"USN", value:"2319-1");
  script_xref(name:"URL", value:"http://www.ubuntu.com/usn/usn-2319-1/");
  script_tag(name:"summary", value:"Check for the Version of openjdk-7");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2014 Greenbone Networks GmbH");
  script_family("Ubuntu Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/ubuntu_linux", "ssh/login/packages", re:"ssh/login/release=UBUNTU14\.04 LTS");
  exit(0);
}


include("pkg-lib-deb.inc");

release = dpkg_get_ssh_release();

res = "";
if(release == NULL){
  exit(0);
}

if(release == "UBUNTU14.04 LTS")
{

  if ((res = isdpkgvuln(pkg:"icedtea-7-jre-jamvm:i386", ver:"7u65-2.5.1-4ubuntu1~0.14.04.1", rls:"UBUNTU14.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"openjdk-7-jre:i386", ver:"7u65-2.5.1-4ubuntu1~0.14.04.1", rls:"UBUNTU14.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"openjdk-7-jre-headless:i386", ver:"7u65-2.5.1-4ubuntu1~0.14.04.1", rls:"UBUNTU14.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"openjdk-7-jre-lib", ver:"7u65-2.5.1-4ubuntu1~0.14.04.1", rls:"UBUNTU14.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"openjdk-7-jre-zero:i386", ver:"7u65-2.5.1-4ubuntu1~0.14.04.1", rls:"UBUNTU14.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
