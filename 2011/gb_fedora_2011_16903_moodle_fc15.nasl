###############################################################################
# OpenVAS Vulnerability Test
#
# Fedora Update for moodle FEDORA-2011-16903
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (c) 2011 Greenbone Networks GmbH, http://www.greenbone.net
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

include("revisions-lib.inc");
tag_affected = "moodle on Fedora 15";
tag_insight = "Moodle is a course management system (CMS) - a free, Open Source software
  package designed using sound pedagogical principles, to help educators create
  effective online learning communities.";
tag_solution = "Please Install the Updated Packages.";


if(description)
{
  script_xref(name : "URL" , value : "http://lists.fedoraproject.org/pipermail/package-announce/2011-December/071193.html");
  script_oid("1.3.6.1.4.1.25623.1.0.863665");
  script_tag(name:"cvss_base", value:"6.8");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
 script_version("$Revision: 9371 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-06 10:55:06 +0200 (Fri, 06 Apr 2018) $");
  script_tag(name:"creation_date", value:"2011-12-23 10:33:19 +0530 (Fri, 23 Dec 2011)");
  script_xref(name: "FEDORA", value: "2011-16903");
  script_cve_id("CVE-2011-4581", "CVE-2011-4582", "CVE-2011-4583", "CVE-2011-4584",
                "CVE-2011-4585", "CVE-2011-4586", "CVE-2011-4587", "CVE-2011-4588",
                "CVE-2011-4589", "CVE-2011-4590", "CVE-2011-4591", "CVE-2011-4592",
                "CVE-2011-4593");
  script_name("Fedora Update for moodle FEDORA-2011-16903");

  script_tag(name:"summary", value:"Check for the Version of moodle");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2011 Greenbone Networks GmbH");
  script_family("Fedora Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/fedora", "ssh/login/rpms");
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");
  exit(0);
}


include("pkg-lib-rpm.inc");

release = get_kb_item("ssh/login/release");


res = "";
if(release == NULL){
  exit(0);
}

if(release == "FC15")
{

  if ((res = isrpmvuln(pkg:"moodle", rpm:"moodle~1.9.15~1.fc15", rls:"FC15")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
