###############################################################################
# OpenVAS Vulnerability Test
#
# CentOS Update for nss CESA-2014:1073 centos7
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
  script_oid("1.3.6.1.4.1.25623.1.0.882018");
  script_version("$Revision: 9373 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-06 10:57:18 +0200 (Fri, 06 Apr 2018) $");
  script_tag(name:"creation_date", value:"2014-09-10 06:20:42 +0200 (Wed, 10 Sep 2014)");
  script_cve_id("CVE-2014-1492");
  script_tag(name:"cvss_base", value:"4.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:P/A:N");
  script_name("CentOS Update for nss CESA-2014:1073 centos7 ");
  script_tag(name: "insight", value: "Network Security Services (NSS) is a set
of libraries designed to support the cross-platform development of
security-enabled client and server applications. Applications built with NSS can
support SSLv3, TLS, and other security standards.

It was found that the implementation of Internationalizing Domain Names in
Applications (IDNA) hostname matching in NSS did not follow the RFC 6125
recommendations. This could lead to certain invalid certificates with
international characters to be accepted as valid. (CVE-2014-1492)

In addition, the nss, nss-util, and nss-softokn packages have been upgraded
to upstream version 3.16.2, which provides a number of bug fixes and
enhancements over the previous versions. (BZ#1124659)

Users of NSS are advised to upgrade to these updated packages, which
correct these issues and add these enhancements. After installing this
update, applications using NSS must be restarted for this update to
take effect.
");
  script_tag(name: "affected", value: "nss on CentOS 7");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");
  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");

  script_xref(name: "CESA", value: "2014:1073");
  script_xref(name: "URL" , value: "http://lists.centos.org/pipermail/centos-announce/2014-August/020499.html");
  script_tag(name:"summary", value:"Check for the Version of nss");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2014 Greenbone Networks GmbH");
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

  if ((res = isrpmvuln(pkg:"nss", rpm:"nss~3.16.2~2.el7_0", rls:"CentOS7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"nss-devel", rpm:"nss-devel~3.16.2~2.el7_0", rls:"CentOS7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"nss-pkcs11-devel", rpm:"nss-pkcs11-devel~3.16.2~2.el7_0", rls:"CentOS7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"nss-sysinit", rpm:"nss-sysinit~3.16.2~2.el7_0", rls:"CentOS7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"nss-tools", rpm:"nss-tools~3.16.2~2.el7_0", rls:"CentOS7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
