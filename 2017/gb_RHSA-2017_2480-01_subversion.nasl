###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_RHSA-2017_2480-01_subversion.nasl 12497 2018-11-23 08:28:21Z cfischer $
#
# RedHat Update for subversion RHSA-2017:2480-01
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
  script_oid("1.3.6.1.4.1.25623.1.0.871883");
  script_version("$Revision: 12497 $");
  script_tag(name:"last_modification", value:"$Date: 2018-11-23 09:28:21 +0100 (Fri, 23 Nov 2018) $");
  script_tag(name:"creation_date", value:"2017-08-16 07:29:34 +0200 (Wed, 16 Aug 2017)");
  script_cve_id("CVE-2017-9800");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_tag(name:"qod_type", value:"package");
  script_name("RedHat Update for subversion RHSA-2017:2480-01");
  script_tag(name:"summary", value:"The remote host is missing an update for the 'subversion'
  package(s) announced via the referenced advisory.");
  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");
  script_tag(name:"insight", value:"Subversion (SVN) is a concurrent version
  control system which enables one or more users to collaborate in developing and
  maintaining a hierarchy of files and directories while keeping a history of all
  changes. Security Fix(es): * A shell command injection flaw related to the
  handling of 'svn+ssh' URLs has been discovered in Subversion. An attacker could
  use this flaw to execute shell commands with the privileges of the user running
  the Subversion client, for example when performing a 'checkout' or 'update'
  action on a malicious repository, or a legitimate repository containing a
  malicious commit. (CVE-2017-9800) Red Hat would like to thank the Subversion
  Team for reporting this issue.");
  script_tag(name:"affected", value:"subversion on Red Hat Enterprise Linux Server (v. 7)");
  script_tag(name:"solution", value:"Please Install the Updated Packages.");

  script_xref(name:"RHSA", value:"2017:2480-01");
  script_xref(name:"URL", value:"https://www.redhat.com/archives/rhsa-announce/2017-August/msg00064.html");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("Red Hat Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/rhel", "ssh/login/rpms", re:"ssh/login/release=RHENT_7");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-rpm.inc");

release = rpm_get_ssh_release();
if(!release) exit(0);

res = "";

if(release == "RHENT_7")
{

  if ((res = isrpmvuln(pkg:"mod_dav_svn", rpm:"mod_dav_svn~1.7.14~11.el7_4", rls:"RHENT_7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"subversion", rpm:"subversion~1.7.14~11.el7_4", rls:"RHENT_7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"subversion-debuginfo", rpm:"subversion-debuginfo~1.7.14~11.el7_4", rls:"RHENT_7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"subversion-gnome", rpm:"subversion-gnome~1.7.14~11.el7_4", rls:"RHENT_7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"subversion-libs", rpm:"subversion-libs~1.7.14~11.el7_4", rls:"RHENT_7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
