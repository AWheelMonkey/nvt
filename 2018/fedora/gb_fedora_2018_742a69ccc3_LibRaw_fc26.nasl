###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_fedora_2018_742a69ccc3_LibRaw_fc26.nasl 10127 2018-06-08 02:54:24Z ckuersteiner $
#
# Fedora Update for LibRaw FEDORA-2018-742a69ccc3
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
  script_oid("1.3.6.1.4.1.25623.1.0.874585");
  script_version("$Revision: 10127 $");
  script_tag(name:"last_modification", value:"$Date: 2018-06-08 04:54:24 +0200 (Fri, 08 Jun 2018) $");
  script_tag(name:"creation_date", value:"2018-05-19 05:52:54 +0200 (Sat, 19 May 2018)");
  script_cve_id("CVE-2018-10529", "CVE-2018-10528", "CVE-2017-14348", "CVE-2017-13735");
  script_tag(name:"cvss_base", value:"6.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
  script_tag(name:"qod_type", value:"package");
  script_name("Fedora Update for LibRaw FEDORA-2018-742a69ccc3");
  script_tag(name:"summary", value:"Check the version of LibRaw");
  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present 
on the target host.");
  script_tag(name:"insight", value:"LibRaw is a library for reading RAW files 
obtained from digital photo cameras (CRW/CR2, NEF, RAF, DNG, and others).

LibRaw is based on the source codes of the dcraw utility, where part of
drawbacks have already been eliminated and part will be fixed in future.
");
  script_tag(name:"affected", value:"LibRaw on Fedora 26");
  script_tag(name:"solution", value:"Please install the updated packages.");

  script_xref(name:"FEDORA", value:"2018-742a69ccc3");
  script_xref(name:"URL" , value:"https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/T4X62KR4LT4N5H5GVVI34ARS7KNNQ3BL");
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

if(release == "FC26")
{

  if ((res = isrpmvuln(pkg:"LibRaw", rpm:"LibRaw~0.18.11~1.fc26", rls:"FC26")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
