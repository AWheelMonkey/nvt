###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ubuntu_USN_3806_1.nasl 12289 2018-11-09 14:18:58Z bshakeel $
#
# Ubuntu Update for systemd USN-3806-1
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (C) 2018 Greenbone Networks GmbH, http://www.greenbone.net
# Text descriptions are largely excerpted from the referenced
# advisory, and are Copyright (c) the respective author(s)
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
  script_oid("1.3.6.1.4.1.25623.1.0.843804");
  script_version("$Revision: 12289 $");
  script_cve_id("CVE-2018-15688");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:N");
  script_tag(name:"last_modification", value:"$Date: 2018-11-09 15:18:58 +0100 (Fri, 09 Nov 2018) $");
  script_tag(name:"creation_date", value:"2018-11-06 05:59:53 +0100 (Tue, 06 Nov 2018)");
  script_name("Ubuntu Update for systemd USN-3806-1");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
  script_family("Ubuntu Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/ubuntu_linux", "ssh/login/packages", re:"ssh/login/release=UBUNTU(18\.04 LTS|18\.10|16\.04 LTS)");

  script_xref(name:"USN", value:"3806-1");
  script_xref(name:"URL" , value:"http://www.ubuntu.com/usn/usn-3806-1/");

  script_tag(name:"summary", value:"The remote host is missing an update for the 'systemd'
  package(s) announced via the USN-3806-1 advisory.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable package version is
present on the target host.");

  script_tag(name:"insight", value:"Felix Wilhelm discovered that the systemd-networkd
DHCPv6 client incorrectly handled certain DHCPv6 messages. In configurations where
systemd-networkd is being used, an attacker on the same network could use
this issue to cause systemd-networkd to crash, resulting in a denial of
service, or possibly execute arbitrary code.");

  script_tag(name:"affected", value:"systemd on Ubuntu 18.10,
  Ubuntu 18.04 LTS,
  Ubuntu 16.04 LTS.");

  script_tag(name:"solution", value:"Please install the updated package(s).");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"package");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

release = dpkg_get_ssh_release();
if(!release) exit(0);

res = "";

if(release == "UBUNTU18.04 LTS")
{

  if ((res = isdpkgvuln(pkg:"systemd", ver:"237-3ubuntu10.4", rls:"UBUNTU18.04 LTS", remove_arch:TRUE )) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}


if(release == "UBUNTU18.10")
{

  if ((res = isdpkgvuln(pkg:"systemd", ver:"239-7ubuntu10.1", rls:"UBUNTU18.10", remove_arch:TRUE )) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}


if(release == "UBUNTU16.04 LTS")
{

  if ((res = isdpkgvuln(pkg:"systemd", ver:"229-4ubuntu21.6", rls:"UBUNTU16.04 LTS", remove_arch:TRUE )) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
