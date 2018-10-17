###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_fedora_2017_c9abeb3158_WebCalendar_fc26.nasl 7455 2017-10-17 09:40:59Z asteins $
#
# Fedora Update for WebCalendar FEDORA-2017-c9abeb3158
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
  script_oid("1.3.6.1.4.1.25623.1.0.873491");
  script_version("$Revision: 7455 $");
  script_tag(name:"last_modification", value:"$Date: 2017-10-17 11:40:59 +0200 (Tue, 17 Oct 2017) $");
  script_tag(name:"creation_date", value:"2017-10-10 10:22:10 +0200 (Tue, 10 Oct 2017)");
  script_cve_id("CVE-2017-10840", "CVE-2017-10841");
  script_tag(name:"cvss_base", value:"4.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:P/A:N");
  script_tag(name:"qod_type", value:"package");
  script_name("Fedora Update for WebCalendar FEDORA-2017-c9abeb3158");
  script_tag(name: "summary", value: "Check the version of WebCalendar");
  script_tag(name: "vuldetect", value: "Get the installed version with the help 
of detect NVT and check if the version is vulnerable or not.");
  script_tag(name: "insight", value: "WebCalendar is a PHP-based calendar 
application that can be configured as a single-user calendar, a multi-user 
calendar for groups of users, or as an event calendar viewable by visitors. 
MySQL, PostgreSQL, Oracle, DB2, Interbase, MS SQL Server, or ODBC is required.
  WebCalendar can be setup in a variety of ways, such as...
	* A schedule management system for a single person
	* A schedule management system for a group of people, allowing one or
	  more assistants to manage the calendar of another user
	* An events schedule that anyone can view, allowing visitors to submit
	  new events
	* A calendar server that can be viewed with iCal-compliant calendar
	  applications like Mozilla Sunbird, Apple iCal or GNOME Evolution or
	  RSS-enabled applications like Firefox, Thunderbird, RSSOwl, or
	  FeedDemon, or BlogExpress.
");
  script_tag(name: "affected", value: "WebCalendar on Fedora 26");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");

  script_xref(name: "FEDORA", value: "2017-c9abeb3158");
  script_xref(name: "URL" , value: "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/ECJHVG5Y5KF2GHILLKLPBZEXSK2AD7EN");
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

if(release == "FC26")
{

  if ((res = isrpmvuln(pkg:"WebCalendar", rpm:"WebCalendar~1.2.9~1.fc26", rls:"FC26")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
