###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_fedora_2018_ab62814cee_nodejs-mixin-deep_fc28.nasl 10645 2018-07-27 05:27:50Z cfischer $
#
# Fedora Update for nodejs-mixin-deep FEDORA-2018-ab62814cee
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
  script_oid("1.3.6.1.4.1.25623.1.0.874630");
  script_version("$Revision: 10645 $");
  script_tag(name:"last_modification", value:"$Date: 2018-07-27 07:27:50 +0200 (Fri, 27 Jul 2018) $");
  script_tag(name:"creation_date", value:"2018-05-31 05:56:04 +0200 (Thu, 31 May 2018)");
  script_cve_id("CVE-2018-3719");
  script_tag(name:"cvss_base", value:"6.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:S/C:P/I:P/A:P");
  script_tag(name:"qod_type", value:"package");
  script_name("Fedora Update for nodejs-mixin-deep FEDORA-2018-ab62814cee");
  script_tag(name:"summary", value:"Check the version of nodejs-mixin-deep");
  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present 
on the target host.");
  script_tag(name:"insight", value:"Deeply mix the properties of objects into 
the first object. Like merge-deep, but doesn&#39 t clone.
");
  script_tag(name:"affected", value:"nodejs-mixin-deep on Fedora 28");
  script_tag(name:"solution", value:"Please install the updated packages.");

  script_xref(name:"FEDORA", value:"2018-ab62814cee");
  script_xref(name:"URL" , value:"https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/KUJXE4PVACKASWCTN6V26X7HOBJI5XQD");
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

  if ((res = isrpmvuln(pkg:"nodejs-mixin-deep", rpm:"nodejs-mixin-deep~1.3.1~1.fc28", rls:"FC28")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
