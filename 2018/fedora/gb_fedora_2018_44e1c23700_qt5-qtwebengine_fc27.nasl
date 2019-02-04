###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_fedora_2018_44e1c23700_qt5-qtwebengine_fc27.nasl 12938 2019-01-04 07:18:11Z asteins $
#
# Fedora Update for qt5-qtwebengine FEDORA-2018-44e1c23700
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
  script_oid("1.3.6.1.4.1.25623.1.0.874280");
  script_version("$Revision: 12938 $");
  script_tag(name:"last_modification", value:"$Date: 2019-01-04 08:18:11 +0100 (Fri, 04 Jan 2019) $");
  script_tag(name:"creation_date", value:"2018-03-26 08:33:29 +0200 (Mon, 26 Mar 2018)");
  script_cve_id("CVE-2017-15429", "CVE-2018-6033", "CVE-2018-6060", "CVE-2018-6062", 
                "CVE-2018-6064", "CVE-2018-6069", "CVE-2018-6071", "CVE-2018-6073", 
                "CVE-2018-6076", "CVE-2018-6079", "CVE-2018-6081", "CVE-2018-6082");
  script_tag(name:"cvss_base", value:"6.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
  script_tag(name:"qod_type", value:"package");
  script_name("Fedora Update for qt5-qtwebengine FEDORA-2018-44e1c23700");
  script_tag(name: "summary", value: "Check the version of qt5-qtwebengine");
  script_tag(name: "vuldetect", value: "Get the installed version with the help 
of detect NVT and check if the version is vulnerable or not.");
  script_tag(name: "insight", value: "Qt5 - QtWebEngine components.
");
  script_tag(name: "affected", value: "qt5-qtwebengine on Fedora 27");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");

  script_xref(name: "FEDORA", value: "2018-44e1c23700");
  script_xref(name: "URL" , value: "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/UH23YUKLEZNXH6IZWIPR24T3Q6OJLPSD");
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

  if ((res = isrpmvuln(pkg:"qt5-qtwebengine", rpm:"qt5-qtwebengine~5.10.1~4.fc27", rls:"FC27")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
