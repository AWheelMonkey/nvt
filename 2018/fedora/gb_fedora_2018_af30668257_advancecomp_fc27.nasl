###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_fedora_2018_af30668257_advancecomp_fc27.nasl 11610 2018-09-26 02:42:29Z ckuersteiner $
#
# Fedora Update for advancecomp FEDORA-2018-af30668257
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
  script_oid("1.3.6.1.4.1.25623.1.0.874243");
  script_version("$Revision: 11610 $");
  script_tag(name:"last_modification", value:"$Date: 2018-09-26 04:42:29 +0200 (Wed, 26 Sep 2018) $");
  script_tag(name:"creation_date", value:"2018-03-17 08:51:25 +0100 (Sat, 17 Mar 2018)");
  script_cve_id("CVE-2018-1056");
  script_tag(name:"cvss_base", value:"6.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
  script_tag(name:"qod_type", value:"package");
  script_name("Fedora Update for advancecomp FEDORA-2018-af30668257");
  script_tag(name: "summary", value: "Check the version of advancecomp");
  script_tag(name: "vuldetect", value: "Get the installed version with the help 
of detect NVT and check if the version is vulnerable or not.");
  script_tag(name: "insight", value: "AdvanceCOMP is a set of recompression 
utilities for .PNG, .MNG and .ZIP files. The main features are :
* Recompress ZIP, PNG and MNG files using the Deflate 7-Zip implementation.
* Recompress MNG files using Delta and Move optimization.

This package contains:
* advzip - Recompression and test utility for zip files
* advpng - Recompression utility for png files
* advmng - Recompression utility for mng files
* advdef - Recompression utility for deflate streams in .png, .mng and .gz
files
");
  script_tag(name: "affected", value: "advancecomp on Fedora 27");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");

  script_xref(name: "FEDORA", value: "2018-af30668257");
  script_xref(name: "URL" , value: "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/W3W3HGQNX2GVW65CSFY6R3YQHC33C6GN");
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

  if ((res = isrpmvuln(pkg:"advancecomp", rpm:"advancecomp~2.1~4.fc27", rls:"FC27")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
