###############################################################################
# OpenVAS Vulnerability Test
#
# RedHat Update for Core X11 clients RHSA-2013:0502-02
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

include("revisions-lib.inc");
tag_insight = "The Core X11 clients packages provide the xorg-x11-utils,
  xorg-x11-server-utils, and xorg-x11-apps clients that ship with the X
  Window System.

  It was found that the x11perfcomp utility included the current working
  directory in its PATH environment variable. Running x11perfcomp in an
  attacker-controlled directory would cause arbitrary code execution with
  the privileges of the user running x11perfcomp. (CVE-2011-2504)

  Also with this update, the xorg-x11-utils and xorg-x11-server-utils
  packages have been upgraded to upstream version 7.5, and the xorg-x11-apps
  package to upstream version 7.6, which provides a number of bug fixes and
  enhancements over the previous versions. (BZ#835277, BZ#835278, BZ#835281)

  All users of xorg-x11-utils, xorg-x11-server-utils, and xorg-x11-apps are
  advised to upgrade to these updated packages, which fix these issues and
  add these enhancements.";


tag_affected = "Core X11 clients on Red Hat Enterprise Linux Desktop (v. 6),
  Red Hat Enterprise Linux Server (v. 6),
  Red Hat Enterprise Linux Workstation (v. 6)";
tag_solution = "Please Install the Updated Packages.";



if(description)
{
  script_xref(name : "URL" , value : "https://www.redhat.com/archives/rhsa-announce/2013-February/msg00045.html");
  script_oid("1.3.6.1.4.1.25623.1.0.870936");
  script_version("$Revision: 9353 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-06 09:14:20 +0200 (Fri, 06 Apr 2018) $");
  script_tag(name:"creation_date", value:"2013-02-22 10:02:26 +0530 (Fri, 22 Feb 2013)");
  script_cve_id("CVE-2011-2504");
  script_bugtraq_id(58082);
  script_tag(name:"cvss_base", value:"6.9");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:M/Au:N/C:C/I:C/A:C");
  script_xref(name: "RHSA", value: "2013:0502-02");
  script_name("RedHat Update for Core X11 clients RHSA-2013:0502-02");

  script_tag(name: "summary" , value: "Check for the Version of Core X11 clients");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2013 Greenbone Networks GmbH");
  script_family("Red Hat Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/rhel", "ssh/login/rpms");
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name : "insight" , value : tag_insight);
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

if(release == "RHENT_6")
{

  if ((res = isrpmvuln(pkg:"xorg-x11-apps", rpm:"xorg-x11-apps~7.6~6.el6", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"xorg-x11-apps-debuginfo", rpm:"xorg-x11-apps-debuginfo~7.6~6.el6", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"xorg-x11-server-utils", rpm:"xorg-x11-server-utils~7.5~13.el6", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"xorg-x11-server-utils-debuginfo", rpm:"xorg-x11-server-utils-debuginfo~7.5~13.el6", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"xorg-x11-utils", rpm:"xorg-x11-utils~7.5~6.el6", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"xorg-x11-utils-debuginfo", rpm:"xorg-x11-utils-debuginfo~7.5~6.el6", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
