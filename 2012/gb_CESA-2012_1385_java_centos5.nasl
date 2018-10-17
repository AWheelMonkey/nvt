###############################################################################
# OpenVAS Vulnerability Test
#
# CentOS Update for java CESA-2012:1385 centos5 
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
tag_insight = "These packages provide the OpenJDK 6 Java Runtime Environment and the
  OpenJDK 6 Software Development Kit.

  Multiple improper permission check issues were discovered in the Beans,
  Swing, and JMX components in OpenJDK. An untrusted Java application or
  applet could use these flaws to bypass Java sandbox restrictions.
  (CVE-2012-5086, CVE-2012-5084, CVE-2012-5089)
  
  Multiple improper permission check issues were discovered in the Scripting,
  JMX, Concurrency, Libraries, and Security components in OpenJDK. An
  untrusted Java application or applet could use these flaws to bypass
  certain Java sandbox restrictions. (CVE-2012-5068, CVE-2012-5071,
  CVE-2012-5069, CVE-2012-5073, CVE-2012-5072)
  
  It was discovered that java.util.ServiceLoader could create an instance of
  an incompatible class while performing provider lookup. An untrusted Java
  application or applet could use this flaw to bypass certain Java sandbox
  restrictions. (CVE-2012-5079)
  
  It was discovered that the Java Secure Socket Extension (JSSE) SSL/TLS
  implementation did not properly handle handshake records containing an
  overly large data length value. An unauthenticated, remote attacker could
  possibly use this flaw to cause an SSL/TLS server to terminate with an
  exception. (CVE-2012-5081)
  
  It was discovered that the JMX component in OpenJDK could perform certain
  actions in an insecure manner. An untrusted Java application or applet
  could possibly use this flaw to disclose sensitive information.
  (CVE-2012-5075)
  
  A bug in the Java HotSpot Virtual Machine optimization code could cause it
  to not perform array initialization in certain cases. An untrusted Java
  application or applet could use this flaw to disclose portions of the
  virtual machine's memory. (CVE-2012-4416)
  
  It was discovered that the SecureRandom class did not properly protect
  against the creation of multiple seeders. An untrusted Java application or
  applet could possibly use this flaw to disclose sensitive information.
  (CVE-2012-5077)
  
  It was discovered that the java.io.FilePermission class exposed the hash
  code of the canonicalized path name. An untrusted Java application or
  applet could possibly use this flaw to determine certain system paths, such
  as the current working directory. (CVE-2012-3216)
  
  This update disables Gopher protocol support in the java.net package by
  default. Gopher support can be enabled by setting the newly introduced
  property, &quot;jdk.net.registerGopherProtocol&quot;, to true. (CVE-2012-5085)
  
  This erratum also upgrades the OpenJDK package to IcedTea6 1.10.10. Refer
  t ... 

  Description truncated, for more information please check the Reference URL";

tag_affected = "java on CentOS 5";
tag_solution = "Please Install the Updated Packages.";



if(description)
{
  script_xref(name : "URL" , value : "http://lists.centos.org/pipermail/centos-announce/2012-October/018948.html");
  script_oid("1.3.6.1.4.1.25623.1.0.881524");
  script_version("$Revision: 9352 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-06 09:13:02 +0200 (Fri, 06 Apr 2018) $");
  script_tag(name:"creation_date", value:"2012-10-19 10:20:08 +0530 (Fri, 19 Oct 2012)");
  script_cve_id("CVE-2012-3216", "CVE-2012-4416", "CVE-2012-5068", "CVE-2012-5069",
                "CVE-2012-5071", "CVE-2012-5072", "CVE-2012-5073", "CVE-2012-5075",
                "CVE-2012-5077", "CVE-2012-5079", "CVE-2012-5081", "CVE-2012-5084",
                "CVE-2012-5085", "CVE-2012-5086", "CVE-2012-5089");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_xref(name: "CESA", value: "2012:1385");
  script_name("CentOS Update for java CESA-2012:1385 centos5 ");

  script_tag(name: "summary" , value: "Check for the Version of java");
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

  if ((res = isrpmvuln(pkg:"java-1.6.0-openjdk", rpm:"java-1.6.0-openjdk~1.6.0.0~1.28.1.10.10.el5_8", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"java-1.6.0-openjdk-demo", rpm:"java-1.6.0-openjdk-demo~1.6.0.0~1.28.1.10.10.el5_8", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"java-1.6.0-openjdk-devel", rpm:"java-1.6.0-openjdk-devel-1.6.0.0~1.28.1.10.10.el5_8", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"java-1.6.0-openjdk-javadoc", rpm:"java-1.6.0-openjdk-javadoc~1.6.0.0~1.28.1.10.10.el5_8", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"java-1.6.0-openjdk-src", rpm:"java-1.6.0-openjdk-src~1.6.0.0~1.28.1.10.10.el5_8", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
