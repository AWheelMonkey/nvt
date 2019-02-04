###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_fedora_2018_8587111c5a_mkvtoolnix_fc27.nasl 13374 2019-01-31 07:19:48Z asteins $
#
# Fedora Update for mkvtoolnix FEDORA-2018-8587111c5a
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
  script_oid("1.3.6.1.4.1.25623.1.0.875242");
  script_version("$Revision: 13374 $");
  script_cve_id("CVE-2018-4022");
  script_tag(name:"cvss_base", value:"6.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
  script_tag(name:"last_modification", value:"$Date: 2019-01-31 08:19:48 +0100 (Thu, 31 Jan 2019) $");
  script_tag(name:"creation_date", value:"2018-11-08 06:36:48 +0100 (Thu, 08 Nov 2018)");
  script_name("Fedora Update for mkvtoolnix FEDORA-2018-8587111c5a");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
  script_family("Fedora Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/fedora", "ssh/login/rpms");

  script_xref(name:"FEDORA", value:"2018-8587111c5a");
  script_xref(name:"URL" , value:"https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/YODYDDUC6SSFN3MNC3J6MY7UXKOLPILH");

  script_tag(name:"summary", value:"The remote host is missing an update for the 'mkvtoolnix'
  package(s) announced via the FEDORA-2018-8587111c5a advisory.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable package version is present on the target host.");

  script_tag(name:"insight", value:"Mkvtoolnix is a set of utilities to mux and demux audio, video and subtitle
streams into and from Matroska containers.
");

  script_tag(name:"affected", value:"mkvtoolnix on Fedora 27.");

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

if(release == "FC27")
{

  if ((res = isrpmvuln(pkg:"mkvtoolnix", rpm:"mkvtoolnix~28.2.0~1.fc27", rls:"FC27")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
