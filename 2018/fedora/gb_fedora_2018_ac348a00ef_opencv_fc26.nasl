###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_fedora_2018_ac348a00ef_opencv_fc26.nasl 9737 2018-05-07 02:30:24Z ckuersteiner $
#
# Fedora Update for opencv FEDORA-2018-ac348a00ef
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
  script_oid("1.3.6.1.4.1.25623.1.0.874412");
  script_version("$Revision: 9737 $");
  script_tag(name:"last_modification", value:"$Date: 2018-05-07 04:30:24 +0200 (Mon, 07 May 2018) $");
  script_tag(name:"creation_date", value:"2018-05-04 05:52:20 +0200 (Fri, 04 May 2018)");
  script_cve_id("CVE-2017-17760", "CVE-2017-1000450");
  script_tag(name:"cvss_base", value:"6.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
  script_tag(name:"qod_type", value:"package");
  script_name("Fedora Update for opencv FEDORA-2018-ac348a00ef");
  script_tag(name:"summary", value:"Check the version of opencv");
  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present 
on the target host.");
  script_tag(name:"insight", value:"OpenCV means Intel Open Source Computer 
Vision Library. It is a collection of C functions and a few C++ classes that 
implement some popular Image Processing and Computer Vision algorithms.
");
  script_tag(name:"affected", value:"opencv on Fedora 26");
  script_tag(name:"solution", value:"Please install the updated packages.");

  script_xref(name:"FEDORA", value:"2018-ac348a00ef");
  script_xref(name:"URL" , value:"https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/VR5DCLWTSQMPCTUPXE4GMJSMGZJ7IE53");
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

  if ((res = isrpmvuln(pkg:"opencv", rpm:"opencv~3.2.0~15.fc26", rls:"FC26")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
