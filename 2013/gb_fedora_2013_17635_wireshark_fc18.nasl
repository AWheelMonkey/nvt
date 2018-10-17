###############################################################################
# OpenVAS Vulnerability Test
#
# Fedora Update for wireshark FEDORA-2013-17635
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (C) 2013 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.867188");
  script_version("$Revision: 9372 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-06 10:56:37 +0200 (Fri, 06 Apr 2018) $");
  script_tag(name:"creation_date", value:"2013-12-23 11:56:32 +0530 (Mon, 23 Dec 2013)");
  script_cve_id("CVE-2013-4920", "CVE-2013-4921", "CVE-2013-4922", "CVE-2013-4923",
                "CVE-2013-4924", "CVE-2013-4925", "CVE-2013-4926", "CVE-2013-4927",
                "CVE-2013-4074", "CVE-2013-4075", "CVE-2013-4076", "CVE-2013-4077",
                "CVE-2013-4078", "CVE-2013-4079", "CVE-2013-4080", "CVE-2013-4081",
                "CVE-2013-4082", "CVE-2013-4083", "CVE-2013-4928", "CVE-2013-4929",
                "CVE-2013-4930", "CVE-2013-4931", "CVE-2013-4932", "CVE-2013-4933",
                "CVE-2013-4934", "CVE-2013-4935", "CVE-2013-3559", "CVE-2013-3558",
                "CVE-2013-3557", "CVE-2013-3555", "CVE-2013-3562", "CVE-2013-3560");
  script_tag(name:"cvss_base", value:"7.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:C");
  script_name("Fedora Update for wireshark FEDORA-2013-17635");

  tag_insight = "Wireshark is a network traffic analyzer for Unix-ish operating systems.

This package lays base for libpcap, a packet capture and filtering
library, contains command-line utilities, contains plugins and
documentation for wireshark. A graphical user interface is packaged
separately to GTK+ package.
";

  tag_affected = "wireshark on Fedora 18";

  tag_solution = "Please Install the Updated Packages.";


  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");
  script_xref(name: "FEDORA", value: "2013-17635");
  script_xref(name: "URL" , value: "https://lists.fedoraproject.org/pipermail/package-announce/2013-December/124287.html");
  script_tag(name:"summary", value:"Check for the Version of wireshark");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2013 Greenbone Networks GmbH");
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

  if ((res = isrpmvuln(pkg:"wireshark", rpm:"wireshark~1.10.2~4.fc18", rls:"FC18")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
