###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_CESA-2018_0101_bind_centos6.nasl 8519 2018-01-24 14:13:44Z gveerendra $
#
# CentOS Update for bind CESA-2018:0101 centos6 
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (C) 2018 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.882832");
  script_version("$Revision: 8519 $");
  script_tag(name:"last_modification", value:"$Date: 2018-01-24 15:13:44 +0100 (Wed, 24 Jan 2018) $");
  script_tag(name:"creation_date", value:"2018-01-23 07:37:35 +0100 (Tue, 23 Jan 2018)");
  script_cve_id("CVE-2017-3145");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"qod_type", value:"package");
  script_name("CentOS Update for bind CESA-2018:0101 centos6 ");
  script_tag(name: "summary", value: "Check the version of bind");
  script_tag(name: "vuldetect", value: "Get the installed version with the help 
of detect NVT and check if the version is vulnerable or not.");
  script_tag(name: "insight", value: "The Berkeley Internet Name Domain (BIND) 
is an implementation of the Domain Name System (DNS) protocols. BIND includes 
a DNS server (named)  a resolver library (routines for applications to use when 
interfacing with DNS)  and tools for verifying that the DNS server is operating 
correctly.

Security Fix(es):

* A use-after-free flaw leading to denial of service was found in the way
BIND internally handled cleanup operations on upstream recursion fetch
contexts. A remote attacker could potentially use this flaw to make named,
acting as a DNSSEC validating resolver, exit unexpectedly with an assertion
failure via a specially crafted DNS request. (CVE-2017-3145)

Red Hat would like to thank ISC for reporting this issue. Upstream
acknowledges Jayachandran Palanisamy (Cygate AB) as the original reporter.
");
  script_tag(name: "affected", value: "bind on CentOS 6");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");

  script_xref(name: "CESA", value: "2018:0101");
  script_xref(name: "URL" , value: "http://lists.centos.org/pipermail/centos-announce/2018-January/022714.html");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
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

  if ((res = isrpmvuln(pkg:"bind", rpm:"bind~9.8.2~0.62.rc1.el6_9.5", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"bind-chroot", rpm:"bind-chroot~9.8.2~0.62.rc1.el6_9.5", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"bind-devel", rpm:"bind-devel~9.8.2~0.62.rc1.el6_9.5", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"bind-libs", rpm:"bind-libs~9.8.2~0.62.rc1.el6_9.5", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"bind-sdb", rpm:"bind-sdb~9.8.2~0.62.rc1.el6_9.5", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"bind-utils", rpm:"bind-utils~9.8.2~0.62.rc1.el6_9.5", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
