###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_fedora_2018_49d6e4bc3f_python37_fc28.nasl 12889 2018-12-28 07:52:20Z mmartin $
#
# Fedora Update for python37 FEDORA-2018-49d6e4bc3f
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
  script_oid("1.3.6.1.4.1.25623.1.0.875261");
  script_version("$Revision: 12889 $");
  script_cve_id("CVE-2018-14647");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:P");
  script_tag(name:"last_modification", value:"$Date: 2018-12-28 08:52:20 +0100 (Fri, 28 Dec 2018) $");
  script_tag(name:"creation_date", value:"2018-11-13 06:19:29 +0100 (Tue, 13 Nov 2018)");
  script_name("Fedora Update for python37 FEDORA-2018-49d6e4bc3f");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
  script_family("Fedora Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/fedora", "ssh/login/rpms");

  script_xref(name:"FEDORA", value:"2018-49d6e4bc3f");
  script_xref(name:"URL" , value:"https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/M64AHW4IAUQJWVCPZEKR6AIK2TBVAXOL");

  script_tag(name:"summary", value:"The remote host is missing an update for the 'python37'
  package(s) announced via the FEDORA-2018-49d6e4bc3f advisory.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable package version is present on the target host.");

  script_tag(name:"insight", value:"Python 3.7 package for developers.

This package exists to allow developers to test their code against a newer
version of Python. This is not a full Python stack and if you wish to run
your applications with Python 3.7, update your Fedora to a newer
version once Python 3.7 is stable.
");

  script_tag(name:"affected", value:"python37 on Fedora 28.");

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

  if ((res = isrpmvuln(pkg:"python37", rpm:"python37~3.7.1~1.fc28", rls:"FC28")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
