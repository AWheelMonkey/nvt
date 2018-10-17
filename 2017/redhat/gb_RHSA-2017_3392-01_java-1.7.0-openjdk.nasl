###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_RHSA-2017_3392-01_java-1.7.0-openjdk.nasl 8118 2017-12-14 08:01:12Z asteins $
#
# RedHat Update for java-1.7.0-openjdk RHSA-2017:3392-01
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
  script_oid("1.3.6.1.4.1.25623.1.0.812340");
  script_version("$Revision: 8118 $");
  script_tag(name:"last_modification", value:"$Date: 2017-12-14 09:01:12 +0100 (Thu, 14 Dec 2017) $");
  script_tag(name:"creation_date", value:"2017-12-07 07:36:42 +0100 (Thu, 07 Dec 2017)");
  script_cve_id("CVE-2017-10193", "CVE-2017-10198", "CVE-2017-10274", "CVE-2017-10281",
                "CVE-2017-10285", "CVE-2017-10295", "CVE-2017-10345", "CVE-2017-10346",
                "CVE-2017-10347", "CVE-2017-10348", "CVE-2017-10349", "CVE-2017-10350",
                "CVE-2017-10355", "CVE-2017-10356", "CVE-2017-10357", "CVE-2017-10388");
  script_tag(name:"cvss_base", value:"6.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
  script_tag(name:"qod_type", value:"package");
  script_name("RedHat Update for java-1.7.0-openjdk RHSA-2017:3392-01");
  script_tag(name: "summary", value: "Check the version of java-1.7.0-openjdk");
  script_tag(name: "vuldetect", value: "Get the installed version with the help
of detect NVT and check if the version is vulnerable or not.");
  script_tag(name: "insight", value: "The java-1.7.0-openjdk packages provide the
OpenJDK 7 Java Runtime Environment and the OpenJDK 7 Java Software Development Kit.

Security Fix(es):

* Multiple flaws were discovered in the RMI and Hotspot components in
OpenJDK. An untrusted Java application or applet could use these flaws to
completely bypass Java sandbox restrictions. (CVE-2017-10285,
CVE-2017-10346)

* It was discovered that the Kerberos client implementation in the
Libraries component of OpenJDK used the sname field from the plain text
part rather than encrypted part of the KDC reply message. A
man-in-the-middle attacker could possibly use this flaw to impersonate
Kerberos services to Java applications acting as Kerberos clients.
(CVE-2017-10388)

* It was discovered that the Security component of OpenJDK generated weak
password-based encryption keys used to protect private keys stored in key
stores. This made it easier to perform password guessing attacks to decrypt
stored keys if an attacker could gain access to a key store.
(CVE-2017-10356)

* Multiple flaws were found in the Smart Card IO and Security components in
OpenJDK. An untrusted Java application or applet could use these flaws to
bypass certain Java sandbox restrictions. (CVE-2017-10274, CVE-2017-10193)

* It was found that the FtpClient implementation in the Networking
component of OpenJDK did not set connect and read timeouts by default. A
malicious FTP server or a man-in-the-middle attacker could use this flaw to
block execution of a Java application connecting to an FTP server.
(CVE-2017-10355)

* It was found that the HttpURLConnection and HttpsURLConnection classes in
the Networking component of OpenJDK failed to check for newline characters
embedded in URLs. An attacker able to make a Java application perform an
HTTP request using an attacker provided URL could possibly inject
additional headers into the request. (CVE-2017-10295)

* It was discovered that the Security component of OpenJDK could fail to
properly enforce restrictions defined for processing of X.509 certificate
chains. A remote attacker could possibly use this flaw to make Java accept
certificate using one of the disabled algorithms. (CVE-2017-10198)

* It was discovered that multiple classes in the JAXP, Serialization,
Libraries, and JAX-WS components of OpenJDK did not limit the amount of
memory allocated when creating object instances from the serialized form. A
specially-crafted input could cause a Java application to use ... 

  Description truncated, for more information please check the Reference URL");
  script_tag(name: "affected", value: "java-1.7.0-openjdk on
  Red Hat Enterprise Linux Desktop (v. 6),
  Red Hat Enterprise Linux Server (v. 6),
  Red Hat Enterprise Linux Server (v. 7),
  Red Hat Enterprise Linux Workstation (v. 6)");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");

  script_xref(name: "RHSA", value: "2017:3392-01");
  script_xref(name: "URL" , value: "https://www.redhat.com/archives/rhsa-announce/2017-December/msg00006.html");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("Red Hat Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/rhel", "ssh/login/rpms");
  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-rpm.inc");

release = get_kb_item("ssh/login/release");

res = "";
if(release == NULL){
  exit(0);
}

if(release == "RHENT_7")
{

  if ((res = isrpmvuln(pkg:"java-1.7.0-openjdk", rpm:"java-1.7.0-openjdk~1.7.0.161~2.6.12.0.el7_4", rls:"RHENT_7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"java-1.7.0-openjdk-debuginfo", rpm:"java-1.7.0-openjdk-debuginfo~1.7.0.161~2.6.12.0.el7_4", rls:"RHENT_7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"java-1.7.0-openjdk-devel", rpm:"java-1.7.0-openjdk-devel~1.7.0.161~2.6.12.0.el7_4", rls:"RHENT_7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"java-1.7.0-openjdk-headless", rpm:"java-1.7.0-openjdk-headless~1.7.0.161~2.6.12.0.el7_4", rls:"RHENT_7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}


if(release == "RHENT_6")
{

  if ((res = isrpmvuln(pkg:"java-1.7.0-openjdk", rpm:"java-1.7.0-openjdk~1.7.0.161~2.6.12.0.el6_9", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"java-1.7.0-openjdk-debuginfo", rpm:"java-1.7.0-openjdk-debuginfo~1.7.0.161~2.6.12.0.el6_9", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"java-1.7.0-openjdk-devel", rpm:"java-1.7.0-openjdk-devel~1.7.0.161~2.6.12.0.el6_9", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
