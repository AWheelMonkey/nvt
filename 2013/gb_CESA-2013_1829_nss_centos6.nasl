###############################################################################
# OpenVAS Vulnerability Test
#
# CentOS Update for nss CESA-2013:1829 centos6 
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (C) 2013 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.881838");
  script_version("$Revision: 9353 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-06 09:14:20 +0200 (Fri, 06 Apr 2018) $");
  script_tag(name:"creation_date", value:"2013-12-17 11:57:39 +0530 (Tue, 17 Dec 2013)");
  script_cve_id("CVE-2013-1739", "CVE-2013-1741", "CVE-2013-5605", "CVE-2013-5606", "CVE-2013-5607", "CVE-2013-1620");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_name("CentOS Update for nss CESA-2013:1829 centos6 ");

  tag_insight = "Network Security Services (NSS) is a set of libraries designed to support
the cross-platform development of security-enabled client and server
applications. Netscape Portable Runtime (NSPR) provides platform
independence for non-GUI operating system facilities.

A flaw was found in the way NSS handled invalid handshake packets. A remote
attacker could use this flaw to cause a TLS/SSL client using NSS to crash
or, possibly, execute arbitrary code with the privileges of the user
running the application. (CVE-2013-5605)

It was found that the fix for CVE-2013-1620 released via RHSA-2013:1135
introduced a regression causing NSS to read uninitialized data when a
decryption failure occurred. A remote attacker could use this flaw to cause
a TLS/SSL server using NSS to crash. (CVE-2013-1739)

An integer overflow flaw was discovered in both NSS and NSPR's
implementation of certification parsing on 64-bit systems. A remote
attacker could use these flaws to cause an application using NSS or NSPR to
crash. (CVE-2013-1741, CVE-2013-5607)

It was discovered that NSS did not reject certificates with incompatible
key usage constraints when validating them while the verifyLog feature was
enabled. An application using the NSS certificate validation API could
accept an invalid certificate. (CVE-2013-5606)

Red Hat would like to thank the Mozilla project for reporting
CVE-2013-1741, CVE-2013-5606, and CVE-2013-5607. Upstream acknowledges
Tavis Ormandy as the original reporter of CVE-2013-1741, Camilo Viecco as
the original reporter of CVE-2013-5606, and Pascal Cuoq, Kamil Dudka, and
Wan-Teh Chang as the original reporters of CVE-2013-5607.

All NSS, NSPR, and nss-util users are advised to upgrade to these updated
packages, which contain backported patches to correct these issues.
After installing this update, applications using NSS, NSPR, or nss-util
must be restarted for this update to take effect.
";

  tag_affected = "nss on CentOS 6";

  tag_solution = "Please Install the Updated Packages.";


  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");
  script_xref(name: "CESA", value: "2013:1829");
  script_xref(name: "URL" , value: "http://lists.centos.org/pipermail/centos-announce/2013-December/020071.html");
  script_tag(name: "summary" , value: "Check for the Version of nss");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2013 Greenbone Networks GmbH");
  script_family("CentOS Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/centos", "ssh/login/rpms");
  exit(0);
}


include("pkg-lib-rpm.inc");

release = get_kb_item("ssh/login/release");

res = "";
if(release == NULL){
  exit(0);
}

if(release == "CentOS6")
{

  if ((res = isrpmvuln(pkg:"nss", rpm:"nss~3.15.3~2.el6_5", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"nss-devel", rpm:"nss-devel~3.15.3~2.el6_5", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"nss-pkcs11-devel", rpm:"nss-pkcs11-devel~3.15.3~2.el6_5", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"nss-sysinit", rpm:"nss-sysinit~3.15.3~2.el6_5", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"nss-tools", rpm:"nss-tools~3.15.3~2.el6_5", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}