###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_fedora_2017_be3df4fe14_java-1.8.0-openjdk-aarch32_fc25.nasl 7032 2017-08-31 12:58:05Z santu $
#
# Fedora Update for java-1.8.0-openjdk-aarch32 FEDORA-2017-be3df4fe14
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (C) 2017 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.873320");
  script_version("$Revision: 7032 $");
  script_tag(name:"last_modification", value:"$Date: 2017-08-31 14:58:05 +0200 (Thu, 31 Aug 2017) $");
  script_tag(name:"creation_date", value:"2017-08-30 07:38:57 +0200 (Wed, 30 Aug 2017)");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"qod_type", value:"package");
  script_name("Fedora Update for java-1.8.0-openjdk-aarch32 FEDORA-2017-be3df4fe14");
  script_tag(name: "summary", value: "Check the version of java-1.8.0-openjdk-aarch32");
  script_tag(name: "vuldetect", value: "Get the installed version with the help 
of detect NVT and check if the version is vulnerable or not.");
  script_tag(name: "insight", value: "A preview release of the upstream OpenJDK 
AArch32 porting project. The OpenJDK runtime environment.");
  script_tag(name: "affected", value: "java-1.8.0-openjdk-aarch32 on Fedora 25");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");

  script_xref(name: "FEDORA", value: "2017-be3df4fe14");
  script_xref(name: "URL" , value: "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/7JECI5VJPA6DI27FDUL4JYG7DDMIPCZE");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
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

if(release == "FC25")
{

  if ((res = isrpmvuln(pkg:"java-1.8.0-openjdk-aarch32", rpm:"java-1.8.0-openjdk-aarch32~1.8.0.141~1.170721.fc25", rls:"FC25")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
