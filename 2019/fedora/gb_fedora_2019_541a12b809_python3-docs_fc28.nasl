###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_fedora_2019_541a12b809_python3-docs_fc28.nasl 13245 2019-01-23 14:22:53Z santu $
#
# Fedora Update for python3-docs FEDORA-2019-541a12b809
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
  script_oid("1.3.6.1.4.1.25623.1.0.875417");
  script_version("$Revision: 13245 $");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:N");
  script_tag(name:"last_modification", value:"$Date: 2019-01-23 15:22:53 +0100 (Wed, 23 Jan 2019) $");
  script_tag(name:"creation_date", value:"2019-01-19 04:04:35 +0100 (Sat, 19 Jan 2019)");
  script_name("Fedora Update for python3-docs FEDORA-2019-541a12b809");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2019 Greenbone Networks GmbH");
  script_family("Fedora Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/fedora", "ssh/login/rpms");

  script_xref(name:"FEDORA", value:"2019-541a12b809");
  script_xref(name:"URL", value:"https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/5TVOTENAJYDKW2X2E4BC2SPIAQ36Q7YL");

  script_tag(name:"summary", value:"The remote host is missing an update for the
  'python3-docs' package(s) announced via the FEDORA-2019-541a12b809 advisory.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable package version is present
  on the target host.");

  script_tag(name:"insight", value:"The python3-docs package contains documentation
  on the Python 3 programming language and interpreter.

Install the python3-docs package if you&#39 d like to use the documentation
for the Python 3 language.
");

  script_tag(name:"affected", value:"python3-docs on Fedora 28.");

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

  if ((res = isrpmvuln(pkg:"python3-docs", rpm:"python3-docs~3.6.8~1.fc28", rls:"FC28")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
