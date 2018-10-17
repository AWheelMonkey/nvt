###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_fedora_2018_d1e263e68e_transmission_fc27.nasl 8811 2018-02-14 12:41:44Z cfischer $
#
# Fedora Update for transmission FEDORA-2018-d1e263e68e
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
  script_oid("1.3.6.1.4.1.25623.1.0.874030");
  script_version("$Revision: 8811 $");
  script_tag(name:"last_modification", value:"$Date: 2018-02-14 13:41:44 +0100 (Wed, 14 Feb 2018) $");
  script_tag(name:"creation_date", value:"2018-01-18 07:38:22 +0100 (Thu, 18 Jan 2018)");
  script_cve_id("CVE-2018-5702");
  script_tag(name:"cvss_base", value:"6.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
  script_tag(name:"qod_type", value:"package");
  script_name("Fedora Update for transmission FEDORA-2018-d1e263e68e");
  script_tag(name: "summary", value: "Check the version of transmission");
  script_tag(name: "vuldetect", value: "Get the installed version with the help 
of detect NVT and check if the version is vulnerable or not.");
  script_tag(name: "insight", value: "Transmission is a free, lightweight 
BitTorrent client. It features a simple, intuitive interface on top on an 
efficient, cross-platform back-end.
");
  script_tag(name: "affected", value: "transmission on Fedora 27");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");

  script_xref(name: "FEDORA", value: "2018-d1e263e68e");
  script_xref(name: "URL" , value: "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/7E4DGDKW672SG6QYQ7KN4HOPXJIR52K7");
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

  if ((res = isrpmvuln(pkg:"transmission", rpm:"transmission~2.92~11.fc27", rls:"FC27")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
