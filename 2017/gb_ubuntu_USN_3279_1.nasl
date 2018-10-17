###############################################################################
# OpenVAS Vulnerability Test
#
# Ubuntu Update for apache2 USN-3279-1
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
  script_oid("1.3.6.1.4.1.25623.1.0.843156");
  script_version("$Revision: 11037 $");
  script_tag(name:"last_modification", value:"$Date: 2018-08-17 13:51:16 +0200 (Fri, 17 Aug 2018) $");
  script_tag(name:"creation_date", value:"2017-05-10 06:53:55 +0200 (Wed, 10 May 2017)");
  script_cve_id("CVE-2016-0736", "CVE-2016-2161", "CVE-2016-8743");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:N");
  script_tag(name:"qod_type", value:"package");
  script_name("Ubuntu Update for apache2 USN-3279-1");
  script_tag(name:"summary", value:"Check the version of apache2");
  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");
  script_tag(name:"insight", value:"It was discovered that the Apache
mod_session_crypto module was encrypting data and cookies using either CBC or
ECB modes. A remote attacker could possibly use this issue to perform padding
oracle attacks. (CVE-2016-0736)

Maksim Malyutin discovered that the Apache mod_auth_digest module
incorrectly handled malicious input. A remote attacker could possibly use
this issue to cause Apache to crash, resulting in a denial of service.
(CVE-2016-2161)

David Dennerline and R&#233 gis Leroy discovered that the Apache HTTP Server
incorrectly handled unusual whitespace when parsing requests, contrary to
specifications. When being used in combination with a proxy or backend
server, a remote attacker could possibly use this issue to perform an
injection attack and pollute cache. This update may introduce compatibility
issues with clients that do not strictly follow HTTP protocol
specifications. A new configuration option 'HttpProtocolOptions Unsafe' can
be used to revert to the previous unsafe behaviour in problematic
environments. (CVE-2016-8743)");
  script_tag(name:"affected", value:"apache2 on Ubuntu 16.10,
  Ubuntu 16.04 LTS,
  Ubuntu 14.04 LTS");
  script_tag(name:"solution", value:"Please Install the Updated Packages.");

  script_xref(name:"USN", value:"3279-1");
  script_xref(name:"URL", value:"https://www.ubuntu.com/usn/usn-3279-1");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("Ubuntu Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/ubuntu_linux", "ssh/login/packages", re:"ssh/login/release=UBUNTU(14\.04 LTS|16\.10|16\.04 LTS)");
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

  if ((res = isdpkgvuln(pkg:"apache2-bin", ver:"2.4.7-1ubuntu4.14", rls:"UBUNTU14.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}


if(release == "UBUNTU16.10")
{

  if ((res = isdpkgvuln(pkg:"apache2-bin", ver:"2.4.18-2ubuntu4.1", rls:"UBUNTU16.10")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}


if(release == "UBUNTU16.04 LTS")
{

  if ((res = isdpkgvuln(pkg:"apache2-bin", ver:"2.4.18-2ubuntu3.2", rls:"UBUNTU16.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
