###############################################################################
# OpenVAS Vulnerability Test
#
# RedHat Update for nss and nspr RHSA-2014:1246-01
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (C) 2014 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.871244");
  script_version("$Revision: 12370 $");
  script_tag(name:"last_modification", value:"$Date: 2018-11-16 08:56:29 +0100 (Fri, 16 Nov 2018) $");
  script_tag(name:"creation_date", value:"2014-09-17 05:57:45 +0200 (Wed, 17 Sep 2014)");
  script_cve_id("CVE-2013-1740", "CVE-2014-1490", "CVE-2014-1491", "CVE-2014-1492", "CVE-2014-1545");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_name("RedHat Update for nss and nspr RHSA-2014:1246-01");
  script_tag(name: "insight", value: "Network Security Services (NSS) is a set of libraries designed to support
the cross-platform development of security-enabled client and server
applications.

A flaw was found in the way TLS False Start was implemented in NSS.
An attacker could use this flaw to potentially return unencrypted
information from the server. (CVE-2013-1740)

A race condition was found in the way NSS implemented session ticket
handling as specified by RFC 5077. An attacker could use this flaw to crash
an application using NSS or, in rare cases, execute arbitrary code with the
privileges of the user running that application. (CVE-2014-1490)

It was found that NSS accepted weak Diffie-Hellman Key exchange (DHKE)
parameters. This could possibly lead to weak encryption being used in
communication between the client and the server. (CVE-2014-1491)

An out-of-bounds write flaw was found in NSPR. A remote attacker could
potentially use this flaw to crash an application using NSPR or, possibly,
execute arbitrary code with the privileges of the user running that
application. This NSPR flaw was not exposed to web content in any shipped
version of Firefox. (CVE-2014-1545)

It was found that the implementation of Internationalizing Domain Names in
Applications (IDNA) hostname matching in NSS did not follow the RFC 6125
recommendations. This could lead to certain invalid certificates with
international characters to be accepted as valid. (CVE-2014-1492)

Red Hat would like to thank the Mozilla project for reporting the
CVE-2014-1490, CVE-2014-1491, and CVE-2014-1545 issues. Upstream
acknowledges Brian Smith as the original reporter of CVE-2014-1490, Antoine
Delignat-Lavaud and Karthikeyan Bhargavan as the original reporters of
CVE-2014-1491, and Abhishek Arya as the original reporter of CVE-2014-1545.

The nss and nspr packages have been upgraded to upstream version 3.16.1 and
4.10.6 respectively, which provide a number of bug fixes and enhancements
over the previous versions. (BZ#1110857, BZ#1110860)

This update also fixes the following bugs:

* Previously, when the output.log file was not present on the system, the
shell in the Network Security Services (NSS) specification handled test
failures incorrectly as false positive test results. Consequently, certain
utilities, such as 'grep', could not handle failures properly. This update
improves error detection in the specification file, and 'grep' and other
utilities now handle missing files or crashes as intended. (BZ#1035281)

* Prior to this update, a subordinate Certificate Authority (CA) of the
ANSSI agency incorrectly issued an intermediate c ... 

  Description truncated, for more information please check the Reference URL");
  script_tag(name: "affected", value: "nss and nspr on Red Hat Enterprise Linux (v. 5 server)");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");
  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");

  script_xref(name: "RHSA", value: "2014:1246-01");
  script_xref(name: "URL" , value: "https://www.redhat.com/archives/rhsa-announce/2014-September/msg00033.html");
  script_tag(name:"summary", value:"Check for the Version of nss and nspr");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2014 Greenbone Networks GmbH");
  script_family("Red Hat Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/rhel", "ssh/login/rpms", re:"ssh/login/release=RHENT_5");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-rpm.inc");

release = rpm_get_ssh_release();
if(!release) exit(0);

res = "";

if(release == "RHENT_5")
{

  if ((res = isrpmvuln(pkg:"nss", rpm:"nss~3.16.1~2.el5", rls:"RHENT_5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"nss-debuginfo", rpm:"nss-debuginfo~3.16.1~2.el5", rls:"RHENT_5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"nss-devel", rpm:"nss-devel~3.16.1~2.el5", rls:"RHENT_5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"nss-pkcs11-devel", rpm:"nss-pkcs11-devel~3.16.1~2.el5", rls:"RHENT_5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"nss-tools", rpm:"nss-tools~3.16.1~2.el5", rls:"RHENT_5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
