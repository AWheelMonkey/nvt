###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_CESA-2017_2832_nss_centos7.nasl 10824 2018-08-08 02:52:53Z ckuersteiner $
#
# CentOS Update for nss CESA-2017:2832 centos7 
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
  script_oid("1.3.6.1.4.1.25623.1.0.882779");
  script_version("$Revision: 10824 $");
  script_tag(name:"last_modification", value:"$Date: 2018-08-08 04:52:53 +0200 (Wed, 08 Aug 2018) $");
  script_tag(name:"creation_date", value:"2017-10-05 11:54:53 +0530 (Thu, 05 Oct 2017)");
  script_cve_id("CVE-2017-7805");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:P");
  script_tag(name:"qod_type", value:"package");
  script_name("CentOS Update for nss CESA-2017:2832 centos7 ");
  script_tag(name: "summary", value: "Check the version of nss");
  script_tag(name: "vuldetect", value: "Get the installed version with the help 
of detect NVT and check if the version is vulnerable or not.");
  script_tag(name: "insight", value: "Network Security Services (NSS) is a set 
of libraries designed to support the cross-platform development of security-enabled 
client and server applications.

Security Fix(es):

* A use-after-free flaw was found in the TLS 1.2 implementation in the NSS
library when client authentication was used. A malicious client could use
this flaw to cause an application compiled against NSS to crash or,
potentially, execute arbitrary code with the permission of the user running
the application. (CVE-2017-7805)

Red Hat would like to thank the Mozilla project for reporting this issue.
Upstream acknowledges Martin Thomson as the original reporter.
");
  script_tag(name: "affected", value: "nss on CentOS 7");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");

  script_xref(name: "CESA", value: "2017:2832");
  script_xref(name: "URL" , value: "http://lists.centos.org/pipermail/centos-announce/2017-September/022550.html");
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

if(release == "CentOS7")
{

  if ((res = isrpmvuln(pkg:"nss", rpm:"nss~3.28.4~12.el7_4", rls:"CentOS7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"nss-devel", rpm:"nss-devel~3.28.4~12.el7_4", rls:"CentOS7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"nss-pkcs11-devel", rpm:"nss-pkcs11-devel~3.28.4~12.el7_4", rls:"CentOS7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"nss-sysinit", rpm:"nss-sysinit~3.28.4~12.el7_4", rls:"CentOS7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"nss-tools", rpm:"nss-tools~3.28.4~12.el7_4", rls:"CentOS7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
