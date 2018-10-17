###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_fedora_2018_394bf4fb5a_community-mysql_fc26.nasl 9135 2018-03-19 12:37:31Z asteins $
#
# Fedora Update for community-mysql FEDORA-2018-394bf4fb5a
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
  script_oid("1.3.6.1.4.1.25623.1.0.874194");
  script_version("$Revision: 9135 $");
  script_tag(name:"last_modification", value:"$Date: 2018-03-19 13:37:31 +0100 (Mon, 19 Mar 2018) $");
  script_tag(name:"creation_date", value:"2018-03-14 08:38:12 +0100 (Wed, 14 Mar 2018)");
  script_cve_id("CVE-2018-2696", "CVE-2018-2703", "CVE-2018-2565", "CVE-2018-2573", 
                "CVE-2018-2576", "CVE-2018-2583", "CVE-2018-2586", "CVE-2018-2590", 
                "CVE-2018-2600", "CVE-2018-2612", "CVE-2018-2622", "CVE-2018-2640", 
                "CVE-2018-2645", "CVE-2018-2646", "CVE-2018-2647", "CVE-2018-2665", 
                "CVE-2018-2667", "CVE-2018-2668");
  script_tag(name:"cvss_base", value:"7.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:C");
  script_tag(name:"qod_type", value:"package");
  script_name("Fedora Update for community-mysql FEDORA-2018-394bf4fb5a");
  script_tag(name: "summary", value: "Check the version of community-mysql");
  script_tag(name: "vuldetect", value: "Get the installed version with the help 
of detect NVT and check if the version is vulnerable or not.");
  script_tag(name: "insight", value: "MySQL is a multi-user, multi-threaded 
SQL database server. MySQL is a client/server implementation consisting of a 
server daemon (mysqld) and many different client programs and libraries. 
The base package contains the standard MySQL client programs and generic MySQL 
files.
");
  script_tag(name: "affected", value: "community-mysql on Fedora 26");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");

  script_xref(name: "FEDORA", value: "2018-394bf4fb5a");
  script_xref(name: "URL" , value: "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/2XVKEO4WIUCUUOFMMGSFVRPB62HV2HWZ");
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

  if ((res = isrpmvuln(pkg:"community-mysql", rpm:"community-mysql~5.7.21~6.fc26", rls:"FC26")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
