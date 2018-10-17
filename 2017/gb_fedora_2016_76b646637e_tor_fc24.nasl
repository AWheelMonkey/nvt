###############################################################################
# OpenVAS Vulnerability Test
#
# Fedora Update for tor FEDORA-2016-76b646637e
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
  script_oid("1.3.6.1.4.1.25623.1.0.872212");
  script_version("$Revision: 8261 $");
  script_tag(name:"last_modification", value:"$Date: 2017-12-29 10:13:46 +0100 (Fri, 29 Dec 2017) $");
  script_tag(name:"creation_date", value:"2017-01-01 05:56:41 +0100 (Sun, 01 Jan 2017)");
  script_cve_id("CVE-2016-1254");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:P");
  script_tag(name:"qod_type", value:"package");
  script_name("Fedora Update for tor FEDORA-2016-76b646637e");
  script_tag(name: "summary", value: "Check the version of tor");

  script_tag(name: "vuldetect", value: "Get the installed version with the help
  of detect NVT and check if the version is vulnerable or not.");

  script_tag(name: "insight", value: "The Tor network is a group of volunteer
  -operated servers that allows people to improve their privacy and security
  on the Internet. Tor&#39 s users employ this network by connecting
  through a series of virtual tunnels rather than making a direct connection,
  thus allowing both organizations and individuals to share information
  over public networks without compromising their privacy. Along the
  same line, Tor is an effective censorship circumvention tool, allowing its
  users to reach otherwise blocked destinations or content. Tor can also be
  used as a building block for software developers to create new communication
  tools with built-in privacy features.

  This package contains the Tor software that can act as either a server on the
  Tor network, or as a client to connect to the Tor network.");

  script_tag(name: "affected", value: "tor on Fedora 24");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");

  script_xref(name: "FEDORA", value: "2016-76b646637e");
  script_xref(name: "URL" , value: "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/FXOJSMCTIOHLBRYFBVEL3CDLGPZXX6WE");
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

if(release == "FC24")
{

  if ((res = isrpmvuln(pkg:"tor", rpm:"tor~0.2.8.12~1.fc24", rls:"FC24")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
