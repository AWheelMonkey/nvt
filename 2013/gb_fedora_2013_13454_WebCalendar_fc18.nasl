###############################################################################
# OpenVAS Vulnerability Test
#
# Fedora Update for WebCalendar FEDORA-2013-13454
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (c) 2013 Greenbone Networks GmbH, http://www.greenbone.net
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

include("revisions-lib.inc");

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.866436");
  script_version("$Revision: 9353 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-06 09:14:20 +0200 (Fri, 06 Apr 2018) $");
  script_tag(name:"creation_date", value:"2013-08-08 11:25:52 +0530 (Thu, 08 Aug 2013)");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_name("Fedora Update for WebCalendar FEDORA-2013-13454");

  tag_insight = "WebCalendar is a PHP-based calendar application that can be configured as a
single-user calendar, a multi-user calendar for groups of users, or as an
event calendar viewable by visitors. MySQL, PostgreSQL, Oracle, DB2,
Interbase, MS SQL Server, or ODBC is required.
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
";

  tag_affected = "WebCalendar on Fedora 18";

  tag_solution = "Please Install the Updated Packages.";


  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");
  script_xref(name: "FEDORA", value: "2013-13454");
  script_xref(name: "URL" , value: "https://lists.fedoraproject.org/pipermail/package-announce/2013-August/113128.html");
  script_tag(name: "summary" , value: "Check for the Version of WebCalendar");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2013 Greenbone Networks GmbH");
  script_family("Fedora Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/fedora", "ssh/login/rpms");
  exit(0);
}


include("pkg-lib-rpm.inc");

release = get_kb_item("ssh/login/release");

res = "";
if(release == NULL){
  exit(0);
}

if(release == "FC18")
{

  if ((res = isrpmvuln(pkg:"WebCalendar", rpm:"WebCalendar~1.2.7~1.fc18", rls:"FC18")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
