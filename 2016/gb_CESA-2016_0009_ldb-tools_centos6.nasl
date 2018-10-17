###############################################################################
# OpenVAS Vulnerability Test
#
# CentOS Update for ldb-tools CESA-2016:0009 centos6
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
  script_oid("1.3.6.1.4.1.25623.1.0.882362");
  script_version("$Revision: 6658 $");
  script_tag(name:"last_modification", value:"$Date: 2017-07-10 13:51:48 +0200 (Mon, 10 Jul 2017) $");
  script_tag(name:"creation_date", value:"2016-01-08 06:31:02 +0100 (Fri, 08 Jan 2016)");
  script_cve_id("CVE-2015-3223", "CVE-2015-5330");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:P");
  script_tag(name:"qod_type", value:"package");
  script_name("CentOS Update for ldb-tools CESA-2016:0009 centos6 ");
  script_tag(name: "summary", value: "Check the version of ldb-tools");
  script_tag(name: "vuldetect", value: "Get the installed version with the help
of detect NVT and check if the version is vulnerable or not.");
  script_tag(name: "insight", value: "The libldb packages provide an extensible
library that implements an LDAP-like API to access remote LDAP servers, or use
local TDB databases.

A denial of service flaw was found in the ldb_wildcard_compare() function
of libldb. A remote attacker could send a specially crafted packet that,
when processed by an application using libldb (for example the AD LDAP
server in Samba), would cause that application to consume an excessive
amount of memory and crash. (CVE-2015-3223)

A memory-read flaw was found in the way the libldb library processed LDB DN
records with a null byte. An authenticated, remote attacker could use this
flaw to read heap-memory pages from the server. (CVE-2015-5330)

Red Hat would like to thank the Samba project for reporting these issues.
Upstream acknowledges Thilo Uttendorfer as the original reporter of
CVE-2015-3223, and Douglas Bagnall as the original reporter of
CVE-2015-5330.

All libldb users are advised to upgrade to these updated packages, which
contain backported patches to correct these issues.
");
  script_tag(name: "affected", value: "ldb-tools on CentOS 6");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");

  script_xref(name: "CESA", value: "2016:0009");
  script_xref(name: "URL" , value: "http://lists.centos.org/pipermail/centos-announce/2016-January/021598.html");
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

if(release == "CentOS6")
{

  if ((res = isrpmvuln(pkg:"ldb-tools", rpm:"ldb-tools~1.1.13~3.el6_7.1", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libldb", rpm:"libldb~1.1.13~3.el6_7.1", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libldb-devel", rpm:"libldb-devel~1.1.13~3.el6_7.1", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"pyldb", rpm:"pyldb~1.1.13~3.el6_7.1", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"pyldb-devel", rpm:"pyldb-devel~1.1.13~3.el6_7.1", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
