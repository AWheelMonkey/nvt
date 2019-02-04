###############################################################################
# OpenVAS Vulnerability Test
#
# RedHat Update for git RHSA-2016:0496-01
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (C) 2016 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.871585");
  script_version("$Revision: 12497 $");
  script_tag(name:"last_modification", value:"$Date: 2018-11-23 09:28:21 +0100 (Fri, 23 Nov 2018) $");
  script_tag(name:"creation_date", value:"2016-03-24 06:14:43 +0100 (Thu, 24 Mar 2016)");
  script_cve_id("CVE-2016-2315", "CVE-2016-2324");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"qod_type", value:"package");
  script_name("RedHat Update for git RHSA-2016:0496-01");
  script_tag(name:"summary", value:"The remote host is missing an update for the 'git'
  package(s) announced via the referenced advisory.");
  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");
  script_tag(name:"insight", value:"Git is a distributed revision control
system with a decentralized architecture. As opposed to centralized version
control systems with a client-server model, Git ensures that each working copy
of a Git repository is an exact copy with complete revision history. This not
only allows the user to work on and contribute to projects without the need to have
permission to push the changes to their official repositories, but also
makes it possible for the user to work with no network connection.

An integer truncation flaw and an integer overflow flaw, both leading to a
heap-based buffer overflow, were found in the way Git processed certain
path information. A remote attacker could create a specially crafted Git
repository that would cause a Git client or server to crash or, possibly,
execute arbitrary code. (CVE-2016-2315, CVE-2016-2324)

All git users are advised to upgrade to these updated packages, which
contain backported patches to correct these issues.");
  script_tag(name:"affected", value:"git on Red Hat Enterprise Linux Server (v. 6),
  Red Hat Enterprise Linux Server (v. 7),
  Red Hat Enterprise Linux Workstation (v. 6)");
  script_tag(name:"solution", value:"Please Install the Updated Packages.");

  script_xref(name:"RHSA", value:"2016:0496-01");
  script_xref(name:"URL", value:"https://www.redhat.com/archives/rhsa-announce/2016-March/msg00061.html");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
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

  if ((res = isrpmvuln(pkg:"perl-Git", rpm:"perl-Git~1.8.3.1~6.el7_2.1", rls:"RHENT_7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"git", rpm:"git~1.8.3.1~6.el7_2.1", rls:"RHENT_7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"git-debuginfo", rpm:"git-debuginfo~1.8.3.1~6.el7_2.1", rls:"RHENT_7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}


if(release == "RHENT_6")
{

  if ((res = isrpmvuln(pkg:"git", rpm:"git~1.7.1~4.el6_7.1", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"git-debuginfo", rpm:"git-debuginfo~1.7.1~4.el6_7.1", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"perl-Git", rpm:"perl-Git~1.7.1~4.el6_7.1", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
