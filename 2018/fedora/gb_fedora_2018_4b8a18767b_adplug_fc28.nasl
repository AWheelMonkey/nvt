###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_fedora_2018_4b8a18767b_adplug_fc28.nasl 13012 2019-01-10 08:11:33Z asteins $
#
# Fedora Update for adplug FEDORA-2018-4b8a18767b
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
  script_oid("1.3.6.1.4.1.25623.1.0.875375");
  script_version("$Revision: 13012 $");
  script_cve_id("CVE-2018-17825");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_tag(name:"last_modification", value:"$Date: 2019-01-10 09:11:33 +0100 (Thu, 10 Jan 2019) $");
  script_tag(name:"creation_date", value:"2018-12-25 04:28:39 +0100 (Tue, 25 Dec 2018)");
  script_name("Fedora Update for adplug FEDORA-2018-4b8a18767b");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
  script_family("Fedora Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/fedora", "ssh/login/rpms");

  script_xref(name:"FEDORA", value:"2018-4b8a18767b");
  script_xref(name:"URL" , value:"https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/FSLPXUXVFSFOCMO3LZUFVKZFB3T75QYW");

  script_tag(name:"summary", value:"The remote host is missing an update for the 'adplug'
  package(s) announced via the FEDORA-2018-4b8a18767b advisory.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable package version is present on the target host.");

  script_tag(name:"insight", value:"AdPlug is a free software, cross-platform, hardware independent AdLib
sound player library, mainly written in C++ and released under the
LGPL. AdPlug plays sound data, originally created for the AdLib (OPL2)
audio board, directly from its original format on top of an OPL2
emulator or by using the real hardware. No OPL chip is required for
playback. It supports various audio formats from MS-DOS AdLib trackers.
");

  script_tag(name:"affected", value:"adplug on Fedora 28.");

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

  if ((res = isrpmvuln(pkg:"adplug", rpm:"adplug~2.2.1~7.fc28", rls:"FC28")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
