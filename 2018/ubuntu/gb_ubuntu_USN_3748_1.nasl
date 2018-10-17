###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ubuntu_USN_3748_1.nasl 11236 2018-09-05 09:02:10Z cfischer $
#
# Ubuntu Update for base-files USN-3748-1
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
  script_oid("1.3.6.1.4.1.25623.1.0.843623");
  script_version("$Revision: 11236 $");
  script_tag(name:"last_modification", value:"$Date: 2018-09-05 11:02:10 +0200 (Wed, 05 Sep 2018) $");
  script_tag(name:"creation_date", value:"2018-08-22 06:46:12 +0200 (Wed, 22 Aug 2018)");
  script_cve_id("CVE-2018-6557");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:N");
  script_tag(name:"qod_type", value:"package");
  script_name("Ubuntu Update for base-files USN-3748-1");
  script_tag(name:"summary", value:"Check the version of base-files");
  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");
  script_tag(name:"insight", value:"Sander Bos discovered that the MOTD update script incorrectly handled
temporary files. A local attacker could use this issue to cause a denial of
service, or possibly escalate privileges if kernel symlink restrictions
were disabled.");
  script_tag(name:"affected", value:"base-files on Ubuntu 18.04 LTS");
  script_tag(name:"solution", value:"Please install the updated packages.");

  script_xref(name:"USN", value:"3748-1");
  script_xref(name:"URL", value:"http://www.ubuntu.com/usn/usn-3748-1/");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
  script_family("Ubuntu Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/ubuntu_linux", "ssh/login/packages", re:"ssh/login/release=UBUNTU18\.04 LTS");
  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

release = dpkg_get_ssh_release();

res = "";
if(release == NULL){
  exit(0);
}

if(release == "UBUNTU18.04 LTS")
{

  if ((res = isdpkgvuln(pkg:"base-files", ver:"10.1ubuntu2.2", rls:"UBUNTU18.04 LTS", remove_arch:TRUE )) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
