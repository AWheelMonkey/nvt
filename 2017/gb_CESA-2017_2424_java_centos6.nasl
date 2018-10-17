###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_CESA-2017_2424_java_centos6.nasl 7013 2017-08-25 13:17:51Z asteins $
#
# CentOS Update for java CESA-2017:2424 centos6 
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
  script_oid("1.3.6.1.4.1.25623.1.0.882758");
  script_version("$Revision: 7013 $");
  script_tag(name:"last_modification", value:"$Date: 2017-08-25 15:17:51 +0200 (Fri, 25 Aug 2017) $");
  script_tag(name:"creation_date", value:"2017-08-16 07:30:12 +0200 (Wed, 16 Aug 2017)");
  script_cve_id("CVE-2017-10053", "CVE-2017-10067", "CVE-2017-10074", "CVE-2017-10081", 
                "CVE-2017-10087", "CVE-2017-10089", "CVE-2017-10090", "CVE-2017-10096", 
                "CVE-2017-10101", "CVE-2017-10102", "CVE-2017-10107", "CVE-2017-10108", 
                "CVE-2017-10109", "CVE-2017-10110", "CVE-2017-10115", "CVE-2017-10116", 
                "CVE-2017-10135", "CVE-2017-10243");
  script_tag(name:"cvss_base", value:"6.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
  script_tag(name:"qod_type", value:"package");
  script_name("CentOS Update for java CESA-2017:2424 centos6 ");
  script_tag(name: "summary", value: "Check the version of java");
  script_tag(name: "vuldetect", value: "Get the installed version with the help 
of detect NVT and check if the version is vulnerable or not.");
  script_tag(name: "insight", value: "The java-1.7.0-openjdk packages provide the 
OpenJDK 7 Java Runtime Environment and the OpenJDK 7 Java Software Development Kit.

Security Fix(es):

* It was discovered that the DCG implementation in the RMI component of
OpenJDK failed to correctly handle references. A remote attacker could
possibly use this flaw to execute arbitrary code with the privileges of RMI
registry or a Java RMI application. (CVE-2017-10102)

* Multiple flaws were discovered in the RMI, JAXP, ImageIO, Libraries, AWT,
Hotspot, and Security components in OpenJDK. An untrusted Java application
or applet could use these flaws to completely bypass Java sandbox
restrictions. (CVE-2017-10107, CVE-2017-10096, CVE-2017-10101,
CVE-2017-10089, CVE-2017-10090, CVE-2017-10087, CVE-2017-10110,
CVE-2017-10074, CVE-2017-10067)

* It was discovered that the LDAPCertStore class in the Security component
of OpenJDK followed LDAP referrals to arbitrary URLs. A specially crafted
LDAP referral URL could cause LDAPCertStore to communicate with non-LDAP
servers. (CVE-2017-10116)

* It was discovered that the wsdlimport tool in the JAX-WS component of
OpenJDK did not use secure XML parser settings when parsing WSDL XML
documents. A specially crafted WSDL document could cause wsdlimport to use
an excessive amount of CPU and memory, open connections to other hosts, or
leak information. (CVE-2017-10243)

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

* A flaw was found in the Hotspot component in OpenJDK. An untrusted Java
application or applet could use this flaw to bypass certain Java sandbox
restrictions. (CVE-2017-10081)

* It was discovered that the JPEGImageReader implementation in the 2D
component of OpenJDK would, in certain cases, read all image data even if
it was not used later. A specially crafted image could cause a Java
application to temporarily use an excessive amount of CPU and memory.
(CVE-2017-10053)
");
  script_tag(name: "affected", value: "java on CentOS 6");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");

  script_xref(name: "CESA", value: "2017:2424");
  script_xref(name: "URL" , value: "http://lists.centos.org/pipermail/centos-announce/2017-August/022517.html");
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

  if ((res = isrpmvuln(pkg:"java-1.7.0-openjdk", rpm:"java-1.7.0-openjdk~1.7.0.151~2.6.11.0.el6_9", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"java-1.7.0-openjdk-demo", rpm:"java-1.7.0-openjdk-demo~1.7.0.151~2.6.11.0.el6_9", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"java-1.7.0-openjdk-devel", rpm:"java-1.7.0-openjdk-devel~1.7.0.151~2.6.11.0.el6_9", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"java-1.7.0-openjdk-javadoc", rpm:"java-1.7.0-openjdk-javadoc~1.7.0.151~2.6.11.0.el6_9", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"java-1.7.0-openjdk-src", rpm:"java-1.7.0-openjdk-src~1.7.0.151~2.6.11.0.el6_9", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
