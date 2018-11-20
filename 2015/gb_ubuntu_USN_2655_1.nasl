###############################################################################
# OpenVAS Vulnerability Test
#
# Ubuntu Update for tomcat6 USN-2655-1
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (C) 2015 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.842262");
  script_version("$Revision: 12381 $");
  script_tag(name:"last_modification", value:"$Date: 2018-11-16 12:16:30 +0100 (Fri, 16 Nov 2018) $");
  script_tag(name:"creation_date", value:"2015-06-26 06:25:12 +0200 (Fri, 26 Jun 2015)");
  script_cve_id("CVE-2014-0227", "CVE-2014-0230", "CVE-2014-7810");
  script_tag(name:"cvss_base", value:"7.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:C");
  script_tag(name:"qod_type", value:"package");
  script_name("Ubuntu Update for tomcat6 USN-2655-1");
  script_tag(name:"summary", value:"The remote host is missing an update for the 'tomcat6'
  package(s) announced via the referenced advisory.");
  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");
  script_tag(name:"insight", value:"It was discovered that Tomcat incorrectly
handled data with malformed chunked transfer coding. A remote attacker could
possibly use this issue to conduct HTTP request smuggling attacks, or cause
Tomcat to consume resources, resulting in a denial of service. (CVE-2014-0227)

It was discovered that Tomcat incorrectly handled HTTP responses occurring
before the entire request body was finished being read. A remote attacker
could possibly use this issue to cause memory consumption, resulting in a
denial of service. (CVE-2014-0230)

It was discovered that the Tomcat Expression Language (EL) implementation
incorrectly handled accessible interfaces implemented by inaccessible
classes. An attacker could possibly use this issue to bypass a
SecurityManager protection mechanism. (CVE-2014-7810)");
  script_tag(name:"affected", value:"tomcat6 on Ubuntu 12.04 LTS");
  script_tag(name:"solution", value:"Please Install the Updated Packages.");
  script_xref(name:"USN", value:"2655-1");
  script_xref(name:"URL", value:"http://www.ubuntu.com/usn/usn-2655-1/");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2015 Greenbone Networks GmbH");
  script_family("Ubuntu Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/ubuntu_linux", "ssh/login/packages", re:"ssh/login/release=UBUNTU12\.04 LTS");
  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

release = dpkg_get_ssh_release();

res = "";
if(release == NULL){
  exit(0);
}

if(release == "UBUNTU12.04 LTS")
{

  if ((res = isdpkgvuln(pkg:"libtomcat6-java", ver:"6.0.35-1ubuntu3.6", rls:"UBUNTU12.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
