###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ubuntu_USN_1284_2.nasl 11037 2018-08-17 11:51:16Z cfischer $
#
# Ubuntu Update for update-manager USN-1284-2
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
  script_xref(name:"URL", value:"http://www.ubuntu.com/usn/usn-1284-2/");
  script_oid("1.3.6.1.4.1.25623.1.0.840901");
  script_version("$Revision: 11037 $");
  script_tag(name:"last_modification", value:"$Date: 2018-08-17 13:51:16 +0200 (Fri, 17 Aug 2018) $");
  script_tag(name:"creation_date", value:"2012-02-21 19:00:18 +0530 (Tue, 21 Feb 2012)");
  script_cve_id("CVE-2011-3152", "CVE-2011-3154");
  script_tag(name:"cvss_base", value:"6.4");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:N");
  script_xref(name:"USN", value:"1284-2");
  script_name("Ubuntu Update for update-manager USN-1284-2");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2012 Greenbone Networks GmbH");
  script_family("Ubuntu Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/ubuntu_linux", "ssh/login/packages", re:"ssh/login/release=UBUNTU(10\.10|10\.04 LTS|11\.04|8\.04 LTS)");
  script_tag(name:"summary", value:"Ubuntu Update for Linux kernel vulnerabilities USN-1284-2");
  script_tag(name:"affected", value:"update-manager on Ubuntu 11.04,
  Ubuntu 10.10,
  Ubuntu 10.04 LTS,
  Ubuntu 8.04 LTS");
  script_tag(name:"solution", value:"Please Install the Updated Packages.");
  script_tag(name:"insight", value:"USN-1284-1 fixed vulnerabilities in Update Manager. One of the fixes
  introduced a regression for Kubuntu users attempting to upgrade to a newer
  Ubuntu release. This update fixes the problem.

  We apologize for the inconvenience.

  Original advisory details:

  David Black discovered that Update Manager incorrectly extracted the
  downloaded upgrade tarball before verifying its GPG signature. If a remote
  attacker were able to perform a man-in-the-middle attack, this flaw could
  potentially be used to replace arbitrary files. (CVE-2011-3152)

  David Black discovered that Update Manager created a temporary directory
  in an insecure fashion. A local attacker could possibly use this flaw to
  read the XAUTHORITY file of the user performing the upgrade.
  (CVE-2011-3154)

  This update also adds a hotfix to Update Notifier to handle cases where the
  upgrade is being performed from CD media.");
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

if(release == "UBUNTU10.10")
{

  if ((res = isdpkgvuln(pkg:"update-manager-core", ver:"0.142.23.2", rls:"UBUNTU10.10")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}


if(release == "UBUNTU10.04 LTS")
{

  if ((res = isdpkgvuln(pkg:"update-manager-core", ver:"0.134.11.2", rls:"UBUNTU10.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}


if(release == "UBUNTU11.04")
{

  if ((res = isdpkgvuln(pkg:"update-manager-core", ver:"0.150.5.2", rls:"UBUNTU11.04")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}


if(release == "UBUNTU8.04 LTS")
{

  if ((res = isdpkgvuln(pkg:"update-manager-core", ver:"0.87.33", rls:"UBUNTU8.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
