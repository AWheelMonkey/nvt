###############################################################################
# OpenVAS Vulnerability Test
#
# CentOS Update for java CESA-2016:2658 centos5 
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (C) 2016 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.882600");
  script_version("$Revision: 8032 $");
  script_tag(name:"last_modification", value:"$Date: 2017-12-07 15:40:57 +0100 (Thu, 07 Dec 2017) $");
  script_tag(name:"creation_date", value:"2016-11-20 05:37:35 +0100 (Sun, 20 Nov 2016)");
  script_cve_id("CVE-2016-5542", "CVE-2016-5554", "CVE-2016-5573", "CVE-2016-5582", 
                "CVE-2016-5597");
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_tag(name:"qod_type", value:"package");
  script_name("CentOS Update for java CESA-2016:2658 centos5 ");
  script_tag(name: "vuldetect", value: "Get the installed version with the help 
of detect NVT and check if the version is vulnerable or not.");
  script_tag(name: "insight", value: "The java-1.7.0-openjdk packages provide the 
OpenJDK 7 Java Runtime Environment and the OpenJDK 7 Java Software Development Kit.

Security Fix(es):

* It was discovered that the Hotspot component of OpenJDK did not properly
check arguments of the System.arraycopy() function in certain cases. An
untrusted Java application or applet could use this flaw to corrupt virtual
machine's memory and completely bypass Java sandbox restrictions.
(CVE-2016-5582)

* It was discovered that the Hotspot component of OpenJDK did not properly
check received Java Debug Wire Protocol (JDWP) packets. An attacker could
possibly use this flaw to send debugging commands to a Java program running
with debugging enabled if they could make victim's browser send HTTP
requests to the JDWP port of the debugged application. (CVE-2016-5573)

* It was discovered that the Libraries component of OpenJDK did not
restrict the set of algorithms used for Jar integrity verification. This
flaw could allow an attacker to modify content of the Jar file that used
weak signing key or hash algorithm. (CVE-2016-5542)

Note: After this update, MD2 hash algorithm and RSA keys with less than
1024 bits are no longer allowed to be used for Jar integrity verification
by default. MD5 hash algorithm is expected to be disabled by default in the
future updates. A newly introduced security property
jdk.jar.disabledAlgorithms can be used to control the set of disabled
algorithms.

* A flaw was found in the way the JMX component of OpenJDK handled
classloaders. An untrusted Java application or applet could use this flaw
to bypass certain Java sandbox restrictions. (CVE-2016-5554)

* A flaw was found in the way the Networking component of OpenJDK handled
HTTP proxy authentication. A Java application could possibly expose HTTPS
server authentication credentials via a plain text network connection to an
HTTP proxy if proxy asked for authentication. (CVE-2016-5597)

Note: After this update, Basic HTTP proxy authentication can no longer be
used when tunneling HTTPS connection through an HTTP proxy. Newly
introduced system properties jdk.http.auth.proxying.disabledSchemes and
jdk.http.auth.tunneling.disabledSchemes can be used to control which
authentication schemes can be requested by an HTTP proxy when proxying HTTP
and HTTPS connections respectively.
");
  script_tag(name: "affected", value: "java on CentOS 5");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");

  script_xref(name: "CESA", value: "2016:2658");
  script_xref(name: "URL" , value: "http://lists.centos.org/pipermail/centos-announce/2016-November/022158.html");
  script_tag(name: "summary" , value: "Check for the Version of java");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
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

if(release == "CentOS5")
{

  if ((res = isrpmvuln(pkg:"java-1.7.0-openjdk", rpm:"java-1.7.0-openjdk~1.7.0.121~2.6.8.1.el5_11", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"java-1.7.0-openjdk-demo", rpm:"java-1.7.0-openjdk-demo~1.7.0.121~2.6.8.1.el5_11", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"java-1.7.0-openjdk-devel", rpm:"java-1.7.0-openjdk-devel~1.7.0.121~2.6.8.1.el5_11", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"java-1.7.0-openjdk-javadoc", rpm:"java-1.7.0-openjdk-javadoc~1.7.0.121~2.6.8.1.el5_11", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"java-1.7.0-openjdk-src", rpm:"java-1.7.0-openjdk-src~1.7.0.121~2.6.8.1.el5_11", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
