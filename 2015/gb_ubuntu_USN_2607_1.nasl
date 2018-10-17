###############################################################################
# OpenVAS Vulnerability Test
#
# Ubuntu Update for libmodule-signature-perl USN-2607-1
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
  script_oid("1.3.6.1.4.1.25623.1.0.842209");
  script_version("$Revision: 11037 $");
  script_tag(name:"last_modification", value:"$Date: 2018-08-17 13:51:16 +0200 (Fri, 17 Aug 2018) $");
  script_tag(name:"creation_date", value:"2015-06-09 11:05:18 +0200 (Tue, 09 Jun 2015)");
  script_cve_id("CVE-2015-3406", "CVE-2015-3407", "CVE-2015-3408", "CVE-2015-3409");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"qod_type", value:"package");
  script_name("Ubuntu Update for libmodule-signature-perl USN-2607-1");
  script_tag(name:"summary", value:"Check the version of libmodule-signature-perl");
  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");
  script_tag(name:"insight", value:"John Lightsey discovered that
Module::Signature incorrectly handled PGP signature boundaries. A remote attacker
could use this issue to trick Module::Signature into parsing the unsigned portion
of the SIGNATURE file as the signed portion. (CVE-2015-3406)

John Lightsey discovered that Module::Signature incorrectly handled files
that were not listed in the SIGNATURE file. A remote attacker could use
this flaw to execute arbitrary code when tests were run. (CVE-2015-3407)

John Lightsey discovered that Module::Signature incorrectly handled
embedded shell commands in the SIGNATURE file. A remote attacker could use
this issue to execute arbitrary code during signature verification.
(CVE-2015-3408)

John Lightsey discovered that Module::Signature incorrectly handled module
loading. A remote attacker could use this issue to execute arbitrary code
during signature verification. (CVE-2015-3409)");
  script_tag(name:"affected", value:"libmodule-signature-perl on Ubuntu 14.10,
  Ubuntu 14.04 LTS,
  Ubuntu 12.04 LTS");
  script_tag(name:"solution", value:"Please Install the Updated Packages.");
  script_xref(name:"USN", value:"2607-1");
  script_xref(name:"URL", value:"http://www.ubuntu.com/usn/usn-2607-1/");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2015 Greenbone Networks GmbH");
  script_family("Ubuntu Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/ubuntu_linux", "ssh/login/packages", re:"ssh/login/release=UBUNTU(14\.10|14\.04 LTS|12\.04 LTS)");
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

  if ((res = isdpkgvuln(pkg:"libmodule-signature-perl", ver:"0.73-1ubuntu0.14.10.1", rls:"UBUNTU14.10")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}


if(release == "UBUNTU14.04 LTS")
{

  if ((res = isdpkgvuln(pkg:"libmodule-signature-perl", ver:"0.73-1ubuntu0.14.04.1", rls:"UBUNTU14.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}


if(release == "UBUNTU12.04 LTS")
{

  if ((res = isdpkgvuln(pkg:"libmodule-signature-perl", ver:"0.68-1ubuntu0.12.04.2", rls:"UBUNTU12.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
