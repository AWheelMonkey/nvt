###############################################################################
# OpenVAS Vulnerability Test
# $Id$
#
# CentOS Update for emacs-git CESA-2018:3408 centos7
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
  script_oid("1.3.6.1.4.1.25623.1.0.882979");
  script_version("$Revision: 13032 $");
  script_cve_id("CVE-2018-17456");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_tag(name:"last_modification", value:"$Date: 2019-01-11 08:56:51 +0100 (Fri, 11 Jan 2019) $");
  script_tag(name:"creation_date", value:"2018-12-18 07:37:47 +0100 (Tue, 18 Dec 2018)");
  script_name("CentOS Update for emacs-git CESA-2018:3408 centos7 ");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
  script_family("CentOS Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/centos", "ssh/login/rpms");

  script_xref(name:"CESA", value:"2018:3408");
  script_xref(name:"URL" , value:"http://lists.centos.org/pipermail/centos-announce/2018-December/023102.html");

  script_tag(name:"summary", value:"The remote host is missing an update for the 'emacs-git'
  package(s) announced via the CESA-2018:3408 advisory.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable package version is present on the target host.");

  script_tag(name:"insight", value:"Git is a distributed revision control system with a decentralized
architecture. As opposed to centralized version control systems with a
client-server model, Git ensures that each working copy of a Git repository
is an exact copy with complete revision history. This not only allows the
user to work on and contribute to projects without the need to have
permission to push the changes to their official repositories, but also
makes it possible for the user to work with no network connection.

Security Fix(es):

* git: arbitrary code execution via .gitmodules (CVE-2018-17456)

For more details about the security issue(s), including the impact, a CVSS
score, and other related information, refer to the CVE page(s) listed in
the References section.
");

  script_tag(name:"affected", value:"emacs-git on CentOS 7.");

  script_tag(name:"solution", value:"Please install the updated package(s).");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"package");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-rpm.inc");

release = rpm_get_ssh_release();
if(!release) exit(0);

res = "";

if(release == "CentOS7")
{

  if ((res = isrpmvuln(pkg:"emacs-git", rpm:"emacs-git~1.8.3.1~20.el7", rls:"CentOS7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"emacs-git-el", rpm:"emacs-git-el~1.8.3.1~20.el7", rls:"CentOS7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"git", rpm:"git~1.8.3.1~20.el7", rls:"CentOS7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"git-all", rpm:"git-all~1.8.3.1~20.el7", rls:"CentOS7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"git-bzr", rpm:"git-bzr~1.8.3.1~20.el7", rls:"CentOS7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"git-cvs", rpm:"git-cvs~1.8.3.1~20.el7", rls:"CentOS7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"git-daemon", rpm:"git-daemon~1.8.3.1~20.el7", rls:"CentOS7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"git-email", rpm:"git-email~1.8.3.1~20.el7", rls:"CentOS7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"git-gnome-keyring", rpm:"git-gnome-keyring~1.8.3.1~20.el7", rls:"CentOS7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"git-gui", rpm:"git-gui~1.8.3.1~20.el7", rls:"CentOS7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"git-hg", rpm:"git-hg~1.8.3.1~20.el7", rls:"CentOS7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"git-instaweb", rpm:"git-instaweb~1.8.3.1~20.el7", rls:"CentOS7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"gitk", rpm:"gitk~1.8.3.1~20.el7", rls:"CentOS7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"git-p4", rpm:"git-p4~1.8.3.1~20.el7", rls:"CentOS7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"git-svn", rpm:"git-svn~1.8.3.1~20.el7", rls:"CentOS7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"gitweb", rpm:"gitweb~1.8.3.1~20.el7", rls:"CentOS7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"perl-Git", rpm:"perl-Git~1.8.3.1~20.el7", rls:"CentOS7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"perl-Git-SVN", rpm:"perl-Git-SVN~1.8.3.1~20.el7", rls:"CentOS7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
