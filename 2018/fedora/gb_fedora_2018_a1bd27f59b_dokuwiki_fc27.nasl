###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_fedora_2018_a1bd27f59b_dokuwiki_fc27.nasl 11513 2018-09-21 03:48:51Z ckuersteiner $
#
# Fedora Update for dokuwiki FEDORA-2018-a1bd27f59b
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
  script_oid("1.3.6.1.4.1.25623.1.0.875086");
  script_version("$Revision: 11513 $");
  script_tag(name:"last_modification", value:"$Date: 2018-09-21 05:48:51 +0200 (Fri, 21 Sep 2018) $");
  script_tag(name:"creation_date", value:"2018-09-20 07:53:19 +0200 (Thu, 20 Sep 2018)");
  script_cve_id("CVE-2016-7964", "CVE-2016-7965", "CVE-2017-12583", "CVE-2017-12979",
                "CVE-2017-12980", "CVE-2017-18123");
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_tag(name:"qod_type", value:"package");
  script_name("Fedora Update for dokuwiki FEDORA-2018-a1bd27f59b");
  script_tag(name:"summary", value:"Check the version of dokuwiki");
  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present
  on the target host.");
  script_tag(name:"insight", value:"DokuWiki is a standards compliant, simple to
  use Wiki, mainly aimed at creating documentation of any kind. It has a simple
  but powerful syntax which makes sure the data-files remain readable outside
  the Wiki and eases the creation of structured texts.

All data is stored in plain text files no database is required.
");
  script_tag(name:"affected", value:"dokuwiki on Fedora 27");
  script_tag(name:"solution", value:"Please install the updated packages.");

  script_xref(name:"FEDORA", value:"2018-a1bd27f59b");
  script_xref(name:"URL" , value:"https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/XPNTHW3SYF4KDQE32QW2VENBUJAZDRCD");
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

  if ((res = isrpmvuln(pkg:"dokuwiki", rpm:"dokuwiki~20180422a~2.fc27", rls:"FC27")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
