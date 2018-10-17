###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_fedora_2017_6c52e2d731_GraphicsMagick_fc25.nasl 6812 2017-07-31 06:15:43Z cfischer $
#
# Fedora Update for GraphicsMagick FEDORA-2017-6c52e2d731
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
  script_oid("1.3.6.1.4.1.25623.1.0.872915");
  script_version("$Revision: 6812 $");
  script_tag(name:"last_modification", value:"$Date: 2017-07-31 08:15:43 +0200 (Mon, 31 Jul 2017) $");
  script_tag(name:"creation_date", value:"2017-07-25 07:40:13 +0200 (Tue, 25 Jul 2017)");
  script_cve_id("CVE-2017-11403");
  script_tag(name:"cvss_base", value:"6.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
  script_tag(name:"qod_type", value:"package");
  script_name("Fedora Update for GraphicsMagick FEDORA-2017-6c52e2d731");
  script_tag(name: "summary", value: "Check the version of GraphicsMagick");
  script_tag(name: "vuldetect", value: "Get the installed version with the help 
of detect NVT and check if the version is vulnerable or not.");
  script_tag(name: "insight", value: "GraphicsMagick is a comprehensive image 
processing package which is initially based on ImageMagick 5.5.2, but which 
has undergone significant re-work by the GraphicsMagick Group to significantly 
improve the quality and performance of the software.
");
  script_tag(name: "affected", value: "GraphicsMagick on Fedora 25");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");

  script_xref(name: "FEDORA", value: "2017-6c52e2d731");
  script_xref(name: "URL" , value: "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/LK2ZHAMQZDPSPMIU2HF6WTTQYJJT2GML");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
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

if(release == "FC25")
{

  if ((res = isrpmvuln(pkg:"GraphicsMagick", rpm:"GraphicsMagick~1.3.26~3.fc25", rls:"FC25")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
