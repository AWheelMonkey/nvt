###############################################################################
# OpenVAS Vulnerability Test
#
# CentOS Update for dbus-glib CESA-2013:0568 centos5 
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
tag_insight = "dbus-glib is an add-on library to integrate the standard D-Bus library with
  the GLib main loop and threading model.

  A flaw was found in the way dbus-glib filtered the message sender (message
  source subject) when the signal was received. This
  could trick a system service using dbus-glib (such as fprintd) into
  believing a signal was sent from a privileged process, when it was not. A
  local attacker could use this flaw to escalate their privileges.
  (CVE-2013-0292)

  All dbus-glib users are advised to upgrade to these updated packages, which
  contain a backported patch to correct this issue. All running applications
  linked against dbus-glib, such as fprintd and NetworkManager, must be
  restarted for this update to take effect.";


tag_affected = "dbus-glib on CentOS 5";
tag_solution = "Please Install the Updated Packages.";



if(description)
{
  script_xref(name : "URL" , value : "http://lists.centos.org/pipermail/centos-announce/2013-March/019258.html");
  script_oid("1.3.6.1.4.1.25623.1.0.881618");
  script_version("$Revision: 9353 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-06 09:14:20 +0200 (Fri, 06 Apr 2018) $");
  script_tag(name:"creation_date", value:"2013-03-05 09:43:23 +0530 (Tue, 05 Mar 2013)");
  script_cve_id("CVE-2013-0292");
  script_tag(name:"cvss_base", value:"7.2");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:L/Au:N/C:C/I:C/A:C");
  script_xref(name: "CESA", value: "2013:0568");
  script_name("CentOS Update for dbus-glib CESA-2013:0568 centos5 ");

  script_tag(name: "summary" , value: "Check for the Version of dbus-glib");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2013 Greenbone Networks GmbH");
  script_family("CentOS Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/centos", "ssh/login/rpms");
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

if(release == "CentOS5")
{

  if ((res = isrpmvuln(pkg:"dbus-glib", rpm:"dbus-glib~0.73~11.el5_9", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"dbus-glib-devel", rpm:"dbus-glib-devel~0.73~11.el5_9", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
