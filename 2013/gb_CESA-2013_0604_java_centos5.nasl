###############################################################################
# OpenVAS Vulnerability Test
#
# CentOS Update for java CESA-2013:0604 centos5
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
tag_insight = "These packages provide the OpenJDK 6 Java Runtime Environment and the
  OpenJDK 6 Software Development Kit.

  An integer overflow flaw was found in the way the 2D component handled
  certain sample model instances. A specially-crafted sample model instance
  could cause Java Virtual Machine memory corruption and, possibly, lead to
  arbitrary code execution with virtual machine privileges. (CVE-2013-0809)

  It was discovered that the 2D component did not properly reject certain
  malformed images. Specially-crafted raster parameters could cause Java
  Virtual Machine memory corruption and, possibly, lead to arbitrary code
  execution with virtual machine privileges. (CVE-2013-1493)

  This erratum also upgrades the OpenJDK package to IcedTea6 1.11.9. Refer to
  the NEWS file, linked to in the References, for further information.

  All users of java-1.6.0-openjdk are advised to upgrade to these updated
  packages, which resolve these issues. All running instances of OpenJDK Java
  must be restarted for the update to take effect.";


tag_affected = "java on CentOS 5";
tag_solution = "Please Install the Updated Packages.";



if(description)
{
  script_xref(name : "URL" , value : "http://lists.centos.org/pipermail/centos-announce/2013-March/019267.html");
  script_oid("1.3.6.1.4.1.25623.1.0.881621");
  script_version("$Revision: 9372 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-06 10:56:37 +0200 (Fri, 06 Apr 2018) $");
  script_tag(name:"creation_date", value:"2013-03-08 10:19:44 +0530 (Fri, 08 Mar 2013)");
  script_cve_id("CVE-2013-0809", "CVE-2013-1493");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_xref(name: "CESA", value: "2013:0604");
  script_name("CentOS Update for java CESA-2013:0604 centos5 ");

  script_tag(name:"summary", value:"Check for the Version of java");
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

  if ((res = isrpmvuln(pkg:"java-1.6.0-openjdk", rpm:"java-1.6.0-openjdk~1.6.0.0~1.36.1.11.9.el5_9", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"java-1.6.0-openjdk-demo", rpm:"java-1.6.0-openjdk-demo~1.6.0.0~1.36.1.11.9.el5_9", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"java-1.6.0-openjdk-devel", rpm:"java-1.6.0-openjdk-devel~1.6.0.0~1.36.1.11.9.el5_9", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"java-1.6.0-openjdk-javadoc", rpm:"java-1.6.0-openjdk-javadoc~1.6.0.0~1.36.1.11.9.el5_9", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"java-1.6.0-openjdk-src", rpm:"java-1.6.0-openjdk-src~1.6.0.0~1.36.1.11.9.el5_9", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
