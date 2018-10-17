###############################################################################
# OpenVAS Vulnerability Test
#
# CentOS Update for rdesktop CESA-2011:0506 centos5 x86_64
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

include("revisions-lib.inc");
tag_insight = "rdesktop is a client for the Remote Desktop Server (previously, Terminal
  Server) in Microsoft Windows. It uses the Remote Desktop Protocol (RDP) to
  remotely present a user's desktop.

  A directory traversal flaw was found in the way rdesktop shared a local
  path with a remote server. If a user connects to a malicious server with
  rdesktop, the server could use this flaw to cause rdesktop to read and
  write to arbitrary, local files accessible to the user running rdesktop.
  (CVE-2011-1595)
  
  Red Hat would like to thank Cendio AB for reporting this issue. Cendio AB
  acknowledges an anonymous contributor working with the SecuriTeam Secure
  Disclosure program as the original reporter.
  
  Users of rdesktop should upgrade to this updated package, which contains a
  backported patch to resolve this issue.";

tag_affected = "rdesktop on CentOS 5";
tag_solution = "Please Install the Updated Packages.";



if(description)
{
  script_xref(name : "URL" , value : "http://lists.centos.org/pipermail/centos-announce/2011-May/017558.html");
  script_oid("1.3.6.1.4.1.25623.1.0.881304");
  script_version("$Revision: 9352 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-06 09:13:02 +0200 (Fri, 06 Apr 2018) $");
  script_tag(name:"creation_date", value:"2012-07-30 17:20:08 +0530 (Mon, 30 Jul 2012)");
  script_cve_id("CVE-2011-1595");
  script_tag(name:"cvss_base", value:"4.3");
  script_tag(name:"cvss_base_vector", value:"AV:A/AC:H/Au:N/C:P/I:P/A:P");
  script_xref(name: "CESA", value: "2011:0506");
  script_name("CentOS Update for rdesktop CESA-2011:0506 centos5 x86_64");

  script_tag(name: "summary" , value: "Check for the Version of rdesktop");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2012 Greenbone Networks GmbH");
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

  if ((res = isrpmvuln(pkg:"rdesktop", rpm:"rdesktop~1.6.0~3.el5_6.2", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
