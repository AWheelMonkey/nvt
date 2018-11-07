###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ubuntu_USN_3409_1.nasl 12130 2018-10-26 13:59:17Z cfischer $
#
# Ubuntu Update for fontforge USN-3409-1
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
  script_oid("1.3.6.1.4.1.25623.1.0.843676");
  script_version("$Revision: 12130 $");
  script_cve_id("CVE-2017-11568", "CVE-2017-11569", "CVE-2017-11572", "CVE-2017-11571", "CVE-2017-11574", "CVE-2017-11575", "CVE-2017-11577", "CVE-2017-11576");
  script_tag(name:"cvss_base", value:"6.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
  script_tag(name:"last_modification", value:"$Date: 2018-10-26 15:59:17 +0200 (Fri, 26 Oct 2018) $");
  script_tag(name:"creation_date", value:"2018-10-26 06:05:24 +0200 (Fri, 26 Oct 2018)");
  script_name("Ubuntu Update for fontforge USN-3409-1");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
  script_family("Ubuntu Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/ubuntu_linux", "ssh/login/packages", re:"ssh/login/release=UBUNTU14\.04 LTS");

  script_xref(name:"USN", value:"3409-1");
  script_xref(name:"URL", value:"http://www.ubuntu.com/usn/usn-3409-1/");

  script_tag(name:"summary", value:"The remote host is missing an update for the 'fontforge'
  package(s) announced via the USN-3409-1 advisory.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable package version is present on the target host.");

  script_tag(name:"insight", value:"It was discovered that FontForge was vulnerable to a heap-based buffer
over-read. A remote attacker could use a crafted file to DoS or execute
arbitrary code. (CVE-2017-11568, CVE-2017-11569, CVE-2017-11572)

It was discovered that FontForge was vulnerable to a stack-based buffer
overflow. A remote attacker could use a crafted file to DoS or execute
arbitrary code. (CVE-2017-11571)

It was discovered that FontForge was vulnerable to a heap-based buffer
overflow. A remote attacker could use a crafted file to DoS or execute
arbitrary code. (CVE-2017-11574)

It was discovered that FontForge was vulnerable to a buffer over-read.
A remote attacker could use a crafted file to DoS or execute arbitrary
code. (CVE-2017-11575, CVE-2017-11577)

It was discovered that FontForge wasn't correctly checking the sign of
a vector size. A remote attacker could use a crafted file to DoS.
(CVE-2017-11576)");

  script_tag(name:"affected", value:"fontforge on Ubuntu 14.04 LTS.");

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

if(release == "UBUNTU14.04 LTS")
{

  if ((res = isdpkgvuln(pkg:"fontforge", ver:"20120731.b-5ubuntu0.1", rls:"UBUNTU14.04 LTS", remove_arch:TRUE)) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"fontforge-common", ver:"20120731.b-5ubuntu0.1", rls:"UBUNTU14.04 LTS", remove_arch:TRUE)) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
