###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_fedora_2018_43ff5f6e5b_moodle_fc27.nasl 12697 2018-12-07 07:56:28Z mmartin $
#
# Fedora Update for moodle FEDORA-2018-43ff5f6e5b
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
  script_oid("1.3.6.1.4.1.25623.1.0.875105");
  script_version("$Revision: 12697 $");
  script_tag(name:"last_modification", value:"$Date: 2018-12-07 08:56:28 +0100 (Fri, 07 Dec 2018) $");
  script_tag(name:"creation_date", value:"2018-09-28 13:34:06 +0200 (Fri, 28 Sep 2018)");
  script_cve_id("CVE-2018-14630");
  script_tag(name:"cvss_base", value:"6.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:S/C:P/I:P/A:P");
  script_tag(name:"qod_type", value:"package");
  script_name("Fedora Update for moodle FEDORA-2018-43ff5f6e5b");
  script_tag(name:"summary", value:"Check the version of moodle");
  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present
  on the target host.");
  script_tag(name:"insight", value:"Moodle is a course management system (CMS)
  - a free, Open Source software package designed using sound pedagogical
  principles, to help educators create effective online learning communities.
");
  script_tag(name:"affected", value:"moodle on Fedora 27");
  script_tag(name:"solution", value:"Please install the updated packages.");

  script_xref(name:"FEDORA", value:"2018-43ff5f6e5b");
  script_xref(name:"URL" , value:"https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/T4LYH3KARSFJQ4MB3ZPWDY7BAI7W6A5B");
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

  if ((res = isrpmvuln(pkg:"moodle", rpm:"moodle~3.3.8~1.fc27", rls:"FC27")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
