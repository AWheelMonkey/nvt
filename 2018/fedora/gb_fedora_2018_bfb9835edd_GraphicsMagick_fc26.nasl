###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_fedora_2018_bfb9835edd_GraphicsMagick_fc26.nasl 8646 2018-02-02 16:20:32Z cfischer $
#
# Fedora Update for GraphicsMagick FEDORA-2018-bfb9835edd
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
  script_oid("1.3.6.1.4.1.25623.1.0.874085");
  script_version("$Revision: 8646 $");
  script_tag(name:"last_modification", value:"$Date: 2018-02-02 17:20:32 +0100 (Fri, 02 Feb 2018) $");
  script_tag(name:"creation_date", value:"2018-02-01 07:57:22 +0100 (Thu, 01 Feb 2018)");
  script_cve_id("CVE-2017-17912", "CVE-2017-17913", "CVE-2017-17915", "CVE-2017-17783", 
                "CVE-2017-17782", "CVE-2017-16353", "CVE-2017-16669", "CVE-2017-13147", 
                "CVE-2017-11643", "CVE-2017-11641", "CVE-2017-11636", "CVE-2017-11637", 
                "CVE-2017-11140", "CVE-2017-11139", "CVE-2017-11102");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_tag(name:"qod_type", value:"package");
  script_name("Fedora Update for GraphicsMagick FEDORA-2018-bfb9835edd");
  script_tag(name: "summary", value: "Check the version of GraphicsMagick");
  script_tag(name: "vuldetect", value: "Get the installed version with the help 
of detect NVT and check if the version is vulnerable or not.");
  script_tag(name: "insight", value: "GraphicsMagick is a comprehensive image 
processing package which is initially based on ImageMagick 5.5.2, but which has 
undergone significant re-work by the GraphicsMagick Group to significantly 
improve the quality and performance of the software.
");
  script_tag(name: "affected", value: "GraphicsMagick on Fedora 26");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");

  script_xref(name: "FEDORA", value: "2018-bfb9835edd");
  script_xref(name: "URL" , value: "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/ISKX4WLRTYSRACWKG6AHO35A6HAVWHBB");
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

if(release == "FC26")
{

  if ((res = isrpmvuln(pkg:"GraphicsMagick", rpm:"GraphicsMagick~1.3.28~1.fc26", rls:"FC26")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
