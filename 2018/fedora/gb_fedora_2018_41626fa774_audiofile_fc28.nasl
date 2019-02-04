###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_fedora_2018_41626fa774_audiofile_fc28.nasl 13316 2019-01-28 07:41:51Z asteins $
#
# Fedora Update for audiofile FEDORA-2018-41626fa774
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (C) 2018 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.875206");
  script_version("$Revision: 13316 $");
  script_tag(name:"last_modification", value:"$Date: 2019-01-28 08:41:51 +0100 (Mon, 28 Jan 2019) $");
  script_tag(name:"creation_date", value:"2018-10-19 06:44:04 +0200 (Fri, 19 Oct 2018)");
  script_cve_id("CVE-2018-13440", "CVE-2018-17095");
  script_tag(name:"cvss_base", value:"6.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
  script_tag(name:"qod_type", value:"package");
  script_name("Fedora Update for audiofile FEDORA-2018-41626fa774");
  script_tag(name:"summary", value:"Check the version of audiofile");
  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present
  on the target host.");
  script_tag(name:"insight", value:"The Audio File library is an implementation
  of the Audio File Library from SGI, which provides an API for accessing audio
  file formats like AIFF/AIFF-C, WAVE, and NeXT/Sun .snd/.au files. This library
  is used by the EsounD daemon.

Install audiofile if you are installing EsounD or you need an API for
any of the sound file formats it can handle.
");
  script_tag(name:"affected", value:"audiofile on Fedora 28");
  script_tag(name:"solution", value:"Please install the updated packages.");

  script_xref(name:"FEDORA", value:"2018-41626fa774");
  script_xref(name:"URL" , value:"https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/IILVUXOJMQBFB3GUWXZZXN4PLR3PV4IO");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
  script_family("Fedora Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/fedora", "ssh/login/rpms");
  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-rpm.inc");

release = get_kb_item("ssh/login/release");

res = "";
if(release == NULL){
  exit(0);
}

if(release == "FC28")
{

  if ((res = isrpmvuln(pkg:"audiofile", rpm:"audiofile~0.3.6~21.fc28", rls:"FC28")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
