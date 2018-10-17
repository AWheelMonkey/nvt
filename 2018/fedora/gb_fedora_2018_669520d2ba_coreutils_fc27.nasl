###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_fedora_2018_669520d2ba_coreutils_fc27.nasl 8624 2018-02-01 12:56:46Z cfischer $
#
# Fedora Update for coreutils FEDORA-2018-669520d2ba
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
  script_oid("1.3.6.1.4.1.25623.1.0.874077");
  script_version("$Revision: 8624 $");
  script_tag(name:"last_modification", value:"$Date: 2018-02-01 13:56:46 +0100 (Thu, 01 Feb 2018) $");
  script_tag(name:"creation_date", value:"2018-01-31 07:58:59 +0100 (Wed, 31 Jan 2018)");
  script_cve_id("CVE-2017-18018");
  script_tag(name:"cvss_base", value:"1.9");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:M/Au:N/C:N/I:P/A:N");
  script_tag(name:"qod_type", value:"package");
  script_name("Fedora Update for coreutils FEDORA-2018-669520d2ba");
  script_tag(name: "summary", value: "Check the version of coreutils");
  script_tag(name: "vuldetect", value: "Get the installed version with the help 
of detect NVT and check if the version is vulnerable or not.");
  script_tag(name: "insight", value: "These are the GNU core utilities.  
This package is the combination of the old GNU fileutils, sh-utils, and 
textutils packages.");
  script_tag(name: "affected", value: "coreutils on Fedora 27");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");

  script_xref(name: "FEDORA", value: "2018-669520d2ba");
  script_xref(name: "URL" , value: "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/JK2ISMPYUEU3JS3L7AVXEHWCI56INCJJ");
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

  if ((res = isrpmvuln(pkg:"coreutils", rpm:"coreutils~8.27~19.fc27", rls:"FC27")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
