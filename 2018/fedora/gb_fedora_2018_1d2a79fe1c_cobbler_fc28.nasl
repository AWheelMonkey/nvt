###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_fedora_2018_1d2a79fe1c_cobbler_fc28.nasl 12687 2018-12-06 13:46:21Z mmartin $
#
# Fedora Update for cobbler FEDORA-2018-1d2a79fe1c
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (C) 2018 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.875346");
  script_version("$Revision: 12687 $");
  script_cve_id("CVE-2018-1000226", "CVE-2018-10931");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_tag(name:"last_modification", value:"$Date: 2018-12-06 14:46:21 +0100 (Thu, 06 Dec 2018) $");
  script_tag(name:"creation_date", value:"2018-12-05 08:19:12 +0100 (Wed, 05 Dec 2018)");
  script_name("Fedora Update for cobbler FEDORA-2018-1d2a79fe1c");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
  script_family("Fedora Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/fedora", "ssh/login/rpms");

  script_xref(name:"FEDORA", value:"2018-1d2a79fe1c");
  script_xref(name:"URL" , value:"https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/HJVB73TPWS2HPMP7ZTC5WZZCO6EXOBID");

  script_tag(name:"summary", value:"The remote host is missing an update for the 'cobbler'
  package(s) announced via the FEDORA-2018-1d2a79fe1c advisory.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable package version is present on the target host.");

  script_tag(name:"insight", value:"Cobbler is a network install server.  Cobbler supports PXE, ISO
virtualized installs, and re-installing existing Linux machines.
The last two modes use a helper tool, &#39 koan&#39 , that integrates with
cobbler.  There is also a web interface &#39 cobbler-web&#39 .  Cobbler&#39 s
advanced features include importing distributions from DVDs and rsync
mirrors, kickstart templating, integrated yum mirroring, and built-in
DHCP/DNS Management.  Cobbler has a XMLRPC API for integration with
other applications.
");

  script_tag(name:"affected", value:"cobbler on Fedora 28.");

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

  if ((res = isrpmvuln(pkg:"cobbler", rpm:"cobbler~2.8.4~5.fc28", rls:"FC28")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
