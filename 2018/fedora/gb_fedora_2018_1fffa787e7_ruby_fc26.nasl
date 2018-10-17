###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_fedora_2018_1fffa787e7_ruby_fc26.nasl 9430 2018-04-11 01:54:49Z ckuersteiner $
#
# Fedora Update for ruby FEDORA-2018-1fffa787e7
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
  script_oid("1.3.6.1.4.1.25623.1.0.874232");
  script_version("$Revision: 9430 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-11 03:54:49 +0200 (Wed, 11 Apr 2018) $");
  script_tag(name:"creation_date", value:"2018-03-14 08:42:44 +0100 (Wed, 14 Mar 2018)");
  script_cve_id("CVE-2018-1000073", "CVE-2018-1000074", "CVE-2018-1000075", "CVE-2018-1000076", 
                "CVE-2018-1000077", "CVE-2018-1000078", "CVE-2018-1000079", "CVE-2017-17790");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_tag(name:"qod_type", value:"package");
  script_name("Fedora Update for ruby FEDORA-2018-1fffa787e7");
  script_tag(name: "summary", value: "Check the version of ruby");
  script_tag(name: "vuldetect", value: "Get the installed version with the help 
of detect NVT and check if the version is vulnerable or not.");
  script_tag(name: "insight", value: "Ruby is the interpreted scripting language 
for quick and easy object-oriented programming.  It has many features to process 
text files and to do system management tasks (as in Perl).  It is simple,
straight-forward, and extensible.
");
  script_tag(name: "affected", value: "ruby on Fedora 26");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");

  script_xref(name: "FEDORA", value: "2018-1fffa787e7");
  script_xref(name: "URL" , value: "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/3S76N37KL7MJ7HGXXFCBGNNDAZYHXVB7");
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

  if ((res = isrpmvuln(pkg:"ruby", rpm:"ruby~2.4.3~87.fc26", rls:"FC26")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
