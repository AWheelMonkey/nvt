###############################################################################
# OpenVAS Vulnerability Test
#
# Fedora Update for clamav FEDORA-2013-10980
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

tag_solution = "Please Install the Updated Packages.";
tag_insight = "Clam AntiVirus is an anti-virus toolkit for UNIX. The main purpose of this
  software is the integration with mail servers (attachment scanning). The
  package provides a flexible and scalable multi-threaded daemon, a command
  line scanner, and a tool for automatic updating via Internet. The programs
  are based on a shared library distributed with the Clam AntiVirus package,
  which you can use with your own software. The virus database is based on
  the virus database from OpenAntiVirus, but contains additional signatures
  (including signatures for popular polymorphic viruses, too) and is KEPT UP
  TO DATE.";
tag_affected = "clamav on Fedora 17";


if(description)
{
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "solution" , value : tag_solution);
  script_oid("1.3.6.1.4.1.25623.1.0.866027");
  script_version("$Revision: 9372 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-06 10:56:37 +0200 (Fri, 06 Apr 2018) $");
  script_tag(name:"creation_date", value:"2013-06-24 14:52:26 +0530 (Mon, 24 Jun 2013)");
  script_cve_id("CVE-2012-1457", "CVE-2012-1458", "CVE-2012-1459", "CVE-2013-2020", "CVE-2013-2021");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:P");
  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");
  script_name("Fedora Update for clamav FEDORA-2013-10980");

  script_xref(name: "FEDORA", value: "2013-10980");
  script_xref(name: "URL" , value: "https://lists.fedoraproject.org/pipermail/package-announce/2013-June/109652.html");
  script_tag(name:"summary", value:"Check for the Version of clamav");
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

if(release == "FC17")
{

  if ((res = isrpmvuln(pkg:"clamav", rpm:"clamav~0.97.8~2.fc17", rls:"FC17")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
