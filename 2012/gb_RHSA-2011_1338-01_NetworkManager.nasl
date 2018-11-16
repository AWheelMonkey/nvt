###############################################################################
# OpenVAS Vulnerability Test
#
# RedHat Update for NetworkManager RHSA-2011:1338-01
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

tag_insight = "NetworkManager is a network link manager that attempts to keep a wired or
  wireless network connection active at all times. The ifcfg-rh
  NetworkManager plug-in is used in Red Hat Enterprise Linux distributions to
  read and write configuration information from the
  /etc/sysconfig/network-scripts/ifcfg-* files.

  An input sanitization flaw was found in the way the ifcfg-rh NetworkManager
  plug-in escaped network connection names containing special characters. If
  PolicyKit was configured to allow local, unprivileged users to create and
  save new network connections, they could create a connection with a
  specially-crafted name, leading to the escalation of their privileges.
  Note: By default, PolicyKit prevents unprivileged users from creating and
  saving network connections. (CVE-2011-3364)

  Red Hat would like to thank Matt McCutchen for reporting this issue.

  Users of NetworkManager should upgrade to these updated packages, which
  contain a backported patch to correct this issue. Running instances of
  NetworkManager must be restarted (&quot;service NetworkManager restart&quot;) for
  this update to take effect.";

tag_affected = "NetworkManager on Red Hat Enterprise Linux Desktop (v. 6),
  Red Hat Enterprise Linux Server (v. 6),
  Red Hat Enterprise Linux Workstation (v. 6)";
tag_solution = "Please Install the Updated Packages.";



if(description)
{
  script_xref(name : "URL" , value : "https://www.redhat.com/archives/rhsa-announce/2011-September/msg00044.html");
  script_oid("1.3.6.1.4.1.25623.1.0.870686");
  script_version("$Revision: 12370 $");
  script_tag(name:"last_modification", value:"$Date: 2018-11-16 08:56:29 +0100 (Fri, 16 Nov 2018) $");
  script_tag(name:"creation_date", value:"2012-07-09 10:47:21 +0530 (Mon, 09 Jul 2012)");
  script_cve_id("CVE-2011-3364");
  script_tag(name:"cvss_base", value:"6.9");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:M/Au:N/C:C/I:C/A:C");
  script_xref(name: "RHSA", value: "2011:1338-01");
  script_name("RedHat Update for NetworkManager RHSA-2011:1338-01");

  script_tag(name: "summary" , value: "Check for the Version of NetworkManager");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2012 Greenbone Networks GmbH");
  script_family("Red Hat Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/rhel", "ssh/login/rpms", re:"ssh/login/release=RHENT_6");
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name : "insight" , value : tag_insight);
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

  if ((res = isrpmvuln(pkg:"NetworkManager", rpm:"NetworkManager~0.8.1~9.el6_1.3", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"NetworkManager-debuginfo", rpm:"NetworkManager-debuginfo~0.8.1~9.el6_1.3", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"NetworkManager-glib", rpm:"NetworkManager-glib~0.8.1~9.el6_1.3", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"NetworkManager-gnome", rpm:"NetworkManager-gnome~0.8.1~9.el6_1.3", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
