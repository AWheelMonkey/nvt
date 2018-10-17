###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_fedora_2018_871fa4d189_exiv2_fc27.nasl 10887 2018-08-10 12:05:12Z santu $
#
# Fedora Update for exiv2 FEDORA-2018-871fa4d189
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
  script_oid("1.3.6.1.4.1.25623.1.0.874920");
  script_version("$Revision: 10887 $");
  script_tag(name:"last_modification", value:"$Date: 2018-08-10 14:05:12 +0200 (Fri, 10 Aug 2018) $");
  script_tag(name:"creation_date", value:"2018-08-10 06:26:10 +0200 (Fri, 10 Aug 2018)");
  script_cve_id("CVE-2017-17723", "CVE-2017-17725", "CVE-2018-10958", "CVE-2018-10998",
                "CVE-2018-11531", "CVE-2018-12264", "CVE-2018-12265", "CVE-2018-14046",
                "CVE-2018-5772", "CVE-2018-8976", "CVE-2018-8977", "CVE-2018-9144",
                "CVE-2017-5772", "CVE-2018-10999", "CVE-2018-11037", "CVE-2017-17669",
                "CVE-2018-9145", "CVE-2018-9146");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:N");
  script_tag(name:"qod_type", value:"package");
  script_name("Fedora Update for exiv2 FEDORA-2018-871fa4d189");
  script_tag(name:"summary", value:"Check the version of exiv2");
  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");
  script_tag(name:"insight", value:"A command line utility to access image metadata, allowing one to:
* print the Exif metadata of Jpeg images as summary info, interpreted values,
  or the plain data for each tag
* print the Iptc metadata of Jpeg images
* print the Jpeg comment of Jpeg images
* set, add and delete Exif and Iptc metadata of Jpeg images
* adjust the Exif timestamp (that&#39 s how it all started...)
* rename Exif image files according to the Exif timestamp
* extract, insert and delete Exif metadata (including thumbnails),
  Iptc metadata and Jpeg comments
");
  script_tag(name:"affected", value:"exiv2 on Fedora 27");
  script_tag(name:"solution", value:"Please install the updated packages.");

  script_xref(name:"FEDORA", value:"2018-871fa4d189");
  script_xref(name:"URL" , value:"https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/PNW3W32O3CKFFTB3WX4STTENYJTMG5U7");
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

  if ((res = isrpmvuln(pkg:"exiv2", rpm:"exiv2~0.26~12.fc27", rls:"FC27")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
