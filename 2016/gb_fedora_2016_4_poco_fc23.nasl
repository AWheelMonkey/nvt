###############################################################################
# OpenVAS Vulnerability Test
#
# Fedora Update for poco FEDORA-2016-4
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
  script_oid("1.3.6.1.4.1.25623.1.0.807286");
  script_version("$Revision: 6631 $");
  script_tag(name:"last_modification", value:"$Date: 2017-07-10 08:36:10 +0200 (Mon, 10 Jul 2017) $");
  script_tag(name:"creation_date", value:"2016-02-22 06:28:09 +0100 (Mon, 22 Feb 2016)");
  script_cve_id("CVE-2014-0350");
  script_tag(name:"cvss_base", value:"6.4");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:N");
  script_tag(name:"qod_type", value:"package");
  script_name("Fedora Update for poco FEDORA-2016-4");
  script_tag(name: "summary", value: "Check the version of poco");
 
  script_tag(name: "vuldetect", value: "Get the installed version with the help
  of detect NVT and check if the version is vulnerable or not.");

  script_tag(name: "insight", value: "The POCO C++ Libraries (POCO stands for
  POrtable COmponents) are open source C++ class libraries that simplify and
  accelerate the development of network-centric, portable applications in C++.
  The POCO C++ Libraries are built strictly on standard ANSI/ISO C++, including
  the standard library.");

  script_tag(name: "affected", value: "poco on Fedora 23");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");

  script_xref(name: "FEDORA", value: "2016-4");
  script_xref(name: "URL" , value: "https://lists.fedoraproject.org/pipermail/package-announce/2016-February/177573.html");
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

if(release == "FC23")
{

  if ((res = isrpmvuln(pkg:"poco", rpm:"poco~1.4.2p1~3.fc23", rls:"FC23")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
