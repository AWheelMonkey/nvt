###############################################################################
# OpenVAS Vulnerability Test
#
# RedHat Update for abrt and libreport RHSA-2013:0215-01
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (c) 2013 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_xref(name:"URL", value:"https://www.redhat.com/archives/rhsa-announce/2013-January/msg00062.html");
  script_oid("1.3.6.1.4.1.25623.1.0.870897");
  script_version("$Revision: 12497 $");
  script_tag(name:"last_modification", value:"$Date: 2018-11-23 09:28:21 +0100 (Fri, 23 Nov 2018) $");
  script_tag(name:"creation_date", value:"2013-02-04 09:53:55 +0530 (Mon, 04 Feb 2013)");
  script_cve_id("CVE-2012-5659", "CVE-2012-5660");
  script_tag(name:"cvss_base", value:"6.9");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:M/Au:N/C:C/I:C/A:C");
  script_xref(name:"RHSA", value:"2013:0215-01");
  script_name("RedHat Update for abrt and libreport RHSA-2013:0215-01");

  script_tag(name:"summary", value:"The remote host is missing an update for the 'abrt and libreport'
  package(s) announced via the referenced advisory.");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2013 Greenbone Networks GmbH");
  script_family("Red Hat Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/rhel", "ssh/login/rpms", re:"ssh/login/release=RHENT_6");
  script_tag(name:"affected", value:"abrt and libreport on Red Hat Enterprise Linux Desktop (v. 6),
  Red Hat Enterprise Linux Server (v. 6),
  Red Hat Enterprise Linux Workstation (v. 6)");
  script_tag(name:"solution", value:"Please Install the Updated Packages.");
  script_tag(name:"insight", value:"ABRT (Automatic Bug Reporting Tool) is a tool to help users to detect
  defects in applications and to create a bug report with all the information
  needed by a maintainer to fix it. It uses a plug-in system to extend its
  functionality. libreport provides an API for reporting different problems
  in applications to different bug targets, such as Bugzilla, FTP, and Trac.

  It was found that the
  /usr/libexec/abrt-action-install-debuginfo-to-abrt-cache tool did not
  sufficiently sanitize its environment variables. This could lead to Python
  modules being loaded and run from non-standard directories (such as /tmp/).
  A local attacker could use this flaw to escalate their privileges to that
  of the abrt user. (CVE-2012-5659)

  A race condition was found in the way ABRT handled the directories used to
  store information about crashes. A local attacker with the privileges of
  the abrt user could use this flaw to perform a symbolic link attack,
  possibly allowing them to escalate their privileges to root.
  (CVE-2012-5660)

  Red Hat would like to thank Martin Carpenter of Citco for reporting the
  CVE-2012-5660 issue. CVE-2012-5659 was discovered by Miloslav Trma of Red
  Hat.

  All users of abrt and libreport are advised to upgrade to these updated
  packages, which correct these issues.");
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

  if ((res = isrpmvuln(pkg:"abrt", rpm:"abrt~2.0.8~6.el6_3.2", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"abrt-addon-ccpp", rpm:"abrt-addon-ccpp~2.0.8~6.el6_3.2", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"abrt-addon-kerneloops", rpm:"abrt-addon-kerneloops~2.0.8~6.el6_3.2", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"abrt-addon-python", rpm:"abrt-addon-python~2.0.8~6.el6_3.2", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"abrt-cli", rpm:"abrt-cli~2.0.8~6.el6_3.2", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"abrt-debuginfo", rpm:"abrt-debuginfo~2.0.8~6.el6_3.2", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"abrt-desktop", rpm:"abrt-desktop~2.0.8~6.el6_3.2", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"abrt-gui", rpm:"abrt-gui~2.0.8~6.el6_3.2", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"abrt-libs", rpm:"abrt-libs~2.0.8~6.el6_3.2", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"abrt-tui", rpm:"abrt-tui~2.0.8~6.el6_3.2", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreport", rpm:"libreport~2.0.9~5.el6_3.2", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreport-cli", rpm:"libreport-cli~2.0.9~5.el6_3.2", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreport-debuginfo", rpm:"libreport-debuginfo~2.0.9~5.el6_3.2", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreport-gtk", rpm:"libreport-gtk~2.0.9~5.el6_3.2", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreport-newt", rpm:"libreport-newt~2.0.9~5.el6_3.2", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreport-plugin-kerneloops", rpm:"libreport-plugin-kerneloops~2.0.9~5.el6_3.2", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreport-plugin-logger", rpm:"libreport-plugin-logger~2.0.9~5.el6_3.2", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreport-plugin-mailx", rpm:"libreport-plugin-mailx~2.0.9~5.el6_3.2", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreport-plugin-reportuploader", rpm:"libreport-plugin-reportuploader~2.0.9~5.el6_3.2", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreport-plugin-rhtsupport", rpm:"libreport-plugin-rhtsupport~2.0.9~5.el6_3.2", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreport-python", rpm:"libreport-python~2.0.9~5.el6_3.2", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
