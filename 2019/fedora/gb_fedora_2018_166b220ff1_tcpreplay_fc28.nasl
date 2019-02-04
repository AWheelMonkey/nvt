###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_fedora_2018_166b220ff1_tcpreplay_fc28.nasl 13147 2019-01-18 11:35:50Z mmartin $
#
# Fedora Update for tcpreplay FEDORA-2018-166b220ff1
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (C) 2019 Greenbone Networks GmbH, http://www.greenbone.net
# Text descriptions are largely excerpted from the referenced
# advisory, and are Copyright (c) the respective author(s)
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
  script_oid("1.3.6.1.4.1.25623.1.0.875390");
  script_version("$Revision: 13147 $");
  script_cve_id("CVE-2018-18408", "CVE-2018-18407", "CVE-2018-17974", "CVE-2018-17580",
                "CVE-2018-17582", "CVE-2018-13112");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_tag(name:"last_modification", value:"$Date: 2019-01-18 12:35:50 +0100 (Fri, 18 Jan 2019) $");
  script_tag(name:"creation_date", value:"2019-01-07 04:01:33 +0100 (Mon, 07 Jan 2019)");
  script_name("Fedora Update for tcpreplay FEDORA-2018-166b220ff1");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2019 Greenbone Networks GmbH");
  script_family("Fedora Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/fedora", "ssh/login/rpms");

  script_xref(name:"FEDORA", value:"2018-166b220ff1");
  script_xref(name:"URL", value:"https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/LJZWKSMJL3VTJNRVOJ2KVUG3PZHELSDC");

  script_tag(name:"summary", value:"The remote host is missing an update for
  the 'tcpreplay' package(s) announced via the FEDORA-2018-166b220ff1 advisory.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable package version is
  present on the target host.");

  script_tag(name:"insight", value:"Tcpreplay is a tool to replay captured network
  traffic. Currently, tcpreplay supports pcap (tcpdump) and snoop capture formats.
  Also included, is tcpprep a tool to pre-process capture files to allow increased
  performance under certain conditions as well as capinfo which provides basic
  information about capture files.
");

  script_tag(name:"affected", value:"tcpreplay on Fedora 28.");

  script_tag(name:"solution", value:"Please install the updated package(s).");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"package");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-rpm.inc");

release = rpm_get_ssh_release();
if(!release) exit(0);

res = "";

if(release == "FC28")
{

  if ((res = isrpmvuln(pkg:"tcpreplay", rpm:"tcpreplay~4.3.1~1.fc28", rls:"FC28")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
