###############################################################################
# OpenVAS Vulnerability Test
#
# Fedora Update for chromium FEDORA-2016-2e50862950
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
  script_oid("1.3.6.1.4.1.25623.1.0.809909");
  script_version("$Revision: 6631 $");
  script_tag(name:"last_modification", value:"$Date: 2017-07-10 08:36:10 +0200 (Mon, 10 Jul 2017) $");
  script_tag(name:"creation_date", value:"2016-11-14 18:00:25 +0530 (Mon, 14 Nov 2016)");
  script_cve_id("CVE-2016-5177", "CVE-2016-5178", "CVE-2016-5170", "CVE-2016-5171",
                "CVE-2016-5172", "CVE-2016-5173", "CVE-2016-5174", "CVE-2016-5175",
                "CVE-2016-5147", "CVE-2016-5148", "CVE-2016-5149", "CVE-2016-5150",
                "CVE-2016-5151", "CVE-2016-5152", "CVE-2016-5153", "CVE-2016-5154",
                "CVE-2016-5155", "CVE-2016-5156", "CVE-2016-5157", "CVE-2016-5158",
                "CVE-2016-5159", "CVE-2016-5161", "CVE-2016-5162", "CVE-2016-5163",
                "CVE-2016-5164", "CVE-2016-5165", "CVE-2016-5166", "CVE-2016-5160",
                "CVE-2016-5167");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_tag(name:"qod_type", value:"package");
  script_name("Fedora Update for chromium FEDORA-2016-2e50862950");
  script_tag(name: "summary", value: "Check the version of chromium");

  script_tag(name: "vuldetect", value: "Get the installed version with the help
  of detect NVT and check if the version is vulnerable or not.");

  script_tag(name: "insight", value: "Chromium is an open-source web browser,
  powered by WebKit (Blink).");

  script_tag(name: "affected", value: "chromium on Fedora 23");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");

  script_xref(name: "FEDORA", value: "2016-2e50862950");
  script_xref(name: "URL" , value: "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/YPYK6KQMI3FVJGNDPMFT43OJ2UIC35YO");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
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

if(release == "FC23")
{

  if ((res = isrpmvuln(pkg:"chromium", rpm:"chromium~53.0.2785.143~1.fc23", rls:"FC23")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
