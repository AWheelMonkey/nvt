###############################################################################
# OpenVAS Vulnerability Test
#
# Fedora Update for check-mk FEDORA-2014-6818
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (C) 2014 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.867855");
  script_version("$Revision: 11513 $");
  script_tag(name:"last_modification", value:"$Date: 2018-09-21 05:48:51 +0200 (Fri, 21 Sep 2018) $");
  script_tag(name:"creation_date", value:"2014-06-17 09:45:34 +0530 (Tue, 17 Jun 2014)");
  script_cve_id("CVE-2014-2330", "CVE-2014-2331", "CVE-2014-2329", "CVE-2014-2332", "CVE-2014-0243");
  script_tag(name:"cvss_base", value:"8.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:S/C:C/I:C/A:C");
  script_name("Fedora Update for check-mk FEDORA-2014-6818");

  tag_insight = "check-mk is a general purpose Nagios-plugin for retrieving data. It adopts a
new approach for collecting data from operating systems and network components.
It obsoletes NRPE, check_by_ssh, NSClient, and check_snmp and it has many
benefits, the most important are a significant reduction of CPU usage on
the Nagios host and an automatic inventory of items to be checked on hosts.
";

  tag_affected = "check-mk on Fedora 19";

  tag_solution = "Please Install the Updated Packages.";


  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");
  script_xref(name: "FEDORA", value: "2014-6818");
  script_xref(name: "URL" , value: "https://lists.fedoraproject.org/pipermail/package-announce/2014-June/134160.html");
  script_tag(name:"summary", value:"Check for the Version of check-mk");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2014 Greenbone Networks GmbH");
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

if(release == "FC19")
{

  if ((res = isrpmvuln(pkg:"check-mk", rpm:"check-mk~1.2.4p2~2.fc19", rls:"FC19")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
