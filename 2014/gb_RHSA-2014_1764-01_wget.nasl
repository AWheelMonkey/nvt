###############################################################################
# OpenVAS Vulnerability Test
#
# RedHat Update for wget RHSA-2014:1764-01
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

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.871282");
  script_version("$Revision: 12370 $");
  script_tag(name:"last_modification", value:"$Date: 2018-11-16 08:56:29 +0100 (Fri, 16 Nov 2018) $");
  script_tag(name:"creation_date", value:"2014-10-31 05:45:00 +0100 (Fri, 31 Oct 2014)");
  script_cve_id("CVE-2014-4877");
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_name("RedHat Update for wget RHSA-2014:1764-01");
  script_tag(name: "summary", value: "Check the version of wget");
  script_tag(name: "vuldetect", value: "Get the installed version with the help of detect NVT and check if the version is vulnerable or not.");
  script_tag(name: "insight", value: "The wget package provides the GNU Wget file retrieval utility for HTTP,
HTTPS, and FTP protocols.

A flaw was found in the way Wget handled symbolic links. A malicious FTP
server could allow Wget running in the mirror mode (using the '-m' command
line option) to write an arbitrary file to a location writable to by the
user running Wget, possibly leading to code execution. (CVE-2014-4877)

Note: This update changes the default value of the --retr-symlinks option.
The file symbolic links are now traversed by default and pointed-to files
are retrieved rather than creating a symbolic link locally.

Red Hat would like to thank the GNU Wget project for reporting this issue.
Upstream acknowledges HD Moore of Rapid7, Inc as the original reporter.

All users of wget are advised to upgrade to this updated package, which
contains a backported patch to correct this issue.
");
  script_tag(name: "affected", value: "wget on Red Hat Enterprise Linux Desktop (v. 6),
  Red Hat Enterprise Linux Server (v. 6),
  Red Hat Enterprise Linux Server (v. 7),
  Red Hat Enterprise Linux Workstation (v. 6)");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");
  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");
  script_xref(name: "RHSA", value: "2014:1764-01");
  script_xref(name: "URL" , value: "https://www.redhat.com/archives/rhsa-announce/2014-October/msg00058.html");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2014 Greenbone Networks GmbH");
  script_family("Red Hat Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/rhel", "ssh/login/rpms", re:"ssh/login/release=RHENT_(7|6)");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-rpm.inc");

release = rpm_get_ssh_release();
if(!release) exit(0);

res = "";

if(release == "RHENT_7")
{

  if ((res = isrpmvuln(pkg:"wget", rpm:"wget~1.14~10.el7_0.1", rls:"RHENT_7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"wget-debuginfo", rpm:"wget-debuginfo~1.14~10.el7_0.1", rls:"RHENT_7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}


if(release == "RHENT_6")
{

  if ((res = isrpmvuln(pkg:"wget", rpm:"wget~1.12~5.el6_6.1", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"wget-debuginfo", rpm:"wget-debuginfo~1.12~5.el6_6.1", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}