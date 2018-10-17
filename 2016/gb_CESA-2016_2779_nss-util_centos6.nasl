###############################################################################
# OpenVAS Vulnerability Test
#
# CentOS Update for nss-util CESA-2016:2779 centos6 
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
  script_oid("1.3.6.1.4.1.25623.1.0.882593");
  script_version("$Revision: 8029 $");
  script_tag(name:"last_modification", value:"$Date: 2017-12-07 13:38:42 +0100 (Thu, 07 Dec 2017) $");
  script_tag(name:"creation_date", value:"2016-11-20 05:37:08 +0100 (Sun, 20 Nov 2016)");
  script_cve_id("CVE-2016-2834", "CVE-2016-5285", "CVE-2016-8635");
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_tag(name:"qod_type", value:"package");
  script_name("CentOS Update for nss-util CESA-2016:2779 centos6 ");
  script_tag(name: "vuldetect", value: "Get the installed version with the help 
of detect NVT and check if the version is vulnerable or not.");
  script_tag(name: "insight", value: "Network Security Services (NSS) is a set of 
libraries designed to support the cross-platform development of security-enabled 
client and server applications.

The nss-util packages provide utilities for use with the Network Security
Services (NSS) libraries.

The following packages have been upgraded to a newer upstream version: nss
(3.12.3), nss-util (3.12.3).

Security Fix(es):

* Multiple buffer handling flaws were found in the way NSS handled
cryptographic data from the network. A remote attacker could use these
flaws to crash an application using NSS or, possibly, execute arbitrary
code with the permission of the user running the application.
(CVE-2016-2834)

* A NULL pointer dereference flaw was found in the way NSS handled invalid
Diffie-Hellman keys. A remote client could use this flaw to crash a TLS/SSL
server using NSS. (CVE-2016-5285)

* It was found that Diffie Hellman Client key exchange handling in NSS was
vulnerable to small subgroup confinement attack. An attacker could use this
flaw to recover private keys by confining the client DH key to small
subgroup of the desired group. (CVE-2016-8635)

Red Hat would like to thank the Mozilla project for reporting
CVE-2016-2834. The CVE-2016-8635 issue was discovered by Hubert Kario (Red
Hat). Upstream acknowledges Tyson Smith and Jed Davis as the original
reporter of CVE-2016-2834.
");
  script_tag(name: "affected", value: "nss-util on CentOS 6");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");

  script_xref(name: "CESA", value: "2016:2779");
  script_xref(name: "URL" , value: "http://lists.centos.org/pipermail/centos-announce/2016-November/022151.html");
  script_tag(name: "summary" , value: "Check for the Version of nss-util");
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

  if ((res = isrpmvuln(pkg:"nss-util", rpm:"nss-util~3.21.3~1.el6_8", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"nss-util-devel", rpm:"nss-util-devel~3.21.3~1.el6_8", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
