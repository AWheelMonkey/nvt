###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ubuntu_USN_3621_2.nasl 12130 2018-10-26 13:59:17Z cfischer $
#
# Ubuntu Update for ruby1.9.1 USN-3621-2
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
  script_oid("1.3.6.1.4.1.25623.1.0.843690");
  script_version("$Revision: 12130 $");
  script_cve_id("CVE-2018-1000074", "CVE-2018-1000073", "CVE-2018-1000075", "CVE-2018-1000076", "CVE-2018-1000077", "CVE-2018-1000078", "CVE-2018-1000079");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_tag(name:"last_modification", value:"$Date: 2018-10-26 15:59:17 +0200 (Fri, 26 Oct 2018) $");
  script_tag(name:"creation_date", value:"2018-10-26 06:07:14 +0200 (Fri, 26 Oct 2018)");
  script_name("Ubuntu Update for ruby1.9.1 USN-3621-2");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
  script_family("Ubuntu Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/ubuntu_linux", "ssh/login/packages", re:"ssh/login/release=UBUNTU14\.04 LTS");

  script_xref(name:"USN", value:"3621-2");
  script_xref(name:"URL", value:"http://www.ubuntu.com/usn/usn-3621-2/");

  script_tag(name:"summary", value:"The remote host is missing an update for the 'ruby1.9.1'
  package(s) announced via the USN-3621-2 advisory.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable package version is present on the target host.");

  script_tag(name:"insight", value:"USN-3621-1 fixed vulnerabilities in Ruby. The update caused an issue
due to an incomplete patch for CVE-2018-1000074. This update reverts
the problematic patch pending further investigation.

We apologize for the inconvenience.

Original advisory details:

It was discovered that Ruby incorrectly handled certain inputs. An
attacker could possibly use this to access sensitive information.
(CVE-2018-1000073)

It was discovered that Ruby incorrectly handled certain files. An
attacker could possibly use this to execute arbitrary code.
(CVE-2018-1000074)

It was discovered that Ruby incorrectly handled certain files. An
attacker could possibly use this to cause a denial of service.
(CVE-2018-1000075)

It was discovered that Ruby incorrectly handled certain crypto
signatures. An attacker could possibly use this to execute arbitrary
code. (CVE-2018-1000076)

It was discovered that Ruby incorrectly handled certain inputs. An
attacker could possibly use this to execute arbitrary code.
(CVE-2018-1000077, CVE-2018-1000078, CVE-2018-1000079)");

  script_tag(name:"affected", value:"ruby1.9.1 on Ubuntu 14.04 LTS.");

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

  if ((res = isdpkgvuln(pkg:"libruby1.9.1", ver:"1.9.3.484-2ubuntu1.10", rls:"UBUNTU14.04 LTS", remove_arch:TRUE)) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"libruby2.0", ver:"2.0.0.484-1ubuntu2.8", rls:"UBUNTU14.04 LTS", remove_arch:TRUE)) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"ruby1.9.1", ver:"1.9.3.484-2ubuntu1.10", rls:"UBUNTU14.04 LTS", remove_arch:TRUE)) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"ruby1.9.3", ver:"1.9.3.484-2ubuntu1.10", rls:"UBUNTU14.04 LTS", remove_arch:TRUE)) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"ruby2.0", ver:"2.0.0.484-1ubuntu2.8", rls:"UBUNTU14.04 LTS", remove_arch:TRUE)) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
