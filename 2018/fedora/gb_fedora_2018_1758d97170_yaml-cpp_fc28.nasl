###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_fedora_2018_1758d97170_yaml-cpp_fc28.nasl 11700 2018-10-01 04:58:46Z ckuersteiner $
#
# Fedora Update for yaml-cpp FEDORA-2018-1758d97170
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
  script_oid("1.3.6.1.4.1.25623.1.0.875108");
  script_version("$Revision: 11700 $");
  script_tag(name:"last_modification", value:"$Date: 2018-10-01 06:58:46 +0200 (Mon, 01 Oct 2018) $");
  script_tag(name:"creation_date", value:"2018-09-28 13:34:43 +0200 (Fri, 28 Sep 2018)");
  script_cve_id("CVE-2017-5950");
  script_tag(name:"cvss_base", value:"4.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:N/A:P");
  script_tag(name:"qod_type", value:"package");
  script_name("Fedora Update for yaml-cpp FEDORA-2018-1758d97170");
  script_tag(name:"summary", value:"Check the version of yaml-cpp");
  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present
  on the target host.");
  script_tag(name:"insight", value:"yaml-cpp is a YAML parser and emitter in C++
  written around the YAML 1.2 spec.
");
  script_tag(name:"affected", value:"yaml-cpp on Fedora 28");
  script_tag(name:"solution", value:"Please install the updated packages.");

  script_xref(name:"FEDORA", value:"2018-1758d97170");
  script_xref(name:"URL" , value:"https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/TRPU5CPNMC3QDE5HYMNIHKLJDGKEO4AJ");
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

if(release == "FC28")
{

  if ((res = isrpmvuln(pkg:"yaml-cpp", rpm:"yaml-cpp~0.6.1~4.fc28", rls:"FC28")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
