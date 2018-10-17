###############################################################################
# OpenVAS Vulnerability Test
#
# CentOS Update for sblim-cim-client2 CESA-2012:0987 centos6 
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
tag_insight = "The SBLIM (Standards-Based Linux Instrumentation for Manageability) CIM
  (Common Information Model) Client is a class library for Java applications
  that provides access to CIM servers using the CIM Operations over HTTP
  protocol defined by the DMTF (Distributed Management Task Force) standards.

  It was found that the Java HashMap implementation was susceptible to
  predictable hash collisions. SBLIM uses HashMap when parsing XML inputs. A
  specially-crafted CIM-XML message from a WBEM (Web-Based Enterprise
  Management) server could cause a SBLIM client to use an excessive amount of
  CPU. Randomization has been added to help avoid collisions. (CVE-2012-2328)
  
  All users of sblim-cim-client2 are advised to upgrade to these updated
  packages, which contain a backported patch to resolve this issue.";

tag_affected = "sblim-cim-client2 on CentOS 6";
tag_solution = "Please Install the Updated Packages.";



if(description)
{
  script_xref(name : "URL" , value : "http://lists.centos.org/pipermail/centos-announce/2012-July/018725.html");
  script_oid("1.3.6.1.4.1.25623.1.0.881220");
  script_version("$Revision: 9352 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-06 09:13:02 +0200 (Fri, 06 Apr 2018) $");
  script_tag(name:"creation_date", value:"2012-07-30 16:50:21 +0530 (Mon, 30 Jul 2012)");
  script_cve_id("CVE-2012-2328");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:P");
  script_xref(name: "CESA", value: "2012:0987");
  script_name("CentOS Update for sblim-cim-client2 CESA-2012:0987 centos6 ");

  script_tag(name: "summary" , value: "Check for the Version of sblim-cim-client2");
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

if(release == "CentOS6")
{

  if ((res = isrpmvuln(pkg:"sblim-cim-client2", rpm:"sblim-cim-client2~2.1.3~2.el6", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"sblim-cim-client2-javadoc", rpm:"sblim-cim-client2-javadoc~2.1.3~2.el6", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"sblim-cim-client2-manual", rpm:"sblim-cim-client2-manual~2.1.3~2.el6", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
