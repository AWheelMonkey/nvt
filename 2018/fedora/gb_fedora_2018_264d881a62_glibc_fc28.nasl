###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_fedora_2018_264d881a62_glibc_fc28.nasl 9962 2018-05-25 13:08:04Z santu $
#
# Fedora Update for glibc FEDORA-2018-264d881a62
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
  script_oid("1.3.6.1.4.1.25623.1.0.874593");
  script_version("$Revision: 9962 $");
  script_tag(name:"last_modification", value:"$Date: 2018-05-25 15:08:04 +0200 (Fri, 25 May 2018) $");
  script_tag(name:"creation_date", value:"2018-05-22 05:08:50 +0200 (Tue, 22 May 2018)");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"qod_type", value:"package");
  script_name("Fedora Update for glibc FEDORA-2018-264d881a62");
  script_tag(name:"summary", value:"Check the version of glibc");
  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present 
on the target host.");
  script_tag(name:"insight", value:"The glibc package contains standard libraries 
which are used by multiple programs on the system. In order to save disk space 
and memory, as well as to make upgrading easier, common system code is kept in 
one place and shared between programs. This particular package contains the most 
important sets of shared libraries: the standard C library and the standard math 
library. Without these two libraries, a Linux system will not function.
");
  script_tag(name:"affected", value:"glibc on Fedora 28");
  script_tag(name:"solution", value:"Please install the updated packages.");

  script_xref(name:"FEDORA", value:"2018-264d881a62");
  script_xref(name:"URL" , value:"https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/IWV4OZRD76QB32NAR5SPDGEVGZ4K72WQ");
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

  if ((res = isrpmvuln(pkg:"glibc", rpm:"glibc~2.27~14.fc28", rls:"FC28")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
