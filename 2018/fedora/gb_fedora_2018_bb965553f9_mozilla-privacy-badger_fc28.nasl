###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_fedora_2018_bb965553f9_mozilla-privacy-badger_fc28.nasl 11042 2018-08-18 06:42:47Z santu $
#
# Fedora Update for mozilla-privacy-badger FEDORA-2018-bb965553f9
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
  script_oid("1.3.6.1.4.1.25623.1.0.874956");
  script_version("$Revision: 11042 $");
  script_tag(name:"last_modification", value:"$Date: 2018-08-18 08:42:47 +0200 (Sat, 18 Aug 2018) $");
  script_tag(name:"creation_date", value:"2018-08-16 06:09:36 +0200 (Thu, 16 Aug 2018)");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:N");
  script_tag(name:"qod_type", value:"package");
  script_name("Fedora Update for mozilla-privacy-badger FEDORA-2018-bb965553f9");
  script_tag(name:"summary", value:"Check the version of mozilla-privacy-badger");
  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present
on the target host.");
  script_tag(name:"insight", value:"Privacy Badger is a browser add-on that stops
advertisers and other third-party trackers from secretly tracking where you go and
what pages you look at on the web. If an advertiser seems to be tracking you across
multiple websites without your permission, Privacy Badger automatically blocks that
advertiser from loading any more content in your browser.
To the advertiser, it&#39 s like you suddenly disappeared.
");
  script_tag(name:"affected", value:"mozilla-privacy-badger on Fedora 28");
  script_tag(name:"solution", value:"Please install the updated packages.");

  script_xref(name:"FEDORA", value:"2018-bb965553f9");
  script_xref(name:"URL" , value:"https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/JSXPZCFBNFYXW2PWDRM4YM7MRLR26ANR");
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

  if ((res = isrpmvuln(pkg:"mozilla-privacy-badger", rpm:"mozilla-privacy-badger~2018.8.1~1.fc28", rls:"FC28")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
