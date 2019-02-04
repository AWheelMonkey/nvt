###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_fedora_2017_48f0384090_bodhi_fc26.nasl 13177 2019-01-21 07:53:27Z mmartin $
#
# Fedora Update for bodhi FEDORA-2017-48f0384090
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
  script_oid("1.3.6.1.4.1.25623.1.0.873299");
  script_version("$Revision: 13177 $");
  script_tag(name:"last_modification", value:"$Date: 2019-01-21 08:53:27 +0100 (Mon, 21 Jan 2019) $");
  script_tag(name:"creation_date", value:"2017-08-21 07:56:05 +0200 (Mon, 21 Aug 2017)");
  script_cve_id("CVE-2017-1002152");
  script_tag(name:"cvss_base", value:"4.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:P/A:N");
  script_tag(name:"qod_type", value:"package");
  script_name("Fedora Update for bodhi FEDORA-2017-48f0384090");
  script_tag(name: "summary", value: "Check the version of bodhi");
  script_tag(name: "vuldetect", value: "Get the installed version with the help 
of detect NVT and check if the version is vulnerable or not.");
  script_tag(name: "insight", value: "Bodhi is a web application that facilitates 
the process of publishing updates for a software distribution.

A modular piece of the Fedora Infrastructure stack
* Utilizes the Koji Buildsystem for tracking RPMs
* Creates the update repositories using Mash, which composes a repository based
  on tagged builds in Koji.
");
  script_tag(name: "affected", value: "bodhi on Fedora 26");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");

  script_xref(name: "FEDORA", value: "2017-48f0384090");
  script_xref(name: "URL" , value: "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/NXI5XN5LM3JKJQBIKGFEGYBTTKWENCNL");
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

  if ((res = isrpmvuln(pkg:"bodhi", rpm:"bodhi~2.9.1~1.fc26", rls:"FC26")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
