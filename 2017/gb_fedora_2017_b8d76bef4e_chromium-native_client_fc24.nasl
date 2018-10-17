###############################################################################
# OpenVAS Vulnerability Test
#
# Fedora Update for chromium-native_client FEDORA-2017-b8d76bef4e
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
  script_oid("1.3.6.1.4.1.25623.1.0.872852");
  script_version("$Revision: 7859 $");
  script_tag(name:"last_modification", value:"$Date: 2017-11-22 10:05:55 +0100 (Wed, 22 Nov 2017) $");
  script_tag(name:"creation_date", value:"2017-07-14 15:55:05 +0530 (Fri, 14 Jul 2017)");
  script_cve_id("CVE-2017-5070", "CVE-2017-5071", "CVE-2017-5072", "CVE-2017-5073", 
                "CVE-2017-5074", "CVE-2017-5075", "CVE-2017-5086", "CVE-2017-5076", 
                "CVE-2017-5077", "CVE-2017-5078", "CVE-2017-5079", "CVE-2017-5080", 
                "CVE-2017-5081", "CVE-2017-5082", "CVE-2017-5083", "CVE-2017-5085");
  script_tag(name:"cvss_base", value:"6.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
  script_tag(name:"qod_type", value:"package");
  script_name("Fedora Update for chromium-native_client FEDORA-2017-b8d76bef4e");
  script_tag(name: "summary", value: "Check the version of chromium-native_client");
  script_tag(name: "vuldetect", value: "Get the installed version with the help 
of detect NVT and check if the version is vulnerable or not.");
  script_tag(name: "insight", value: "Google&#39 s 'pnacl' toolchain for native 
client support in Chromium. Depends on their older 'nacl' toolchain, packaged separately.
");
  script_tag(name: "affected", value: "chromium-native_client on Fedora 24");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");

  script_xref(name: "FEDORA", value: "2017-b8d76bef4e");
  script_xref(name: "URL" , value: "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/QIQ7LK3MTM2B7PGJ2PTHAZ3JLP43BJQF");
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

if(release == "FC24")
{

  if ((res = isrpmvuln(pkg:"chromium-native_client", rpm:"chromium-native_client~59.0.3071.86~1.20170607gitaac1de2.fc24", rls:"FC24")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
