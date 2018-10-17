###############################################################################
# OpenVAS Vulnerability Test
#
# RedHat Update for java-1.7.0-openjdk RHSA-2013:1447-01
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

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.871060");
  script_version("$Revision: 9353 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-06 09:14:20 +0200 (Fri, 06 Apr 2018) $");
  script_tag(name:"creation_date", value:"2013-10-29 14:10:18 +0530 (Tue, 29 Oct 2013)");
  script_cve_id("CVE-2013-3829", "CVE-2013-4002", "CVE-2013-5772", "CVE-2013-5774",
                "CVE-2013-5778", "CVE-2013-5780", "CVE-2013-5782", "CVE-2013-5783",
                "CVE-2013-5784", "CVE-2013-5790", "CVE-2013-5797", "CVE-2013-5800",
                "CVE-2013-5802", "CVE-2013-5803", "CVE-2013-5804", "CVE-2013-5809",
                "CVE-2013-5814", "CVE-2013-5817", "CVE-2013-5820", "CVE-2013-5823",
                "CVE-2013-5825", "CVE-2013-5829", "CVE-2013-5830", "CVE-2013-5838",
                "CVE-2013-5840", "CVE-2013-5842", "CVE-2013-5849", "CVE-2013-5850",
                "CVE-2013-5851");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_name("RedHat Update for java-1.7.0-openjdk RHSA-2013:1447-01");

  tag_insight = "These packages provide the OpenJDK 7 Java Runtime Environment and the
OpenJDK 7 Software Development Kit.

Multiple input checking flaws were found in the 2D component native image
parsing code. A specially crafted image file could trigger a Java Virtual
Machine memory corruption and, possibly, lead to arbitrary code execution
with the privileges of the user running the Java Virtual Machine.
(CVE-2013-5782)

The class loader did not properly check the package access for non-public
proxy classes. A remote attacker could possibly use this flaw to execute
arbitrary code with the privileges of the user running the Java Virtual
Machine. (CVE-2013-5830)

Multiple improper permission check issues were discovered in the 2D, CORBA,
JNDI, and Libraries components in OpenJDK. An untrusted Java application or
applet could use these flaws to bypass Java sandbox restrictions.
(CVE-2013-5829, CVE-2013-5814, CVE-2013-5817, CVE-2013-5842, CVE-2013-5850,
CVE-2013-5838)

Multiple input checking flaws were discovered in the JPEG image reading and
writing code in the 2D component. An untrusted Java application or applet
could use these flaws to corrupt the Java Virtual Machine memory and bypass
Java sandbox restrictions. (CVE-2013-5809)

The FEATURE_SECURE_PROCESSING setting was not properly honored by the
javax.xml.transform package transformers. A remote attacker could use this
flaw to supply a crafted XML that would be processed without the intended
security restrictions. (CVE-2013-5802)

Multiple errors were discovered in the way the JAXP and Security components
processes XML inputs. A remote attacker could create a crafted XML that
would cause a Java application to use an excessive amount of CPU and memory
when processed. (CVE-2013-5825, CVE-2013-4002, CVE-2013-5823)

Multiple improper permission check issues were discovered in the Libraries,
Swing, JAX-WS, JAXP, JGSS, AWT, Beans, and Scripting components in OpenJDK.
An untrusted Java application or applet could use these flaws to bypass
certain Java sandbox restrictions. (CVE-2013-3829, CVE-2013-5840,
CVE-2013-5774, CVE-2013-5783, CVE-2013-5820, CVE-2013-5851, CVE-2013-5800,
CVE-2013-5849, CVE-2013-5790, CVE-2013-5784)

It was discovered that the 2D component image library did not properly
check bounds when performing image conversions. An untrusted Java
application or applet could use this flaw to disclose portions of the Java
Virtual Machine memory. (CVE-2013-5778)

Multiple input sanitization flaws were discovered in javadoc. When javadoc
documentation was generated from an untrusted Java source code and hosted
on a d ...

  Description truncated, for more information please check the Reference URL";

  tag_affected = "java-1.7.0-openjdk on Red Hat Enterprise Linux (v. 5 server)";

  tag_solution = "Please Install the Updated Packages.";


  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");
  script_xref(name: "RHSA", value: "2013:1447-01");
  script_xref(name: "URL" , value: "https://www.redhat.com/archives/rhsa-announce/2013-October/msg00018.html");
  script_tag(name: "summary" , value: "Check for the Version of java-1.7.0-openjdk");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2013 Greenbone Networks GmbH");
  script_family("Red Hat Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/rhel", "ssh/login/rpms");
  exit(0);
}


include("pkg-lib-rpm.inc");

release = get_kb_item("ssh/login/release");

res = "";
if(release == NULL){
  exit(0);
}

if(release == "RHENT_5")
{

  if ((res = isrpmvuln(pkg:"java-1.7.0-openjdk", rpm:"java-1.7.0-openjdk~1.7.0.45~2.4.3.1.el5_10", rls:"RHENT_5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"java-1.7.0-openjdk-debuginfo", rpm:"java-1.7.0-openjdk-debuginfo~1.7.0.45~2.4.3.1.el5_10", rls:"RHENT_5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"java-1.7.0-openjdk-demo", rpm:"java-1.7.0-openjdk-demo~1.7.0.45~2.4.3.1.el5_10", rls:"RHENT_5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"java-1.7.0-openjdk-devel", rpm:"java-1.7.0-openjdk-devel~1.7.0.45~2.4.3.1.el5_10", rls:"RHENT_5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"java-1.7.0-openjdk-javadoc", rpm:"java-1.7.0-openjdk-javadoc~1.7.0.45~2.4.3.1.el5_10", rls:"RHENT_5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"java-1.7.0-openjdk-src", rpm:"java-1.7.0-openjdk-src~1.7.0.45~2.4.3.1.el5_10", rls:"RHENT_5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
