###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_fedora_2018_509fc4a5c8_webkit2gtk3_fc28.nasl 12638 2018-12-04 08:40:36Z santu $
#
# Fedora Update for webkit2gtk3 FEDORA-2018-509fc4a5c8
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
  script_oid("1.3.6.1.4.1.25623.1.0.875293");
  script_version("$Revision: 12638 $");
  script_cve_id("CVE-2018-4345");
  script_bugtraq_id(106054);
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:N");
  script_tag(name:"last_modification", value:"$Date: 2018-12-04 09:40:36 +0100 (Tue, 04 Dec 2018) $");
  script_tag(name:"creation_date", value:"2018-12-04 12:40:43 +0530 (Tue, 04 Dec 2018)");
  script_name("Fedora Update for webkit2gtk3 FEDORA-2018-509fc4a5c8");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
  script_family("Fedora Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/fedora", "ssh/login/rpms");

  script_xref(name:"FEDORA", value:"2018-509fc4a5c8");
  script_xref(name:"URL" , value:"https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/6TS4CEBCDRYMLBWUMPISV56UADQLU6UJ");

  script_tag(name:"summary", value:"The remote host is missing an update for the 'webkit2gtk3'
  package(s) announced via the FEDORA-2018-509fc4a5c8 advisory.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable package version is present on the target host.");

  script_tag(name:"insight", value:"WebKitGTK+ is the port of the portable web rendering engine WebKit to the
GTK+ platform.

This package contains WebKit2 based WebKitGTK+ for GTK+ 3.
");

  script_tag(name:"affected", value:"webkit2gtk3 on Fedora 28.");

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

  if ((res = isrpmvuln(pkg:"webkit2gtk3", rpm:"webkit2gtk3~2.22.3~1.fc28", rls:"FC28")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}