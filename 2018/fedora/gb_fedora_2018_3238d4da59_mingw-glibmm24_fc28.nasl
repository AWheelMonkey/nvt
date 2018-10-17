###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_fedora_2018_3238d4da59_mingw-glibmm24_fc28.nasl 10991 2018-08-16 02:24:13Z ckuersteiner $
#
# Fedora Update for mingw-glibmm24 FEDORA-2018-3238d4da59
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
  script_oid("1.3.6.1.4.1.25623.1.0.874926");
  script_version("$Revision: 10991 $");
  script_tag(name:"last_modification", value:"$Date: 2018-08-16 04:24:13 +0200 (Thu, 16 Aug 2018) $");
  script_tag(name:"creation_date", value:"2018-08-13 06:08:48 +0200 (Mon, 13 Aug 2018)");
  script_cve_id("CVE-2017-11164", "CVE-2017-7244", "CVE-2017-7245", "CVE-2017-7246",
                "CVE-2017-7186");
  script_tag(name:"cvss_base", value:"7.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:C");
  script_tag(name:"qod_type", value:"package");
  script_name("Fedora Update for mingw-glibmm24 FEDORA-2018-3238d4da59");
  script_tag(name:"summary", value:"Check the version of mingw-glibmm24");
  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present
on the target host.");
  script_tag(name:"insight", value:"glibmm provides a C++ interface to the
GTK+ GLib low-level core library. Highlights include typesafe callbacks, widgets
extensible via inheritance and a comprehensive set of widget classes that can be
freely combined to quickly create complex user interfaces.
");
  script_tag(name:"affected", value:"mingw-glibmm24 on Fedora 28");
  script_tag(name:"solution", value:"Please install the updated packages.");

  script_xref(name:"FEDORA", value:"2018-3238d4da59");
  script_xref(name:"URL" , value:"https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/L4GIVW37D7LJIVIMM567KI2WCBSNJD5S");
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

  if ((res = isrpmvuln(pkg:"mingw32-glibmm24", rpm:"mingw32-glibmm24~2.56.0~1.fc28", rls:"FC28")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"mingw64-glibmm24", rpm:"mingw64-glibmm24~2.56.0~1.fc28", rls:"FC28")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
