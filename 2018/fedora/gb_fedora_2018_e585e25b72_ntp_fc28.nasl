###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_fedora_2018_e585e25b72_ntp_fc28.nasl 11180 2018-08-31 14:10:20Z mmartin $
#
# Fedora Update for ntp FEDORA-2018-e585e25b72
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
  script_oid("1.3.6.1.4.1.25623.1.0.875015");
  script_version("$Revision: 11180 $");
  script_tag(name:"last_modification", value:"$Date: 2018-08-31 16:10:20 +0200 (Fri, 31 Aug 2018) $");
  script_tag(name:"creation_date", value:"2018-08-30 07:28:10 +0200 (Thu, 30 Aug 2018)");
  script_cve_id("CVE-2018-12327", "CVE-2018-7170");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_tag(name:"qod_type", value:"package");
  script_name("Fedora Update for ntp FEDORA-2018-e585e25b72");
  script_tag(name:"summary", value:"Check the version of ntp");
  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present
on the target host.");
  script_tag(name:"insight", value:"The Network Time Protocol (NTP) is used to
synchronize a computer&#39 s time with another reference time source. This package
includes ntpd (a daemon which continuously adjusts system time) and utilities used
to query and configure the ntpd daemon.

Perl scripts are in the ntp-perl package, ntpdate is in the ntpdate package and sntp
is in the sntp package. The documentation in HTML format is in the ntp-doc package.
");
  script_tag(name:"affected", value:"ntp on Fedora 28");
  script_tag(name:"solution", value:"Please install the updated packages.");

  script_xref(name:"FEDORA", value:"2018-e585e25b72");
  script_xref(name:"URL" , value:"https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/437XM4CMBCMPK7D2RSEUZIRLFZD5ZNRD");
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

  if ((res = isrpmvuln(pkg:"ntp", rpm:"ntp~4.2.8p12~1.fc28", rls:"FC28")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
