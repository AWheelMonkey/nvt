###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_fedora_2017_6e6f4f95e6_ruby_fc26.nasl 8291 2018-01-04 09:51:36Z asteins $
#
# Fedora Update for ruby FEDORA-2017-6e6f4f95e6
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
  script_oid("1.3.6.1.4.1.25623.1.0.873953");
  script_version("$Revision: 8291 $");
  script_tag(name:"last_modification", value:"$Date: 2018-01-04 10:51:36 +0100 (Thu, 04 Jan 2018) $");
  script_tag(name:"creation_date", value:"2017-12-29 08:05:08 +0100 (Fri, 29 Dec 2017)");
  script_cve_id("CVE-2017-14033", "CVE-2017-10784", "CVE-2017-0898");
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_tag(name:"qod_type", value:"package");
  script_name("Fedora Update for ruby FEDORA-2017-6e6f4f95e6");
  script_tag(name: "summary", value: "Check the version of ruby");
  script_tag(name: "vuldetect", value: "Get the installed version with the help 
of detect NVT and check if the version is vulnerable or not.");
  script_tag(name: "insight", value: "Ruby is the interpreted scripting 
language for quick and easy object-oriented programming.  It has many features 
to process text files and to do system management tasks (as in Perl). It is 
simple, straight-forward, and extensible.");
  script_tag(name: "affected", value: "ruby on Fedora 26");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");

  script_xref(name: "FEDORA", value: "2017-6e6f4f95e6");
  script_xref(name: "URL" , value: "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/X3U6T42QITZNKC5KGDDMYAR4OS4TWYJ2");
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

  if ((res = isrpmvuln(pkg:"ruby", rpm:"ruby~2.4.2~84.fc26", rls:"FC26")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
