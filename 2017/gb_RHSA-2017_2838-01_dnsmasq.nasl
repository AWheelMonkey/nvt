###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_RHSA-2017_2838-01_dnsmasq.nasl 12380 2018-11-16 11:03:48Z cfischer $
#
# RedHat Update for dnsmasq RHSA-2017:2838-01
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
  script_oid("1.3.6.1.4.1.25623.1.0.812007");
  script_version("$Revision: 12380 $");
  script_tag(name:"last_modification", value:"$Date: 2018-11-16 12:03:48 +0100 (Fri, 16 Nov 2018) $");
  script_tag(name:"creation_date", value:"2017-10-05 11:55:09 +0530 (Thu, 05 Oct 2017)");
  script_cve_id("CVE-2017-14491");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_tag(name:"qod_type", value:"package");
  script_name("RedHat Update for dnsmasq RHSA-2017:2838-01");
  script_tag(name:"summary", value:"The remote host is missing an update for the 'dnsmasq'
  package(s) announced via the referenced advisory.");
  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");
  script_tag(name:"insight", value:"The dnsmasq packages contain Dnsmasq, a
lightweight DNS (Domain Name Server) forwarder and DHCP (Dynamic Host
Configuration Protocol) server.

Security Fix(es):

  * A heap buffer overflow was found in dnsmasq in the code responsible for
building DNS replies. An attacker could send crafted DNS packets to dnsmasq
which would cause it to crash or, potentially, execute arbitrary code.
(CVE-2017-14491)

Red Hat would like to thank Felix Wilhelm (Google Security Team), Fermin J.
Serna (Google Security Team), Gabriel Campana (Google Security Team), Kevin
Hamacher (Google Security Team), and Ron Bowes (Google Security Team) for
reporting this issue.");
  script_tag(name:"affected", value:"dnsmasq on
  Red Hat Enterprise Linux Desktop (v. 6),
  Red Hat Enterprise Linux Server (v. 6),
  Red Hat Enterprise Linux Workstation (v. 6)");
  script_tag(name:"solution", value:"Please Install the Updated Packages.");

  script_xref(name:"RHSA", value:"2017:2838-01");
  script_xref(name:"URL" , value:"https://www.redhat.com/archives/rhsa-announce/2017-October/msg00003.html");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("Red Hat Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/rhel", "ssh/login/rpms", re:"ssh/login/release=RHENT_6");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-rpm.inc");

release = rpm_get_ssh_release();
if(!release) exit(0);

res = "";

if(release == "RHENT_6")
{

  if ((res = isrpmvuln(pkg:"dnsmasq", rpm:"dnsmasq~2.48~18.el6_9", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"dnsmasq-debuginfo", rpm:"dnsmasq-debuginfo~2.48~18.el6_9", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
