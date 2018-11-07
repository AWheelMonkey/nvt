###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_fedora_2018_f2f8571abd_sos-collector_fc27.nasl 12203 2018-11-02 14:42:44Z bshakeel $
#
# Fedora Update for sos-collector FEDORA-2018-f2f8571abd
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
  script_oid("1.3.6.1.4.1.25623.1.0.875234");
  script_version("$Revision: 12203 $");
  script_cve_id("CVE-2018-14650");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:N");
  script_tag(name:"last_modification", value:"$Date: 2018-11-02 15:42:44 +0100 (Fri, 02 Nov 2018) $");
  script_tag(name:"creation_date", value:"2018-11-01 06:23:17 +0100 (Thu, 01 Nov 2018)");
  script_name("Fedora Update for sos-collector FEDORA-2018-f2f8571abd");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
  script_family("Fedora Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/fedora", "ssh/login/rpms");

  script_xref(name:"FEDORA", value:"2018-f2f8571abd");
  script_xref(name:"URL" , value:"https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/XSNDFDK36XRTL3KW26PCGPF2ZU6EAE7B");

  script_tag(name:"summary", value:"The remote host is missing an update for the
  'sos-collector' package(s) announced via the FEDORA-2018-f2f8571abd advisory.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable package version is
  present on the target host.");

  script_tag(name:"insight", value:"sos-collector is a utility designed to capture
  sosreports from multiple nodes at once and collect them into a single archive.
  If the nodes are part of a cluster, profiles can be used to configure how the
  sosreport command is run on the nodes.
");

  script_tag(name:"affected", value:"sos-collector on Fedora 27.");

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

  if ((res = isrpmvuln(pkg:"sos-collector", rpm:"sos-collector~1.5~3.fc27", rls:"FC27")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
