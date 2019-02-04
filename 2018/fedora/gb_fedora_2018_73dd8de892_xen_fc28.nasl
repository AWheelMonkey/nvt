###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_fedora_2018_73dd8de892_xen_fc28.nasl 13338 2019-01-29 07:44:39Z mmartin $
#
# Fedora Update for xen FEDORA-2018-73dd8de892
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
  script_oid("1.3.6.1.4.1.25623.1.0.875255");
  script_version("$Revision: 13338 $");
  script_cve_id("CVE-2018-3620", "CVE-2018-3646", "CVE-2018-15469", "CVE-2018-15468", "CVE-2018-15470", "CVE-2018-12891", "CVE-2018-12893", "CVE-2018-12892", "CVE-2018-3665", "CVE-2018-3639", "CVE-2018-8897", "CVE-2018-10982", "CVE-2018-10981", "CVE-2018-10472", "CVE-2018-10471", "CVE-2018-18883");
  script_tag(name:"cvss_base", value:"7.2");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2019-01-29 08:44:39 +0100 (Tue, 29 Jan 2019) $");
  script_tag(name:"creation_date", value:"2018-11-12 06:20:33 +0100 (Mon, 12 Nov 2018)");
  script_name("Fedora Update for xen FEDORA-2018-73dd8de892");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
  script_family("Fedora Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/fedora", "ssh/login/rpms");

  script_xref(name:"FEDORA", value:"2018-73dd8de892");
  script_xref(name:"URL" , value:"https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/N4MA4UUBF3E5HSEL3AI2HU7ITV2Z4YKI");

  script_tag(name:"summary", value:"The remote host is missing an update for the 'xen'
  package(s) announced via the FEDORA-2018-73dd8de892 advisory.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable package version is present on the target host.");

  script_tag(name:"insight", value:"This package contains the XenD daemon and xm command line
tools, needed to manage virtual machines running under the
Xen hypervisor
");

  script_tag(name:"affected", value:"xen on Fedora 28.");

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

  if ((res = isrpmvuln(pkg:"xen", rpm:"xen~4.10.2~2.fc28", rls:"FC28")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
