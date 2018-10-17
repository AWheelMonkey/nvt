###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_fedora_2018_4978426286_electrum_fc27.nasl 8396 2018-01-12 11:39:41Z gveerendra $
#
# Fedora Update for electrum FEDORA-2018-4978426286
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
  script_oid("1.3.6.1.4.1.25623.1.0.873982");
  script_version("$Revision: 8396 $");
  script_tag(name:"last_modification", value:"$Date: 2018-01-12 12:39:41 +0100 (Fri, 12 Jan 2018) $");
  script_tag(name:"creation_date", value:"2018-01-09 10:12:09 +0100 (Tue, 09 Jan 2018)");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"qod_type", value:"package");
  script_name("Fedora Update for electrum FEDORA-2018-4978426286");
  script_tag(name: "summary", value: "Check the version of electrum");
  script_tag(name: "vuldetect", value: "Get the installed version with the help 
of detect NVT and check if the version is vulnerable or not.");
  script_tag(name: "insight", value: "Electrum is an easy to use Bitcoin client. 
It protects you from losing coins in a backup mistake or computer failure, 
because your wallet can be recovered from a secret phrase that you can write 
on paper or learn by heart. There is no waiting time when you start the client, 
because it does not download the Bitcoin block chain.
");
  script_tag(name: "affected", value: "electrum on Fedora 27");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");

  script_xref(name: "FEDORA", value: "2018-4978426286");
  script_xref(name: "URL" , value: "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/6Q5MKEDCTWILIGSDJCVCI46HEQFOBD6L");
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

  if ((res = isrpmvuln(pkg:"electrum", rpm:"electrum~3.0.5~1.fc27", rls:"FC27")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
