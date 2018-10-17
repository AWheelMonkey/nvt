###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_fedora_2018_cf1dd2166b_asterisk_fc27.nasl 10046 2018-06-01 02:46:35Z ckuersteiner $
#
# Fedora Update for asterisk FEDORA-2018-cf1dd2166b
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
  script_oid("1.3.6.1.4.1.25623.1.0.874629");
  script_version("$Revision: 10046 $");
  script_tag(name:"last_modification", value:"$Date: 2018-06-01 04:46:35 +0200 (Fri, 01 Jun 2018) $");
  script_tag(name:"creation_date", value:"2018-05-31 05:55:53 +0200 (Thu, 31 May 2018)");
  script_cve_id("CVE-2017-17850", "CVE-2017-16671", "CVE-2017-16672");
  script_tag(name:"cvss_base", value:"6.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:S/C:P/I:P/A:P");
  script_tag(name:"qod_type", value:"package");
  script_name("Fedora Update for asterisk FEDORA-2018-cf1dd2166b");
  script_tag(name:"summary", value:"Check the version of asterisk");
  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present
on the target host.");
  script_tag(name:"insight", value:"Asterisk is a complete PBX in software.
It runs on Linux and provides all of the features you would expect from a PBX
and more. Asterisk does voice over IP in three protocols, and can interoperate
with almost all standards-based telephony equipment using relatively inexpensive
hardware.
");
  script_tag(name:"affected", value:"asterisk on Fedora 27");
  script_tag(name:"solution", value:"Please install the updated packages.");

  script_xref(name:"FEDORA", value:"2018-cf1dd2166b");
  script_xref(name:"URL" , value:"https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/X2SXJNS3FSESIRJ73QMI3ZYHEME2UWR5");
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

  if ((res = isrpmvuln(pkg:"asterisk", rpm:"asterisk~14.7.6~2.fc27", rls:"FC27")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
