###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_fedora_2018_1621b2204a_kernel_fc28.nasl 12767 2018-12-12 08:39:09Z asteins $
#
# Fedora Update for kernel FEDORA-2018-1621b2204a
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
  script_oid("1.3.6.1.4.1.25623.1.0.875303");
  script_version("$Revision: 12767 $");
  script_cve_id("CVE-2018-18710", "CVE-2018-14633", "CVE-2018-17182", "CVE-2018-5391", "CVE-2018-15471", "CVE-2018-3620", "CVE-2018-3646", "CVE-2018-14734", "CVE-2018-14678", "CVE-2018-13405", "CVE-2018-13053", "CVE-2018-12896", "CVE-2018-13093", "CVE-2018-13094", "CVE-2018-13095", "CVE-2018-12714", "CVE-2018-12633", "CVE-2018-12232", "CVE-2018-10853", "CVE-2018-11506", "CVE-2018-10840", "CVE-2018-3639", "CVE-2018-1120", "CVE-2018-10322", "CVE-2018-10323", "CVE-2018-1108");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2018-12-12 09:39:09 +0100 (Wed, 12 Dec 2018) $");
  script_tag(name:"creation_date", value:"2018-12-04 08:21:51 +0100 (Tue, 04 Dec 2018)");
  script_name("Fedora Update for kernel FEDORA-2018-1621b2204a");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
  script_family("Fedora Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/fedora", "ssh/login/rpms");

  script_xref(name:"FEDORA", value:"2018-1621b2204a");
  script_xref(name:"URL" , value:"https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/HVAY6QRMWP7MBPHLJXJ5HXKW3RPAQRVH");

  script_tag(name:"summary", value:"The remote host is missing an update for the 'kernel'
  package(s) announced via the FEDORA-2018-1621b2204a advisory.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable package version is present on the target host.");

  script_tag(name:"insight", value:"The kernel meta package
");

  script_tag(name:"affected", value:"kernel on Fedora 28.");

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

  if ((res = isrpmvuln(pkg:"kernel", rpm:"kernel~4.19.2~200.fc28", rls:"FC28")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
