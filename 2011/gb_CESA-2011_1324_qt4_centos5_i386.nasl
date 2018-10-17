###############################################################################
# OpenVAS Vulnerability Test
#
# CentOS Update for qt4 CESA-2011:1324 centos5 i386
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (c) 2011 Greenbone Networks GmbH, http://www.greenbone.net
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

include("revisions-lib.inc");
tag_insight = "Qt 4 is a software toolkit that simplifies the task of writing and
  maintaining GUI (Graphical User Interface) applications for the X Window
  System. HarfBuzz is an OpenType text shaping engine.

  A flaw in the way Qt 4 expanded certain UTF-8 characters could be used to
  prevent a Qt 4 based application from properly sanitizing user input.
  Depending on the application, this could allow an attacker to perform
  directory traversal, or for web applications, a cross-site scripting (XSS)
  attack. (CVE-2007-0242)
  
  A buffer overflow flaw was found in the harfbuzz module in Qt 4. If a user
  loaded a specially-crafted font file with an application linked against Qt
  4, it could cause the application to crash or, possibly, execute arbitrary
  code with the privileges of the user running the application.
  (CVE-2011-3193)
  
  Users of Qt 4 should upgrade to these updated packages, which contain
  backported patches to correct these issues. All running applications linked
  against Qt 4 libraries must be restarted for this update to take effect.";
tag_solution = "Please Install the Updated Packages.";

tag_affected = "qt4 on CentOS 5";


if(description)
{
  script_xref(name : "URL" , value : "http://lists.centos.org/pipermail/centos-announce/2011-September/017754.html");
  script_oid("1.3.6.1.4.1.25623.1.0.881004");
  script_version("$Revision: 9371 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-06 10:55:06 +0200 (Fri, 06 Apr 2018) $");
  script_tag(name:"creation_date", value:"2011-09-23 16:39:49 +0200 (Fri, 23 Sep 2011)");
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_xref(name: "CESA", value: "2011:1324");
  script_cve_id("CVE-2007-0242", "CVE-2011-3193");
  script_name("CentOS Update for qt4 CESA-2011:1324 centos5 i386");

  script_tag(name:"summary", value:"Check for the Version of qt4");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2011 Greenbone Networks GmbH");
  script_family("CentOS Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/centos", "ssh/login/rpms");
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");
  exit(0);
}


include("pkg-lib-rpm.inc");

release = get_kb_item("ssh/login/release");


res = "";
if(release == NULL){
  exit(0);
}

if(release == "CentOS5")
{

  if ((res = isrpmvuln(pkg:"qt4", rpm:"qt4~4.2.1~1.el5_7.1", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"qt4-devel", rpm:"qt4-devel~4.2.1~1.el5_7.1", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"qt4-doc", rpm:"qt4-doc~4.2.1~1.el5_7.1", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"qt4-mysql", rpm:"qt4-mysql~4.2.1~1.el5_7.1", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"qt4-odbc", rpm:"qt4-odbc~4.2.1~1.el5_7.1", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"qt4-postgresql", rpm:"qt4-postgresql~4.2.1~1.el5_7.1", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"qt4-sqlite", rpm:"qt4-sqlite~4.2.1~1.el5_7.1", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
