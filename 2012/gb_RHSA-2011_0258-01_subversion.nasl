###############################################################################
# OpenVAS Vulnerability Test
#
# RedHat Update for subversion RHSA-2011:0258-01
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (c) 2012 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_xref(name:"URL", value:"https://www.redhat.com/archives/rhsa-announce/2011-February/msg00014.html");
  script_oid("1.3.6.1.4.1.25623.1.0.870654");
  script_version("$Revision: 12497 $");
  script_tag(name:"last_modification", value:"$Date: 2018-11-23 09:28:21 +0100 (Fri, 23 Nov 2018) $");
  script_tag(name:"creation_date", value:"2012-06-05 19:35:39 +0530 (Tue, 05 Jun 2012)");
  script_cve_id("CVE-2010-3315", "CVE-2010-4539", "CVE-2010-4644");
  script_tag(name:"cvss_base", value:"6.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:S/C:N/I:N/A:C");
  script_xref(name:"RHSA", value:"2011:0258-01");
  script_name("RedHat Update for subversion RHSA-2011:0258-01");

  script_tag(name:"summary", value:"The remote host is missing an update for the 'subversion'
  package(s) announced via the referenced advisory.");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2012 Greenbone Networks GmbH");
  script_family("Red Hat Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/rhel", "ssh/login/rpms", re:"ssh/login/release=RHENT_6");
  script_tag(name:"affected", value:"subversion on Red Hat Enterprise Linux Server (v. 6),
  Red Hat Enterprise Linux Workstation (v. 6)");
  script_tag(name:"solution", value:"Please Install the Updated Packages.");
  script_tag(name:"insight", value:"Subversion (SVN) is a concurrent version control system which enables one
  or more users to collaborate in developing and maintaining a hierarchy of
  files and directories while keeping a history of all changes. The
  mod_dav_svn module is used with the Apache HTTP Server to allow access to
  Subversion repositories via HTTP.

  An access restriction bypass flaw was found in the mod_dav_svn module. If
  the SVNPathAuthz directive was set to &quot;short_circuit&quot;, certain access rules
  were not enforced, possibly allowing sensitive repository data to be leaked
  to remote users. Note that SVNPathAuthz is set to &quot;On&quot; by default.
  (CVE-2010-3315)

  A server-side memory leak was found in the Subversion server. If a
  malicious, remote user performed &quot;svn blame&quot; or &quot;svn log&quot; operations on
  certain repository files, it could cause the Subversion server to consume
  a large amount of system memory. (CVE-2010-4644)

  A NULL pointer dereference flaw was found in the way the mod_dav_svn module
  processed certain requests. If a malicious, remote user issued a certain
  type of request to display a collection of Subversion repositories on a
  host that has the SVNListParentPath directive enabled, it could cause the
  httpd process serving the request to crash. Note that SVNListParentPath is
  not enabled by default. (CVE-2010-4539)

  All Subversion users should upgrade to these updated packages, which
  contain backported patches to correct these issues. After installing the
  updated packages, the Subversion server must be restarted for the update
  to take effect: restart httpd if you are using mod_dav_svn, or restart
  svnserve if it is used.");
  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-rpm.inc");

release = rpm_get_ssh_release();
if(!release) exit(0);

res = "";

if(release == "RHENT_6")
{

  if ((res = isrpmvuln(pkg:"mod_dav_svn", rpm:"mod_dav_svn~1.6.11~2.el6_0.2", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"subversion", rpm:"subversion~1.6.11~2.el6_0.2", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"subversion-debuginfo", rpm:"subversion-debuginfo~1.6.11~2.el6_0.2", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"subversion-javahl", rpm:"subversion-javahl~1.6.11~2.el6_0.2", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
