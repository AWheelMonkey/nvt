###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_fedora_2018_d4d7108de8_nmap_fc27.nasl 9276 2018-04-03 07:04:47Z santu $
#
# Fedora Update for nmap FEDORA-2018-d4d7108de8
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
  script_oid("1.3.6.1.4.1.25623.1.0.874301");
  script_version("$Revision: 9276 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-03 09:04:47 +0200 (Tue, 03 Apr 2018) $");
  script_tag(name:"creation_date", value:"2018-03-29 08:48:24 +0200 (Thu, 29 Mar 2018)");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"qod_type", value:"package");
  script_name("Fedora Update for nmap FEDORA-2018-d4d7108de8");
  script_tag(name: "summary", value: "Check the version of nmap");
  script_tag(name: "vuldetect", value: "Get the installed version with the help 
of detect NVT and check if the version is vulnerable or not.");
  script_tag(name: "insight", value: "Nmap is a utility for network 
exploration or security auditing.  It supports ping scanning (determine which 
hosts are up), many port scanning techniques (determine what services the hosts 
are offering), and TCP/IP fingerprinting (remote host operating system identification). 
Nmap also offers flexible target and port specification, decoy scanning, determination 
of TCP sequence predictability characteristics, reverse-identd scanning, and more. 
In addition to the classic command-line nmap executable, the Nmap suite includes a 
flexible data transfer, redirection, and debugging tool (netcat utility ncat), 
a utility for comparing scan results (ndiff), and a packet generation and response
analysis tool (nping).
");
  script_tag(name: "affected", value: "nmap on Fedora 27");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");

  script_xref(name: "FEDORA", value: "2018-d4d7108de8");
  script_xref(name: "URL" , value: "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/ZZY3ZG2VYAO27NNQ5ETQN6ZBLSRO5EC3");
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

  if ((res = isrpmvuln(pkg:"nmap", rpm:"nmap~7.60~8.fc27", rls:"FC27")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
