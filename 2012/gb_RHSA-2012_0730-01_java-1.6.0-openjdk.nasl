###############################################################################
# OpenVAS Vulnerability Test
#
# RedHat Update for java-1.6.0-openjdk RHSA-2012:0730-01
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

  Multiple flaws were discovered in the CORBA (Common Object Request Broker
  Architecture) implementation in Java. A malicious Java application or
  applet could use these flaws to bypass Java sandbox restrictions or modify
  immutable object data. (CVE-2012-1711, CVE-2012-1719)

  It was discovered that the SynthLookAndFeel class from Swing did not
  properly prevent access to certain UI elements from outside the current
  application context. A malicious Java application or applet could use this
  flaw to crash the Java Virtual Machine, or bypass Java sandbox
  restrictions. (CVE-2012-1716)

  Multiple flaws were discovered in the font manager's layout lookup
  implementation. A specially-crafted font file could cause the Java Virtual
  Machine to crash or, possibly, execute arbitrary code with the privileges
  of the user running the virtual machine. (CVE-2012-1713)

  Multiple flaws were found in the way the Java HotSpot Virtual Machine
  verified the bytecode of the class file to be executed. A specially-crafted
  Java application or applet could use these flaws to crash the Java Virtual
  Machine, or bypass Java sandbox restrictions. (CVE-2012-1723,
  CVE-2012-1725)

  It was discovered that the Java XML parser did not properly handle certain
  XML documents. An attacker able to make a Java application parse a
  specially-crafted XML file could use this flaw to make the XML parser enter
  an infinite loop. (CVE-2012-1724)

  It was discovered that the Java security classes did not properly handle
  Certificate Revocation Lists (CRL). CRL containing entries with duplicate
  certificate serial numbers could have been ignored. (CVE-2012-1718)

  It was discovered that various classes of the Java Runtime library could
  create temporary files with insecure permissions. A local attacker could
  use this flaw to gain access to the content of such temporary files.
  (CVE-2012-1717)

  This erratum also upgrades the OpenJDK package to IcedTea6 1.10.8. Refer to
  the NEWS file, linked to in the References, for further information.

  All users of java-1.6.0-openjdk are advised to upgrade to these updated
  packages, which resolve these issues. All running instances of OpenJDK Java
  must be restarted for the update to take effect.";

tag_affected = "java-1.6.0-openjdk on Red Hat Enterprise Linux (v. 5 server)";
tag_solution = "Please Install the Updated Packages.";



if(description)
{
  script_xref(name : "URL" , value : "https://www.redhat.com/archives/rhsa-announce/2012-June/msg00010.html");
  script_oid("1.3.6.1.4.1.25623.1.0.870753");
  script_tag(name:"cvss_base", value:"10.0");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
 script_version("$Revision: 9352 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-06 09:13:02 +0200 (Fri, 06 Apr 2018) $");
  script_tag(name:"creation_date", value:"2012-06-15 09:45:33 +0530 (Fri, 15 Jun 2012)");
  script_cve_id("CVE-2012-1711", "CVE-2012-1713", "CVE-2012-1716", "CVE-2012-1717",
                "CVE-2012-1718", "CVE-2012-1719", "CVE-2012-1723", "CVE-2012-1724",
                "CVE-2012-1725");
  script_xref(name: "RHSA", value: "2012:0730-01");
  script_name("RedHat Update for java-1.6.0-openjdk RHSA-2012:0730-01");

  script_tag(name: "summary" , value: "Check for the Version of java-1.6.0-openjdk");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2012 Greenbone Networks GmbH");
  script_family("Red Hat Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/rhel", "ssh/login/rpms");
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

if(release == "RHENT_5")
{

  if ((res = isrpmvuln(pkg:"java-1.6.0-openjdk", rpm:"java-1.6.0-openjdk~1.6.0.0~1.27.1.10.8.el5_8", rls:"RHENT_5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"java-1.6.0-openjdk-debuginfo", rpm:"java-1.6.0-openjdk-debuginfo~1.6.0.0~1.27.1.10.8.el5_8", rls:"RHENT_5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"java-1.6.0-openjdk-demo", rpm:"java-1.6.0-openjdk-demo~1.6.0.0~1.27.1.10.8.el5_8", rls:"RHENT_5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"java-1.6.0-openjdk-devel", rpm:"java-1.6.0-openjdk-devel~1.6.0.0~1.27.1.10.8.el5_8", rls:"RHENT_5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"java-1.6.0-openjdk-javadoc", rpm:"java-1.6.0-openjdk-javadoc~1.6.0.0~1.27.1.10.8.el5_8", rls:"RHENT_5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"java-1.6.0-openjdk-src", rpm:"java-1.6.0-openjdk-src~1.6.0.0~1.27.1.10.8.el5_8", rls:"RHENT_5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
