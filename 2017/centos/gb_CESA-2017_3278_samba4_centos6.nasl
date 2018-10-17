###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_CESA-2017_3278_samba4_centos6.nasl 8247 2017-12-26 13:32:16Z cfischer $
#
# CentOS Update for samba4 CESA-2017:3278 centos6 
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
  script_oid("1.3.6.1.4.1.25623.1.0.882815");
  script_version("$Revision: 8247 $");
  script_tag(name:"last_modification", value:"$Date: 2017-12-26 14:32:16 +0100 (Tue, 26 Dec 2017) $");
  script_tag(name:"creation_date", value:"2017-12-07 07:39:40 +0100 (Thu, 07 Dec 2017)");
  script_cve_id("CVE-2017-14746", "CVE-2017-15275");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_tag(name:"qod_type", value:"package");
  script_name("CentOS Update for samba4 CESA-2017:3278 centos6 ");
  script_tag(name: "summary", value: "Check the version of samba4");
  script_tag(name: "vuldetect", value: "Get the installed version with the help 
of detect NVT and check if the version is vulnerable or not.");
  script_tag(name: "insight", value: "Samba is an open-source implementation 
of the Server Message Block (SMB) or Common Internet File System (CIFS) protocol, 
which allows PC-compatible machines to share files, printers, and other 
information.

Security Fix(es):

* A use-after-free flaw was found in the way samba servers handled certain
SMB1 requests. An unauthenticated attacker could send specially-crafted
SMB1 requests to cause the server to crash or execute arbitrary code.
(CVE-2017-14746)

* A memory disclosure flaw was found in samba. An attacker could retrieve
parts of server memory, which could contain potentially sensitive data, by
sending specially-crafted requests to the samba server. (CVE-2017-15275)

Red Hat would like to thank the Samba project for reporting these issues.
Upstream acknowledges Yihan Lian and Zhibin Hu (Qihoo 360 GearTeam) as the
original reporter of CVE-2017-14746  and Volker Lendecke (SerNet and the
Samba Team) as the original reporter of CVE-2017-15275.
");
  script_tag(name: "affected", value: "samba4 on CentOS 6");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");

  script_xref(name: "CESA", value: "2017:3278");
  script_xref(name: "URL" , value: "http://lists.centos.org/pipermail/centos-announce/2017-November/022648.html");
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

  if ((res = isrpmvuln(pkg:"samba4", rpm:"samba4~4.2.10~12.el6_9", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"samba4-client", rpm:"samba4-client~4.2.10~12.el6_9", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"samba4-common", rpm:"samba4-common~4.2.10~12.el6_9", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"samba4-dc", rpm:"samba4-dc~4.2.10~12.el6_9", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"samba4-dc-libs", rpm:"samba4-dc-libs~4.2.10~12.el6_9", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"samba4-devel", rpm:"samba4-devel~4.2.10~12.el6_9", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"samba4-libs", rpm:"samba4-libs~4.2.10~12.el6_9", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"samba4-pidl", rpm:"samba4-pidl~4.2.10~12.el6_9", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"samba4-python", rpm:"samba4-python~4.2.10~12.el6_9", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"samba4-test", rpm:"samba4-test~4.2.10~12.el6_9", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"samba4-winbind", rpm:"samba4-winbind~4.2.10~12.el6_9", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"samba4-winbind-clients", rpm:"samba4-winbind-clients~4.2.10~12.el6_9", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"samba4-winbind-krb5-locator", rpm:"samba4-winbind-krb5-locator~4.2.10~12.el6_9", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
