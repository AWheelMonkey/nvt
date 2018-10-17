###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_CESA-2017_1789_java_centos6.nasl 6981 2017-08-22 06:39:29Z asteins $
#
# CentOS Update for java CESA-2017:1789 centos6 
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (C) 2017 Greenbone Networks GmbH, http://www.greenbone.net
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

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.882754");
  script_version("$Revision: 6981 $");
  script_tag(name:"last_modification", value:"$Date: 2017-08-22 08:39:29 +0200 (Tue, 22 Aug 2017) $");
  script_tag(name:"creation_date", value:"2017-07-22 07:21:17 +0200 (Sat, 22 Jul 2017)");
  script_cve_id("CVE-2017-10053", "CVE-2017-10067", "CVE-2017-10074", "CVE-2017-10078", 
                "CVE-2017-10081", "CVE-2017-10087", "CVE-2017-10089", "CVE-2017-10090", 
                "CVE-2017-10096", "CVE-2017-10101", "CVE-2017-10102", "CVE-2017-10107", 
                "CVE-2017-10108", "CVE-2017-10109", "CVE-2017-10110", "CVE-2017-10111", 
                "CVE-2017-10115", "CVE-2017-10116", "CVE-2017-10135", "CVE-2017-10193", 
                "CVE-2017-10198");
  script_tag(name:"cvss_base", value:"6.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
  script_tag(name:"qod_type", value:"package");
  script_name("CentOS Update for java CESA-2017:1789 centos6 ");
  script_tag(name: "summary", value: "Check the version of java");
  script_tag(name: "vuldetect", value: "Get the installed version with the help 
of detect NVT and check if the version is vulnerable or not.");
  script_tag(name: "insight", value: "The java-1.8.0-openjdk packages provide 
the OpenJDK 8 Java Runtime Environment and the OpenJDK 8 Java Software Development Kit.

Security Fix(es):

* It was discovered that the DCG implementation in the RMI component of
OpenJDK failed to correctly handle references. A remote attacker could
possibly use this flaw to execute arbitrary code with the privileges of RMI
registry or a Java RMI application. (CVE-2017-10102)

* Multiple flaws were discovered in the RMI, JAXP, ImageIO, Libraries, AWT,
Hotspot, and Security components in OpenJDK. An untrusted Java application
or applet could use these flaws to completely bypass Java sandbox
restrictions. (CVE-2017-10107, CVE-2017-10096, CVE-2017-10101,
CVE-2017-10089, CVE-2017-10090, CVE-2017-10087, CVE-2017-10111,
CVE-2017-10110, CVE-2017-10074, CVE-2017-10067)

* It was discovered that the LDAPCertStore class in the Security component
of OpenJDK followed LDAP referrals to arbitrary URLs. A specially crafted
LDAP referral URL could cause LDAPCertStore to communicate with non-LDAP
servers. (CVE-2017-10116)

* It was discovered that the Nashorn JavaScript engine in the Scripting
component of OpenJDK could allow scripts to access Java APIs even when
access to Java APIs was disabled. An untrusted JavaScript executed by
Nashorn could use this flaw to bypass intended restrictions.
(CVE-2017-10078)

* It was discovered that the Security component of OpenJDK could fail to
properly enforce restrictions defined for processing of X.509 certificate
chains. A remote attacker could possibly use this flaw to make Java accept
certificate using one of the disabled algorithms. (CVE-2017-10198)

* A covert timing channel flaw was found in the DSA implementation in the
JCE component of OpenJDK. A remote attacker able to make a Java application
generate DSA signatures on demand could possibly use this flaw to extract
certain information about the used key via a timing side channel.
(CVE-2017-10115)

* A covert timing channel flaw was found in the PKCS#8 implementation in
the JCE component of OpenJDK. A remote attacker able to make a Java
application repeatedly compare PKCS#8 key against an attacker controlled
value could possibly use this flaw to determine the key via a timing side
channel. (CVE-2017-10135)

* It was discovered that the BasicAttribute and CodeSource classes in
OpenJDK did not limit the amount of memory allocated when creating object
instances from a serialized form. A specially crafted serialized input
stream could cause Java to consume an excessive amount of memory.
(CVE-2017-10108, CVE-2017-10109)

* Multiple flaws were found in the Hotspot and Security compone ... 

  Description truncated, for more information please check the Reference URL");
  script_tag(name: "affected", value: "java on CentOS 6");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");

  script_xref(name: "CESA", value: "2017:1789");
  script_xref(name: "URL" , value: "http://lists.centos.org/pipermail/centos-announce/2017-July/022508.html");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("CentOS Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/centos", "ssh/login/rpms");
  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-rpm.inc");

release = get_kb_item("ssh/login/release");

res = "";
if(release == NULL){
  exit(0);
}

if(release == "CentOS6")
{

  if ((res = isrpmvuln(pkg:"java-1.8.0-openjdk", rpm:"java-1.8.0-openjdk~1.8.0.141~2.b16.el6_9", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"java-1.8.0-openjdk-debug", rpm:"java-1.8.0-openjdk-debug~1.8.0.141~2.b16.el6_9", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"java-1.8.0-openjdk-demo", rpm:"java-1.8.0-openjdk-demo~1.8.0.141~2.b16.el6_9", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"java-1.8.0-openjdk-demo-debug", rpm:"java-1.8.0-openjdk-demo-debug~1.8.0.141~2.b16.el6_9", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"java-1.8.0-openjdk-devel", rpm:"java-1.8.0-openjdk-devel~1.8.0.141~2.b16.el6_9", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"java-1.8.0-openjdk-devel-debug", rpm:"java-1.8.0-openjdk-devel-debug~1.8.0.141~2.b16.el6_9", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"java-1.8.0-openjdk-headless", rpm:"java-1.8.0-openjdk-headless~1.8.0.141~2.b16.el6_9", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"java-1.8.0-openjdk-headless-debug", rpm:"java-1.8.0-openjdk-headless-debug~1.8.0.141~2.b16.el6_9", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"java-1.8.0-openjdk-javadoc", rpm:"java-1.8.0-openjdk-javadoc~1.8.0.141~2.b16.el6_9", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"java-1.8.0-openjdk-javadoc-debug", rpm:"java-1.8.0-openjdk-javadoc-debug~1.8.0.141~2.b16.el6_9", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"java-1.8.0-openjdk-src", rpm:"java-1.8.0-openjdk-src~1.8.0.141~2.b16.el6_9", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"java-1.8.0-openjdk-src-debug", rpm:"java-1.8.0-openjdk-src-debug~1.8.0.141~2.b16.el6_9", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
