###############################################################################
# OpenVAS Vulnerability Test
# $Id$
#
# Fedora Update for kernel-tools FEDORA-2018-6e8c330d50
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
  script_oid("1.3.6.1.4.1.25623.1.0.875371");
  script_version("$Revision: 12873 $");
  script_cve_id("CVE-2018-14625", "CVE-2018-20169");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:N");
  script_tag(name:"last_modification", value:"$Date: 2018-12-21 15:42:20 +0100 (Fri, 21 Dec 2018) $");
  script_tag(name:"creation_date", value:"2018-12-21 07:57:30 +0100 (Fri, 21 Dec 2018)");
  script_name("Fedora Update for kernel-tools FEDORA-2018-6e8c330d50");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
  script_family("Fedora Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/fedora", "ssh/login/rpms");

  script_xref(name:"FEDORA", value:"2018-6e8c330d50");
  script_xref(name:"URL" , value:"https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/R2OZEPJQM7MW4NPTYJL3H2KLR4R4Z2XM");

  script_tag(name:"summary", value:"The remote host is missing an update for the 'kernel-tools'
  package(s) announced via the FEDORA-2018-6e8c330d50 advisory.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable package version is present on the target host.");

  script_tag(name:"insight", value:"This package contains the tools/ directory from the kernel source
and the supporting documentation.
");

  script_tag(name:"affected", value:"kernel-tools on Fedora 28.");

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

  if ((res = isrpmvuln(pkg:"kernel-tools", rpm:"kernel-tools~4.19.10~200.fc28", rls:"FC28")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
