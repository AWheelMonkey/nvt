###############################################################################
# OpenVAS Vulnerability Test
#
# CentOS Update for elinks CESA-2013:0250 centos6 
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
tag_insight = "ELinks is a text-based web browser. ELinks does not display any images, but
  it does support frames, tables, and most other HTML tags.

  It was found that ELinks performed client credentials delegation during the
  client-to-server GSS security mechanisms negotiation. A rogue server could
  use this flaw to obtain the client's credentials and impersonate that
  client to other servers that are using GSSAPI. (CVE-2012-4545)
  
  This issue was discovered by Marko Myllynen of Red Hat.
  
  All ELinks users are advised to upgrade to this updated package, which
  contains a backported patch to resolve the issue.";


tag_affected = "elinks on CentOS 6";
tag_solution = "Please Install the Updated Packages.";



if(description)
{
  script_xref(name : "URL" , value : "http://lists.centos.org/pipermail/centos-announce/2013-February/019236.html");
  script_oid("1.3.6.1.4.1.25623.1.0.881600");
  script_version("$Revision: 9372 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-06 10:56:37 +0200 (Fri, 06 Apr 2018) $");
  script_tag(name:"creation_date", value:"2013-02-15 11:15:37 +0530 (Fri, 15 Feb 2013)");
  script_cve_id("CVE-2012-4545");
  script_tag(name:"cvss_base", value:"5.1");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:H/Au:N/C:P/I:P/A:P");
  script_xref(name: "CESA", value: "2013:0250");
  script_name("CentOS Update for elinks CESA-2013:0250 centos6 ");

  script_tag(name:"summary", value:"Check for the Version of elinks");
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

if(release == "CentOS6")
{

  if ((res = isrpmvuln(pkg:"elinks", rpm:"elinks~0.12~0.21.pre5.el6_3", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
