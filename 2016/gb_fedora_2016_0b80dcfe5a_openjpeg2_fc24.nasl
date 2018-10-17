###############################################################################
# OpenVAS Vulnerability Test
#
# Fedora Update for openjpeg2 FEDORA-2016-0b80dcfe5a
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (C) 2016 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.872121");
  script_version("$Revision: 11884 $");
  script_tag(name:"last_modification", value:"$Date: 2018-10-12 15:33:40 +0200 (Fri, 12 Oct 2018) $");
  script_tag(name:"creation_date", value:"2016-12-12 06:27:12 +0100 (Mon, 12 Dec 2016)");
  script_cve_id("CVE-2016-9573", "CVE-2016-9572");
  script_tag(name:"cvss_base", value:"5.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:N/A:P");
  script_tag(name:"qod_type", value:"package");
  script_name("Fedora Update for openjpeg2 FEDORA-2016-0b80dcfe5a");
  script_tag(name: "summary", value: "Check the version of openjpeg2");

  script_tag(name: "vuldetect", value: "Get the installed version with the help
  of detect NVT and check if the version is vulnerable or not.");
  script_tag(name: "insight", value: "The OpenJPEG library is an open-source
  JPEG 2000 library developed in order to promote the use of JPEG 2000.

  This package contains
  * JPEG 2000 codec compliant with the Part 1 of the standard (Class-1 Profile-1
    compliance).
  * JP2 (JPEG 2000 standard Part 2 - Handling of JP2 boxes and extended multiple
    component transforms for multispectral and hyperspectral imagery)");

  script_tag(name: "affected", value: "openjpeg2 on Fedora 24");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");

  script_xref(name: "FEDORA", value: "2016-0b80dcfe5a");
  script_xref(name: "URL" , value: "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/G3C7U32IFCUOTSYNRT6QD5AFHWZ2ELHE");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
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

if(release == "FC24")
{

  if ((res = isrpmvuln(pkg:"openjpeg2", rpm:"openjpeg2~2.1.2~2.fc24", rls:"FC24")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
