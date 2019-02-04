###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_fedora_2018_d4349a7ba3_icecast_fc28.nasl 13316 2019-01-28 07:41:51Z asteins $
#
# Fedora Update for icecast FEDORA-2018-d4349a7ba3
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
  script_oid("1.3.6.1.4.1.25623.1.0.875266");
  script_version("$Revision: 13316 $");
  script_cve_id("CVE-2018-18820");
  script_tag(name:"cvss_base", value:"6.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
  script_tag(name:"last_modification", value:"$Date: 2019-01-28 08:41:51 +0100 (Mon, 28 Jan 2019) $");
  script_tag(name:"creation_date", value:"2018-11-13 06:19:55 +0100 (Tue, 13 Nov 2018)");
  script_name("Fedora Update for icecast FEDORA-2018-d4349a7ba3");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
  script_family("Fedora Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/fedora", "ssh/login/rpms");

  script_xref(name:"FEDORA", value:"2018-d4349a7ba3");
  script_xref(name:"URL" , value:"https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/AZRHPASGFHRV7OYF4CXWZUV4EF3K6XHN");

  script_tag(name:"summary", value:"The remote host is missing an update for the 'icecast'
  package(s) announced via the FEDORA-2018-d4349a7ba3 advisory.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable package version is present on the target host.");

  script_tag(name:"insight", value:"Icecast is a streaming media server which currently supports
Ogg Vorbis and MP3 audio streams.  It can be used to create an
Internet radio station or a privately running jukebox and many
things in between.  It is very versatile in that new formats
can be added relatively easily and supports open standards for
communication and interaction.
");

  script_tag(name:"affected", value:"icecast on Fedora 28.");

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

  if ((res = isrpmvuln(pkg:"icecast", rpm:"icecast~2.4.4~1.fc28", rls:"FC28")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
