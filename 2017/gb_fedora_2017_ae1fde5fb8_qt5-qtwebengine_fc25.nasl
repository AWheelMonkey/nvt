###############################################################################
# OpenVAS Vulnerability Test
#
# Fedora Update for qt5-qtwebengine FEDORA-2017-ae1fde5fb8
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
  script_oid("1.3.6.1.4.1.25623.1.0.872576");
  script_version("$Revision: 13177 $");
  script_tag(name:"last_modification", value:"$Date: 2019-01-21 08:53:27 +0100 (Mon, 21 Jan 2019) $");
  script_tag(name:"creation_date", value:"2017-04-18 06:41:53 +0200 (Tue, 18 Apr 2017)");
  script_cve_id("CVE-2016-5182", "CVE-2016-5183", "CVE-2016-5189", "CVE-2016-5199", 
                "CVE-2016-5201", "CVE-2016-5203", "CVE-2016-5204", "CVE-2016-5205", 
                "CVE-2016-5206", "CVE-2016-5208", "CVE-2016-5207", "CVE-2016-5210", 
                "CVE-2016-5211", "CVE-2016-5212", "CVE-2016-5213", "CVE-2016-5214", 
                "CVE-2016-5215", "CVE-2016-5216", "CVE-2016-5217", "CVE-2016-5218", 
                "CVE-2016-5219", "CVE-2016-5221", "CVE-2016-5222", "CVE-2016-5223", 
                "CVE-2016-5224", "CVE-2016-5225", "CVE-2016-9650", "CVE-2016-9651");
  script_tag(name:"cvss_base", value:"6.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
  script_tag(name:"qod_type", value:"package");
  script_name("Fedora Update for qt5-qtwebengine FEDORA-2017-ae1fde5fb8");
  script_tag(name: "summary", value: "Check the version of qt5-qtwebengine");
  script_tag(name: "vuldetect", value: "Get the installed version with the help 
of detect NVT and check if the version is vulnerable or not.");
  script_tag(name: "insight", value: "Qt5 - QtWebEngine components.
");
  script_tag(name: "affected", value: "qt5-qtwebengine on Fedora 25");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");

  script_xref(name: "FEDORA", value: "2017-ae1fde5fb8");
  script_xref(name: "URL" , value: "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/OMW5DLNYQFXDPKYD4LA66HQALQTPX54B");
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

  if ((res = isrpmvuln(pkg:"qt5-qtwebengine", rpm:"qt5-qtwebengine~5.8.0~8.fc25", rls:"FC25")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
