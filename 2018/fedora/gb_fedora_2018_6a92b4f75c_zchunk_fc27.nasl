###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_fedora_2018_6a92b4f75c_zchunk_fc27.nasl 11734 2018-10-03 11:48:15Z santu $
#
# Fedora Update for zchunk FEDORA-2018-6a92b4f75c
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
  script_oid("1.3.6.1.4.1.25623.1.0.875119");
  script_version("$Revision: 11734 $");
  script_tag(name:"last_modification", value:"$Date: 2018-10-03 13:48:15 +0200 (Wed, 03 Oct 2018) $");
  script_tag(name:"creation_date", value:"2018-10-03 17:02:07 +0530 (Wed, 03 Oct 2018)");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:N");
  script_tag(name:"qod_type", value:"package");
  script_name("Fedora Update for zchunk FEDORA-2018-6a92b4f75c");
  script_tag(name:"summary", value:"Check the version of zchunk");
  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present
  on the target host.");
  script_tag(name:"insight", value:"zchunk is a compressed file format that splits
  the file into independent chunks.  This allows you to only download the
  differences when downloading a new version of the file, and also makes zchunk
  files efficient over rsync. zchunk files are protected with strong checksums
  to verify that the file you downloaded is in fact the file you wanted.
");
  script_tag(name:"affected", value:"zchunk on Fedora 27");
  script_tag(name:"solution", value:"Please install the updated packages.");

  script_xref(name:"FEDORA", value:"2018-6a92b4f75c");
  script_xref(name:"URL" , value:"https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/H5LCUPF7ET6TBZZXNBLLTPPGGNWART6N");
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

  if ((res = isrpmvuln(pkg:"zchunk", rpm:"zchunk~0.9.10~1.fc27", rls:"FC27")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
