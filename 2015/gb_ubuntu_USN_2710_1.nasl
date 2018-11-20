###############################################################################
# OpenVAS Vulnerability Test
#
# Ubuntu Update for openssh USN-2710-1
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
  script_oid("1.3.6.1.4.1.25623.1.0.842409");
  script_version("$Revision: 12381 $");
  script_tag(name:"last_modification", value:"$Date: 2018-11-16 12:16:30 +0100 (Fri, 16 Nov 2018) $");
  script_tag(name:"creation_date", value:"2015-08-15 05:05:45 +0200 (Sat, 15 Aug 2015)");
  script_cve_id("CVE-2015-5352", "CVE-2015-5600");
  script_tag(name:"cvss_base", value:"8.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:C");
  script_tag(name:"qod_type", value:"package");
  script_name("Ubuntu Update for openssh USN-2710-1");
  script_tag(name:"summary", value:"The remote host is missing an update for the 'openssh'
  package(s) announced via the referenced advisory.");
  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");
  script_tag(name:"insight", value:"Moritz Jodeit discovered that OpenSSH
incorrectly handled usernames when using PAM authentication. If an additional
vulnerability were discovered in the OpenSSH unprivileged child process, this
issue could allow a remote attacker to perform user impersonation. (CVE number
pending) Moritz Jodeit discovered that OpenSSH incorrectly handled context memory
when using PAM authentication. If an additional vulnerability were
discovered in the OpenSSH unprivileged child process, this issue could
allow a remote attacker to bypass authentication or possibly execute
arbitrary code. (CVE number pending)

Jann Horn discovered that OpenSSH incorrectly handled time windows for
X connections. A remote attacker could use this issue to bypass certain
access restrictions. (CVE-2015-5352)

It was discovered that OpenSSH incorrectly handled keyboard-interactive
authentication. In a non-default configuration, a remote attacker could
possibly use this issue to perform a brute-force password attack.
(CVE-2015-5600)");
  script_tag(name:"affected", value:"openssh on Ubuntu 14.04 LTS,
  Ubuntu 12.04 LTS");
  script_tag(name:"solution", value:"Please Install the Updated Packages.");
  script_xref(name:"USN", value:"2710-1");
  script_xref(name:"URL", value:"http://www.ubuntu.com/usn/usn-2710-1/");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2015 Greenbone Networks GmbH");
  script_family("Ubuntu Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/ubuntu_linux", "ssh/login/packages", re:"ssh/login/release=UBUNTU(14\.04 LTS|12\.04 LTS)");
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

  if ((res = isdpkgvuln(pkg:"openssh-server", ver:"1:6.6p1-2ubuntu2.2", rls:"UBUNTU14.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}


if(release == "UBUNTU12.04 LTS")
{

  if ((res = isdpkgvuln(pkg:"openssh-server", ver:"1:5.9p1-5ubuntu1.6", rls:"UBUNTU12.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
