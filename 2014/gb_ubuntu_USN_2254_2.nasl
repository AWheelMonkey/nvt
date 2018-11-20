###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ubuntu_USN_2254_2.nasl 12381 2018-11-16 11:16:30Z cfischer $
#
# Ubuntu Update for php5 USN-2254-2
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
  script_oid("1.3.6.1.4.1.25623.1.0.841875");
  script_version("$Revision: 12381 $");
  script_tag(name:"last_modification", value:"$Date: 2018-11-16 12:16:30 +0100 (Fri, 16 Nov 2018) $");
  script_tag(name:"creation_date", value:"2014-07-01 22:22:18 +0530 (Tue, 01 Jul 2014)");
  script_cve_id("CVE-2014-0185", "CVE-2014-0237", "CVE-2014-0238", "CVE-2014-4049");
  script_tag(name:"cvss_base", value:"7.2");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:L/Au:N/C:C/I:C/A:C");
  script_name("Ubuntu Update for php5 USN-2254-2");


  script_tag(name:"affected", value:"php5 on Ubuntu 14.04 LTS,
  Ubuntu 13.10");
  script_tag(name:"insight", value:"USN-2254-1 fixed vulnerabilities in PHP. The fix for
CVE-2014-0185 further restricted the permissions on the PHP FastCGI Process
Manager (FPM) UNIX socket. This update grants socket access to the www-data
user and group so installations and documentation relying on the previous
socket permissions will continue to function.

Original advisory details:

Christian Hoffmann discovered that the PHP FastCGI Process Manager (FPM)
set incorrect permissions on the UNIX socket. A local attacker could use
this issue to possibly elevate their privileges. This issue only affected
Ubuntu 12.04 LTS, Ubuntu 13.10, and Ubuntu 14.04 LTS. (CVE-2014-0185)
Francisco Alonso discovered that the PHP Fileinfo component incorrectly
handled certain CDF documents. A remote attacker could use this issue to
cause PHP to hang or crash, resulting in a denial of service.
(CVE-2014-0237, CVE-2014-0238)
Stefan Esser discovered that PHP incorrectly handled DNS TXT records. A
remote attacker could use this issue to cause PHP to crash, resulting in a
denial of service, or possibly execute arbitrary code. (CVE-2014-4049)");
  script_tag(name:"solution", value:"Please Install the Updated Packages.");
  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");
  script_xref(name:"USN", value:"2254-2");
  script_xref(name:"URL", value:"http://www.ubuntu.com/usn/usn-2254-2/");
  script_tag(name:"summary", value:"The remote host is missing an update for the 'php5'
  package(s) announced via the referenced advisory.");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2014 Greenbone Networks GmbH");
  script_family("Ubuntu Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/ubuntu_linux", "ssh/login/packages", re:"ssh/login/release=UBUNTU(14\.04 LTS|13\.10)");
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

  if ((res = isdpkgvuln(pkg:"php5-fpm", ver:"5.5.9+dfsg-1ubuntu4.2", rls:"UBUNTU14.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}


if(release == "UBUNTU13.10")
{

  if ((res = isdpkgvuln(pkg:"php5-fpm", ver:"5.5.3+dfsg-1ubuntu2.5", rls:"UBUNTU13.10")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
