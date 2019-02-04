###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_fedora_2019_348547a32d_chromium_fc28.nasl 13209 2019-01-22 08:11:01Z mmartin $
#
# Fedora Update for chromium FEDORA-2019-348547a32d
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (C) 2019 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.875411");
  script_version("$Revision: 13209 $");
  script_cve_id("CVE-2018-17480", "CVE-2018-17481", "CVE-2018-18335", "CVE-2018-18336",
                "CVE-2018-18337", "CVE-2018-18338", "CVE-2018-18339", "CVE-2018-18340",
                "CVE-2018-18341", "CVE-2018-18342", "CVE-2018-18343", "CVE-2018-18344",
                "CVE-2018-18345", "CVE-2018-18346", "CVE-2018-18347", "CVE-2018-18348",
                "CVE-2018-18349", "CVE-2018-18350", "CVE-2018-18351", "CVE-2018-18352",
                "CVE-2018-18353", "CVE-2018-18354", "CVE-2018-18355", "CVE-2018-18356",
                "CVE-2018-18357", "CVE-2018-18358", "CVE-2018-18359");
  script_tag(name:"cvss_base", value:"6.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
  script_tag(name:"last_modification", value:"$Date: 2019-01-22 09:11:01 +0100 (Tue, 22 Jan 2019) $");
  script_tag(name:"creation_date", value:"2019-01-16 04:03:50 +0100 (Wed, 16 Jan 2019)");
  script_name("Fedora Update for chromium FEDORA-2019-348547a32d");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2019 Greenbone Networks GmbH");
  script_family("Fedora Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/fedora", "ssh/login/rpms");

  script_xref(name:"FEDORA", value:"2019-348547a32d");
  script_xref(name:"URL", value:"https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/GPF6NWCKSBWW66XSYJGJYFDN4NBYOZ2U");

  script_tag(name:"summary", value:"The remote host is missing an update for the
  'chromium' package(s) announced via the FEDORA-2019-348547a32d advisory.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable package version is
  present on the target host.");

  script_tag(name:"insight", value:"Chromium is an open-source web browser,
  powered by WebKit (Blink).
");

  script_tag(name:"affected", value:"chromium on Fedora 28.");

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

  if ((res = isrpmvuln(pkg:"chromium", rpm:"chromium~71.0.3578.98~1.fc28", rls:"FC28")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
