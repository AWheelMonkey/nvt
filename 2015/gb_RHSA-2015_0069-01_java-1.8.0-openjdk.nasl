###############################################################################
# OpenVAS Vulnerability Test
#
# RedHat Update for java-1.8.0-openjdk RHSA-2015:0069-01
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (C) 2015 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.871297");
  script_version("$Revision: 12370 $");
  script_tag(name:"last_modification", value:"$Date: 2018-11-16 08:56:29 +0100 (Fri, 16 Nov 2018) $");
  script_tag(name:"creation_date", value:"2015-01-23 12:55:06 +0100 (Fri, 23 Jan 2015)");
  script_cve_id("CVE-2014-3566", "CVE-2014-6549", "CVE-2014-6585", "CVE-2014-6587",
                "CVE-2014-6591", "CVE-2014-6593", "CVE-2014-6601", "CVE-2015-0383",
                "CVE-2015-0395", "CVE-2015-0407", "CVE-2015-0408", "CVE-2015-0410",
                "CVE-2015-0412", "CVE-2015-0437");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_name("RedHat Update for java-1.8.0-openjdk RHSA-2015:0069-01");
  script_tag(name: "summary", value: "Check the version of java-1.8.0-openjdk");
  script_tag(name: "vuldetect", value: "Get the installed version with the help of detect NVT and check if the version is vulnerable or not.");
  script_tag(name: "insight", value: "The java-1.8.0-openjdk packages provide the OpenJDK 8 Java Runtime
Environment and the OpenJDK 8 Java Software Development Kit.

Multiple flaws were found in the way the Hotspot component in OpenJDK
verified bytecode from the class files, and in the way this component
generated code for bytecode. An untrusted Java application or applet could
possibly use these flaws to bypass Java sandbox restrictions.
(CVE-2014-6601, CVE-2015-0437)

Multiple improper permission check issues were discovered in the JAX-WS,
Libraries, and RMI components in OpenJDK. An untrusted Java application or
applet could use these flaws to bypass Java sandbox restrictions.
(CVE-2015-0412, CVE-2014-6549, CVE-2015-0408)

A flaw was found in the way the Hotspot garbage collector handled phantom
references. An untrusted Java application or applet could use this flaw to
corrupt the Java Virtual Machine memory and, possibly, execute arbitrary
code, bypassing Java sandbox restrictions. (CVE-2015-0395)

A flaw was found in the way the DER (Distinguished Encoding Rules) decoder
in the Security component in OpenJDK handled negative length values. A
specially crafted, DER-encoded input could cause a Java application to
enter an infinite loop when decoded. (CVE-2015-0410)

A flaw was found in the way the SSL 3.0 protocol handled padding bytes when
decrypting messages that were encrypted using block ciphers in cipher block
chaining (CBC) mode. This flaw could possibly allow a man-in-the-middle
(MITM) attacker to decrypt portions of the cipher text using a padding
oracle attack. (CVE-2014-3566)

Note: This update disables SSL 3.0 by default to address this issue.
The jdk.tls.disabledAlgorithms security property can be used to re-enable
SSL 3.0 support if needed. For additional information, refer to the Red Hat
Bugzilla bug linked to in the References section.

It was discovered that the SSL/TLS implementation in the JSSE component in
OpenJDK failed to properly check whether the ChangeCipherSpec was received
during the SSL/TLS connection handshake. An MITM attacker could possibly
use this flaw to force a connection to be established without encryption
being enabled. (CVE-2014-6593)

An information leak flaw was found in the Swing component in OpenJDK. An
untrusted Java application or applet could use this flaw to bypass certain
Java sandbox restrictions. (CVE-2015-0407)

A NULL pointer dereference flaw was found in the MulticastSocket
implementation in the Libraries component of OpenJDK. An untrusted Java
applic ... 

  Description truncated, for more information please check the Reference URL");
  script_tag(name: "affected", value: "java-1.8.0-openjdk on Red Hat Enterprise Linux Desktop (v. 6),
  Red Hat Enterprise Linux Server (v. 6),
  Red Hat Enterprise Linux Workstation (v. 6)");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");
  script_xref(name: "RHSA", value: "2015:0069-01");
  script_xref(name: "URL" , value: "https://www.redhat.com/archives/rhsa-announce/2015-January/msg00025.html");
  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"package");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2015 Greenbone Networks GmbH");
  script_family("Red Hat Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/rhel", "ssh/login/rpms", re:"ssh/login/release=RHENT_6");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-rpm.inc");

release = rpm_get_ssh_release();
if(!release) exit(0);

res = "";

if(release == "RHENT_6")
{

  if ((res = isrpmvuln(pkg:"java-1.8.0-openjdk", rpm:"java-1.8.0-openjdk~1.8.0.31~1.b13.el6_6", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"java-1.8.0-openjdk-debuginfo", rpm:"java-1.8.0-openjdk-debuginfo~1.8.0.31~1.b13.el6_6", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"java-1.8.0-openjdk-devel", rpm:"java-1.8.0-openjdk-devel~1.8.0.31~1.b13.el6_6", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"java-1.8.0-openjdk-headless", rpm:"java-1.8.0-openjdk-headless~1.8.0.31~1.b13.el6_6", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
