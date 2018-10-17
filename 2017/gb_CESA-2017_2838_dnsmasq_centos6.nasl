###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_CESA-2017_2838_dnsmasq_centos6.nasl 7466 2017-10-18 05:09:06Z teissa $
#
# CentOS Update for dnsmasq CESA-2017:2838 centos6 
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
  script_oid("1.3.6.1.4.1.25623.1.0.882781");
  script_version("$Revision: 7466 $");
  script_tag(name:"last_modification", value:"$Date: 2017-10-18 07:09:06 +0200 (Wed, 18 Oct 2017) $");
  script_tag(name:"creation_date", value:"2017-10-05 11:55:23 +0530 (Thu, 05 Oct 2017)");
  script_cve_id("CVE-2017-14491");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_tag(name:"qod_type", value:"package");
  script_name("CentOS Update for dnsmasq CESA-2017:2838 centos6 ");
  script_tag(name: "summary", value: "Check the version of dnsmasq");
  script_tag(name: "vuldetect", value: "Get the installed version with the help 
of detect NVT and check if the version is vulnerable or not.");
  script_tag(name: "insight", value: "The dnsmasq packages contain Dnsmasq, 
a lightweight DNS (Domain Name Server) forwarder and DHCP  (Dynamic Host Configuration Protocol) 
server.

Security Fix(es):

* A heap buffer overflow was found in dnsmasq in the code responsible for
building DNS replies. An attacker could send crafted DNS packets to dnsmasq
which would cause it to crash or, potentially, execute arbitrary code.
(CVE-2017-14491)

Red Hat would like to thank Felix Wilhelm (Google Security Team), Fermin J.
Serna (Google Security Team), Gabriel Campana (Google Security Team), Kevin
Hamacher (Google Security Team), and Ron Bowes (Google Security Team) for
reporting this issue.
");
  script_tag(name: "affected", value: "dnsmasq on CentOS 6");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");

  script_xref(name: "CESA", value: "2017:2838");
  script_xref(name: "URL" , value: "http://lists.centos.org/pipermail/centos-announce/2017-October/022554.html");
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

  if ((res = isrpmvuln(pkg:"dnsmasq", rpm:"dnsmasq~2.48~18.el6_9", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"dnsmasq-utils", rpm:"dnsmasq-utils~2.48~18.el6_9", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
