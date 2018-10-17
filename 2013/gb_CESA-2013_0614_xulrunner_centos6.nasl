###############################################################################
# OpenVAS Vulnerability Test
#
# CentOS Update for xulrunner CESA-2013:0614 centos6 
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
tag_insight = "XULRunner provides the XUL Runtime environment for applications using the
  Gecko layout engine.

  A flaw was found in the way XULRunner handled malformed web content. A web
  page containing malicious content could cause an application linked against
  XULRunner (such as Mozilla Firefox) to crash or execute arbitrary code with
  the privileges of the user running the application. (CVE-2013-0787)
  
  Red Hat would like to thank the Mozilla project for reporting this issue.
  Upstream acknowledges VUPEN Security via the TippingPoint Zero Day
  Initiative project as the original reporter.
  
  For technical details regarding this flaw, refer to the Mozilla security
  advisories. You can find a link to the Mozilla advisories in the References
  section of this erratum.
  
  All XULRunner users should upgrade to these updated packages, which correct
  this issue. After installing the update, applications using XULRunner must
  be restarted for the changes to take effect.";


tag_affected = "xulrunner on CentOS 6";
tag_solution = "Please Install the Updated Packages.";



if(description)
{
  script_xref(name : "URL" , value : "http://lists.centos.org/pipermail/centos-announce/2013-March/019636.html");
  script_oid("1.3.6.1.4.1.25623.1.0.881673");
  script_version("$Revision: 9353 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-06 09:14:20 +0200 (Fri, 06 Apr 2018) $");
  script_tag(name:"creation_date", value:"2013-03-12 10:02:10 +0530 (Tue, 12 Mar 2013)");
  script_cve_id("CVE-2013-0787");
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_xref(name: "CESA", value: "2013:0614");
  script_name("CentOS Update for xulrunner CESA-2013:0614 centos6 ");

  script_tag(name: "summary" , value: "Check for the Version of xulrunner");
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

  if ((res = isrpmvuln(pkg:"xulrunner", rpm:"xulrunner~17.0.3~2.el6.centos", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"xulrunner-devel", rpm:"xulrunner-devel~17.0.3~2.el6.centos", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
