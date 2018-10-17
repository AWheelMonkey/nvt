###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_fedora_2018_16c8fdf9b8_kubernetes_fc27.nasl 9876 2018-05-17 03:47:45Z ckuersteiner $
#
# Fedora Update for kubernetes FEDORA-2018-16c8fdf9b8
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
  script_oid("1.3.6.1.4.1.25623.1.0.874425");
  script_version("$Revision: 9876 $");
  script_tag(name:"last_modification", value:"$Date: 2018-05-17 05:47:45 +0200 (Thu, 17 May 2018) $");
  script_tag(name:"creation_date", value:"2018-05-12 06:00:31 +0200 (Sat, 12 May 2018)");
  script_cve_id("CVE-2017-1002101");
  script_tag(name:"cvss_base", value:"5.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:S/C:P/I:P/A:N");
  script_tag(name:"qod_type", value:"package");
  script_name("Fedora Update for kubernetes FEDORA-2018-16c8fdf9b8");
  script_tag(name:"summary", value:"Check the version of kubernetes");
  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present 
on the target host.");
  script_tag(name:"insight", value:"Container cluster management
");
  script_tag(name:"affected", value:"kubernetes on Fedora 27");
  script_tag(name:"solution", value:"Please install the updated packages.");

  script_xref(name:"FEDORA", value:"2018-16c8fdf9b8");
  script_xref(name:"URL" , value:"https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/FQZP24UN2NMMNYAIVM5CCAOXGZCC2W52");
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

  if ((res = isrpmvuln(pkg:"kubernetes", rpm:"kubernetes~1.10.1~0.fc27", rls:"FC27")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
