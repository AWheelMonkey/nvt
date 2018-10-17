###############################################################################
# OpenVAS Vulnerability Test
#
# Fedora Update for chromium FEDORA-2016-e0e1cb2b2b
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
  script_oid("1.3.6.1.4.1.25623.1.0.872153");
  script_version("$Revision: 6631 $");
  script_tag(name:"last_modification", value:"$Date: 2017-07-10 08:36:10 +0200 (Mon, 10 Jul 2017) $");
  script_tag(name:"creation_date", value:"2016-12-16 06:04:03 +0100 (Fri, 16 Dec 2016)");
  script_cve_id("CVE-2016-5199", "CVE-2016-5200", "CVE-2016-5201", "CVE-2016-5202",
                "CVE-2016-9651", "CVE-2016-5208", "CVE-2016-5207", "CVE-2016-5206",
                "CVE-2016-5205", "CVE-2016-5204", "CVE-2016-5209", "CVE-2016-5203",
                "CVE-2016-5210", "CVE-2016-5212", "CVE-2016-5211", "CVE-2016-5213",
                "CVE-2016-5214", "CVE-2016-5216", "CVE-2016-5215", "CVE-2016-5217",
                "CVE-2016-5218", "CVE-2016-5219", "CVE-2016-5221", "CVE-2016-5220",
                "CVE-2016-5222", "CVE-2016-9650", "CVE-2016-5223", "CVE-2016-5226",
                "CVE-2016-5225", "CVE-2016-5224", "CVE-2016-9652");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"qod_type", value:"package");
  script_name("Fedora Update for chromium FEDORA-2016-e0e1cb2b2b");
  script_tag(name: "summary", value: "Check the version of chromium");

  script_tag(name: "vuldetect", value: "Get the installed version with the help
  of detect NVT and check if the version is vulnerable or not.");

  script_tag(name: "insight", value: "Chromium is an open-source web browser,
  powered by WebKit (Blink).");

  script_tag(name: "affected", value: "chromium on Fedora 24");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");

  script_xref(name: "FEDORA", value: "2016-e0e1cb2b2b");
  script_xref(name: "URL" , value: "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/ZZECS3A7ULG4B4YXBKUZMA3NTQBE5HGU");
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

if(release == "FC24")
{

  if ((res = isrpmvuln(pkg:"chromium", rpm:"chromium~55.0.2883.87~1.fc24", rls:"FC24")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
