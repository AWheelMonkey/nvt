###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_fedora_2019_d4d8af2c22_radare2_fc28.nasl 13255 2019-01-24 07:43:16Z mmartin $
#
# Fedora Update for radare2 FEDORA-2019-d4d8af2c22
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
  script_oid("1.3.6.1.4.1.25623.1.0.875416");
  script_version("$Revision: 13255 $");
  script_cve_id("CVE-2018-20455", "CVE-2018-20456", "CVE-2018-20457", "CVE-2018-20458",
                "CVE-2018-20459", "CVE-2018-20460", "CVE-2018-20461");
  script_tag(name:"cvss_base", value:"4.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:N/A:P");
  script_tag(name:"last_modification", value:"$Date: 2019-01-24 08:43:16 +0100 (Thu, 24 Jan 2019) $");
  script_tag(name:"creation_date", value:"2019-01-19 04:04:15 +0100 (Sat, 19 Jan 2019)");
  script_name("Fedora Update for radare2 FEDORA-2019-d4d8af2c22");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2019 Greenbone Networks GmbH");
  script_family("Fedora Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/fedora", "ssh/login/rpms");

  script_xref(name:"FEDORA", value:"2019-d4d8af2c22");
  script_xref(name:"URL", value:"https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/VJHXVVGWAZPH224ARY3O6GFOU3KENYGK");

  script_tag(name:"summary", value:"The remote host is missing an update for the
  'radare2' package(s) announced via the FEDORA-2019-d4d8af2c22 advisory.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable package version is
  present on the target host.");

  script_tag(name:"insight", value:"The radare2 is a reverse-engineering framework
  that is multi-architecture, multi-platform, and highly scriptable.  Radare2
  provides a hexadecimal editor, wrapped I/O, file system support, debugger support,
  diffing between two functions or binaries, and code analysis at opcode, basic
  block, and function levels.");

  script_tag(name:"affected", value:"radare2 on Fedora 28.");

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

  if ((res = isrpmvuln(pkg:"radare2", rpm:"radare2~3.2.0~1.fc28", rls:"FC28")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
