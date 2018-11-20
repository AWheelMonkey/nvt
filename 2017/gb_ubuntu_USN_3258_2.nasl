###############################################################################
# OpenVAS Vulnerability Test
#
# Ubuntu Update for dovecot USN-3258-2
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
  script_oid("1.3.6.1.4.1.25623.1.0.843131");
  script_version("$Revision: 12381 $");
  script_tag(name:"last_modification", value:"$Date: 2018-11-16 12:16:30 +0100 (Fri, 16 Nov 2018) $");
  script_tag(name:"creation_date", value:"2017-04-12 06:32:48 +0200 (Wed, 12 Apr 2017)");
  script_cve_id("CVE-2017-2669");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:P");
  script_tag(name:"qod_type", value:"package");
  script_name("Ubuntu Update for dovecot USN-3258-2");
  script_tag(name:"summary", value:"The remote host is missing an update for the 'dovecot'
  package(s) announced via the referenced advisory.");
  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");
  script_tag(name:"insight", value:"USN-3258-1 intended to fix a vulnerability
  in Dovecot. Further investigation revealed that only Dovecot versions 2.2.26 and
  newer were affected by the vulnerability. Additionally, the change introduced a
  regression when Dovecot was configured to use the 'dict' authentication
  database. This update reverts the change. We apologize for the inconvenience.
  Original advisory details: It was discovered that Dovecot incorrectly handled
  some usernames. An attacker could possibly use this issue to cause Dovecot to
  hang or crash, resulting in a denial of service.");
  script_tag(name:"affected", value:"dovecot on Ubuntu 16.10,
  Ubuntu 16.04 LTS");
  script_tag(name:"solution", value:"Please Install the Updated Packages.");

  script_xref(name:"USN", value:"3258-2");
  script_xref(name:"URL", value:"http://www.ubuntu.com/usn/usn-3258-2/");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("Ubuntu Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/ubuntu_linux", "ssh/login/packages", re:"ssh/login/release=UBUNTU(16\.10|16\.04 LTS)");
  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

release = dpkg_get_ssh_release();

res = "";
if(release == NULL){
  exit(0);
}

if(release == "UBUNTU16.10")
{

  if ((res = isdpkgvuln(pkg:"dovecot-core", ver:"1:2.2.24-1ubuntu1.3", rls:"UBUNTU16.10")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}


if(release == "UBUNTU16.04 LTS")
{

  if ((res = isdpkgvuln(pkg:"dovecot-core", ver:"1:2.2.22-1ubuntu2.4", rls:"UBUNTU16.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}