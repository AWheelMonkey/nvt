###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_fedora_2018_e4c2507720_guava_fc27.nasl 10231 2018-06-18 03:58:33Z ckuersteiner $
#
# Fedora Update for guava FEDORA-2018-e4c2507720
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
  script_oid("1.3.6.1.4.1.25623.1.0.874589");
  script_version("$Revision: 10231 $");
  script_tag(name:"last_modification", value:"$Date: 2018-06-18 05:58:33 +0200 (Mon, 18 Jun 2018) $");
  script_tag(name:"creation_date", value:"2018-05-20 05:53:40 +0200 (Sun, 20 May 2018)");
  script_cve_id("CVE-2018-10237");
  script_tag(name:"cvss_base", value:"4.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:N/A:P");
  script_tag(name:"qod_type", value:"package");
  script_name("Fedora Update for guava FEDORA-2018-e4c2507720");
  script_tag(name:"summary", value:"Check the version of guava");
  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present 
on the target host.");
  script_tag(name:"insight", value:"Guava is a suite of core and expanded 
libraries that include utility classes, Googles collections, io classes, and much
much more.
This project is a complete packaging of all the Guava libraries into a single 
jar.  Individual portions of Guava can be used by downloading the appropriate 
module and its dependencies.
");
  script_tag(name:"affected", value:"guava on Fedora 27");
  script_tag(name:"solution", value:"Please install the updated packages.");

  script_xref(name:"FEDORA", value:"2018-e4c2507720");
  script_xref(name:"URL" , value:"https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/DD62E6IA5IPL2HO5Z3AACO7GGEUOQYSC");
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

  if ((res = isrpmvuln(pkg:"guava", rpm:"guava~18.0~12.fc27", rls:"FC27")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
