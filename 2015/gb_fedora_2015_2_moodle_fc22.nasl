###############################################################################
# OpenVAS Vulnerability Test
#
# Fedora Update for moodle FEDORA-2015-2
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (C) 2015 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.806906");
  script_version("$Revision: 6632 $");
  script_tag(name:"last_modification", value:"$Date: 2017-07-10 08:48:18 +0200 (Mon, 10 Jul 2017) $");
  script_tag(name:"creation_date", value:"2015-12-12 05:41:41 +0100 (Sat, 12 Dec 2015)");
  script_cve_id("CVE-2015-5331", "CVE-2015-5332", "CVE-2015-5335", "CVE-2015-5336",
                "CVE-2015-5337", "CVE-2015-5338", "CVE-2015-5339", "CVE-2015-5340",
                "CVE-2015-5341", "CVE-2015-5342", "CVE-2015-5264", "CVE-2015-5265",
                "CVE-2015-5266", "CVE-2015-5267", "CVE-2015-5272", "CVE-2015-5268",
                "CVE-2015-5269");
  script_tag(name:"cvss_base", value:"7.1");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:N/A:C");
  script_tag(name:"qod_type", value:"package");
  script_name("Fedora Update for moodle FEDORA-2015-2");
  script_tag(name: "summary", value: "Check the version of moodle");

  script_tag(name: "vuldetect", value: "Get the installed version with the help
  of detect NVT and check if the version is vulnerable or not.");

  script_tag(name: "insight", value: "Moodle is a course management system (CMS)
  - a free, Open Source software package designed using sound pedagogical principles,
  to help educators create effective online learning communities.");

  script_tag(name: "affected", value: "moodle on Fedora 22");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");
  script_xref(name: "FEDORA", value: "2015-2");
  script_xref(name: "URL" , value: "https://lists.fedoraproject.org/pipermail/package-announce/2015-December/173666.html");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2015 Greenbone Networks GmbH");
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

if(release == "FC22")
{

  if ((res = isrpmvuln(pkg:"moodle", rpm:"moodle~2.8.9~1.fc22", rls:"FC22")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
