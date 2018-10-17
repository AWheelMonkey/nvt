###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_fedora_2018_1e32d78b95_mozjs52_fc26.nasl 9276 2018-04-03 07:04:47Z santu $
#
# Fedora Update for mozjs52 FEDORA-2018-1e32d78b95
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
  script_oid("1.3.6.1.4.1.25623.1.0.874304");
  script_version("$Revision: 9276 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-03 09:04:47 +0200 (Tue, 03 Apr 2018) $");
  script_tag(name:"creation_date", value:"2018-03-29 08:48:32 +0200 (Thu, 29 Mar 2018)");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"qod_type", value:"package");
  script_name("Fedora Update for mozjs52 FEDORA-2018-1e32d78b95");
  script_tag(name: "summary", value: "Check the version of mozjs52");
  script_tag(name: "vuldetect", value: "Get the installed version with the help 
of detect NVT and check if the version is vulnerable or not.");
  script_tag(name: "insight", value: "SpiderMonkey is the code-name for Mozilla 
Firefox&#39 s C++ implementation of JavaScript. It is intended to be embedded in 
other applications that provide host environments for JavaScript.
");
  script_tag(name: "affected", value: "mozjs52 on Fedora 26");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");

  script_xref(name: "FEDORA", value: "2018-1e32d78b95");
  script_xref(name: "URL" , value: "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/SBKEXJWCIZTXKTY6N5YUUZ7646WDGIL2");
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

  if ((res = isrpmvuln(pkg:"mozjs52", rpm:"mozjs52~52.7.2~1.fc26", rls:"FC26")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
