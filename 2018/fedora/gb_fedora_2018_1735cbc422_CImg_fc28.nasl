###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_fedora_2018_1735cbc422_CImg_fc28.nasl 11829 2018-10-11 02:52:58Z ckuersteiner $
#
# Fedora Update for CImg FEDORA-2018-1735cbc422
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
  script_oid("1.3.6.1.4.1.25623.1.0.875142");
  script_version("$Revision: 11829 $");
  script_tag(name:"last_modification", value:"$Date: 2018-10-11 04:52:58 +0200 (Thu, 11 Oct 2018) $");
  script_tag(name:"creation_date", value:"2018-10-06 08:35:24 +0200 (Sat, 06 Oct 2018)");
  script_cve_id("CVE-2018-7587", "CVE-2018-7588", "CVE-2018-7589", "CVE-2018-7637",
                "CVE-2018-7638", "CVE-2018-7639", "CVE-2018-7640", "CVE-2018-7641");
  script_tag(name:"cvss_base", value:"6.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
  script_tag(name:"qod_type", value:"package");
  script_name("Fedora Update for CImg FEDORA-2018-1735cbc422");
  script_tag(name:"summary", value:"Check the version of CImg");
  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present
  on the target host.");
  script_tag(name:"insight", value:"The CImg Library is an open-source C++ toolkit
  for image processing. It consists in a single header file &#39 CImg.h&#39  providing
  a minimal set of C++ classes and methods that can be used in your own sources,
  to load/save, process and display images. Very portable, efficient and easy to
  use, it&#39 s a pleasant library for developping image processing algorithms in C++.
");
  script_tag(name:"affected", value:"CImg on Fedora 28");
  script_tag(name:"solution", value:"Please install the updated packages.");

  script_xref(name:"FEDORA", value:"2018-1735cbc422");
  script_xref(name:"URL" , value:"https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/7DYSYM3NAEV5S3GRWNC7KQ5GSP2R6V3Y");
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

  if ((res = isrpmvuln(pkg:"CImg", rpm:"CImg~2.3.6~1.fc28", rls:"FC28")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
