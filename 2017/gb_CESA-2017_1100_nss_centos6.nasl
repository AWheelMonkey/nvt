###############################################################################
# OpenVAS Vulnerability Test
#
# CentOS Update for nss CESA-2017:1100 centos6 
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
  script_oid("1.3.6.1.4.1.25623.1.0.882701");
  script_version("$Revision: 6659 $");
  script_tag(name:"last_modification", value:"$Date: 2017-07-10 13:52:22 +0200 (Mon, 10 Jul 2017) $");
  script_tag(name:"creation_date", value:"2017-04-21 06:41:51 +0200 (Fri, 21 Apr 2017)");
  script_cve_id("CVE-2017-5461");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_tag(name:"qod_type", value:"package");
  script_name("CentOS Update for nss CESA-2017:1100 centos6 ");
  script_tag(name: "summary", value: "Check the version of nss");
  script_tag(name: "vuldetect", value: "Get the installed version with the help 
of detect NVT and check if the version is vulnerable or not.");
  script_tag(name: "insight", value: "Network Security Services (NSS) is a set of 
libraries designed to support the cross-platform development of security-enabled 
client and server applications.

The nss-util packages provide utilities for use with the Network Security
Services (NSS) libraries.

The following packages have been upgraded to a newer upstream version: nss
(3.28.4), nss-util (3.28.4).

Security Fix(es):

* An out-of-bounds write flaw was found in the way NSS performed certain
Base64-decoding operations. An attacker could use this flaw to create a
specially crafted certificate which, when parsed by NSS, could cause it to
crash or execute arbitrary code, using the permissions of the user running
an application compiled against the NSS library. (CVE-2017-5461)

Red Hat would like to thank the Mozilla project for reporting this issue.
Upstream acknowledges Ronald Crane as the original reporter.
");
  script_tag(name: "affected", value: "nss on CentOS 6");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");

  script_xref(name: "CESA", value: "2017:1100");
  script_xref(name: "URL" , value: "http://lists.centos.org/pipermail/centos-announce/2017-April/022392.html");
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

  if ((res = isrpmvuln(pkg:"nss", rpm:"nss~3.28.4~1.el6_9", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"nss-devel", rpm:"nss-devel~3.28.4~1.el6_9", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"nss-pkcs11-devel", rpm:"nss-pkcs11-devel~3.28.4~1.el6_9", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"nss-sysinit", rpm:"nss-sysinit~3.28.4~1.el6_9", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"nss-tools", rpm:"nss-tools~3.28.4~1.el6_9", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
