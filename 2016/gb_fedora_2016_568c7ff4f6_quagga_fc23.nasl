###############################################################################
# OpenVAS Vulnerability Test
#
# Fedora Update for quagga FEDORA-2016-568c7ff4f6
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
  script_oid("1.3.6.1.4.1.25623.1.0.810174");
  script_version("$Revision: 6631 $");
  script_tag(name:"last_modification", value:"$Date: 2017-07-10 08:36:10 +0200 (Mon, 10 Jul 2017) $");
  script_tag(name:"creation_date", value:"2016-12-02 14:04:02 +0100 (Fri, 02 Dec 2016)");
  script_cve_id("CVE-2016-1245", "CVE-2016-4049", "CVE-2016-2342");
  script_tag(name:"cvss_base", value:"7.6");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:H/Au:N/C:C/I:C/A:C");
  script_tag(name:"qod_type", value:"package");
  script_name("Fedora Update for quagga FEDORA-2016-568c7ff4f6");
  script_tag(name: "summary", value: "Check the version of quagga");

  script_tag(name: "vuldetect", value: "Get the installed version with the help
  of detect NVT and check if the version is vulnerable or not.");

  script_tag(name: "insight", value: "Quagga is free software that operates
  TCP/IP-based routing protocols. It takes a multi-server and multi-threaded
  approach to resolving the current complexity of the Internet.

  Quagga supports Babel, BGP4, BGP4+, BGP4-, IS-IS (experimental), OSPFv2,
  OSPFv3, RIPv1, RIPv2, and RIPng.

  Quagga is intended to be used as a Route Server and a Route Reflector. It is
  not a toolkit  it provides full routing power under a new architecture.
  Quagga by design has a process for each protocol.

  Quagga is a fork of GNU Zebra.");

  script_tag(name: "affected", value: "quagga on Fedora 23");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");

  script_xref(name: "FEDORA", value: "2016-568c7ff4f6");
  script_xref(name: "URL" , value: "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/X4EXXPQTSPEX3RJFNL2LETKLJRRTOITL");
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

  if ((res = isrpmvuln(pkg:"quagga", rpm:"quagga~0.99.24.1~3.fc23", rls:"FC23")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
