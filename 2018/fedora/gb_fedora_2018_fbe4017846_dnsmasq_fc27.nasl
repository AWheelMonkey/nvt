###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_fedora_2018_fbe4017846_dnsmasq_fc27.nasl 8849 2018-02-16 14:02:28Z asteins $
#
# Fedora Update for dnsmasq FEDORA-2018-fbe4017846
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
  script_oid("1.3.6.1.4.1.25623.1.0.874078");
  script_version("$Revision: 8849 $");
  script_tag(name:"last_modification", value:"$Date: 2018-02-16 15:02:28 +0100 (Fri, 16 Feb 2018) $");
  script_tag(name:"creation_date", value:"2018-01-31 07:59:02 +0100 (Wed, 31 Jan 2018)");
  script_cve_id("CVE-2017-15107");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:P/A:N");
  script_tag(name:"qod_type", value:"package");
  script_name("Fedora Update for dnsmasq FEDORA-2018-fbe4017846");
  script_tag(name: "summary", value: "Check the version of dnsmasq");
  script_tag(name: "vuldetect", value: "Get the installed version with the help 
of detect NVT and check if the version is vulnerable or not.");
  script_tag(name: "insight", value: "Dnsmasq is lightweight, easy to configure 
DNS forwarder and DHCP server. It is designed to provide DNS and, optionally, 
DHCP, to a small network. It can serve the names of local machines which are 
not in the global DNS. The DHCP server integrates with the DNS server and allows 
machines with DHCP-allocated addresses to appear in the DNS with names configured
either in each host or in a central configuration file. Dnsmasq supports static 
and dynamic DHCP leases and BOOTP for network booting of diskless machines.
");
  script_tag(name: "affected", value: "dnsmasq on Fedora 27");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");

  script_xref(name: "FEDORA", value: "2018-fbe4017846");
  script_xref(name: "URL" , value: "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/UQBQNMDMDJKU5GDXPKGPK5EWI5VQWYC6");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
  script_family("Fedora Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/fedora", "ssh/login/rpms");
  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-rpm.inc");

release = get_kb_item("ssh/login/release");

res = "";
if(release == NULL){
  exit(0);
}

if(release == "FC27")
{

  if ((res = isrpmvuln(pkg:"dnsmasq", rpm:"dnsmasq~2.78~2.fc27", rls:"FC27")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
