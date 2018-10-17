###############################################################################
# OpenVAS Vulnerability Test
#
# CentOS Update for newt CESA-2009:1463 centos4 i386
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
tag_insight = "Newt is a programming library for color text mode, widget-based user
  interfaces. Newt can be used to add stacked windows, entry widgets,
  checkboxes, radio buttons, labels, plain text fields, scrollbars, and so
  on, to text mode user interfaces.

  A heap-based buffer overflow flaw was found in the way newt processes
  content that is to be displayed in a text dialog box. A local attacker
  could issue a specially-crafted text dialog box display request (direct or
  via a custom application), leading to a denial of service (application
  crash) or, potentially, arbitrary code execution with the privileges of the
  user running the application using the newt library. (CVE-2009-2905)
  
  Users of newt should upgrade to these updated packages, which contain a
  backported patch to correct this issue. After installing the updated
  packages, all applications using the newt library must be restarted for the
  update to take effect.";
tag_solution = "Please Install the Updated Packages.";

tag_affected = "newt on CentOS 4";


if(description)
{
  script_xref(name : "URL" , value : "http://lists.centos.org/pipermail/centos-announce/2009-September/016173.html");
  script_oid("1.3.6.1.4.1.25623.1.0.880929");
  script_version("$Revision: 9371 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-06 10:55:06 +0200 (Fri, 06 Apr 2018) $");
  script_tag(name:"creation_date", value:"2011-08-09 08:20:34 +0200 (Tue, 09 Aug 2011)");
  script_tag(name:"cvss_base", value:"4.6");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:L/Au:N/C:P/I:P/A:P");
  script_xref(name: "CESA", value: "2009:1463");
  script_cve_id("CVE-2009-2905");
  script_name("CentOS Update for newt CESA-2009:1463 centos4 i386");

  script_tag(name:"summary", value:"Check for the Version of newt");
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

if(release == "CentOS4")
{

  if ((res = isrpmvuln(pkg:"newt", rpm:"newt~0.51.6~10.el4_8.1", rls:"CentOS4")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"newt-devel", rpm:"newt-devel~0.51.6~10.el4_8.1", rls:"CentOS4")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}