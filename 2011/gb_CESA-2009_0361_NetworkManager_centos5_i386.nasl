###############################################################################
# OpenVAS Vulnerability Test
#
# CentOS Update for NetworkManager CESA-2009:0361 centos5 i386
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
tag_insight = "NetworkManager is a network link manager that attempts to keep a wired or
  wireless network connection active at all times.

  An information disclosure flaw was found in NetworkManager's D-Bus
  interface. A local attacker could leverage this flaw to discover sensitive
  information, such as network connection passwords and pre-shared keys.
  (CVE-2009-0365)
  
  A potential denial of service flaw was found in NetworkManager's D-Bus
  interface. A local user could leverage this flaw to modify local connection
  settings, preventing the system's network connection from functioning
  properly. (CVE-2009-0578)
  
  Red Hat would like to thank Ludwig Nussel for reporting these flaws
  responsibly.
  
  Users of NetworkManager should upgrade to these updated packages which
  contain backported patches to correct these issues.";
tag_solution = "Please Install the Updated Packages.";

tag_affected = "NetworkManager on CentOS 5";


if(description)
{
  script_xref(name : "URL" , value : "http://lists.centos.org/pipermail/centos-announce/2009-April/015742.html");
  script_oid("1.3.6.1.4.1.25623.1.0.880835");
  script_version("$Revision: 9371 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-06 10:55:06 +0200 (Fri, 06 Apr 2018) $");
  script_tag(name:"creation_date", value:"2011-08-09 08:20:34 +0200 (Tue, 09 Aug 2011)");
  script_tag(name:"cvss_base", value:"6.2");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:L/Au:S/C:N/I:C/A:C");
  script_xref(name: "CESA", value: "2009:0361");
  script_cve_id("CVE-2009-0365", "CVE-2009-0578");
  script_name("CentOS Update for NetworkManager CESA-2009:0361 centos5 i386");

  script_tag(name:"summary", value:"Check for the Version of NetworkManager");
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

  if ((res = isrpmvuln(pkg:"NetworkManager", rpm:"NetworkManager~0.7.0~4.el5_3", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"NetworkManager-devel", rpm:"NetworkManager-devel~0.7.0~4.el5_3", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"NetworkManager-glib", rpm:"NetworkManager-glib~0.7.0~4.el5_3", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"NetworkManager-glib-devel", rpm:"NetworkManager-glib-devel~0.7.0~4.el5_3", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"NetworkManager-gnome", rpm:"NetworkManager-gnome~0.7.0~4.el5_3", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
