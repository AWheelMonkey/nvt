###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_CESA-2018_1700_procps-ng_centos7.nasl 10349 2018-06-27 15:50:28Z cfischer $
#
# CentOS Update for procps-ng CESA-2018:1700 centos7 
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
  script_oid("1.3.6.1.4.1.25623.1.0.882892");
  script_version("$Revision: 10349 $");
  script_tag(name:"last_modification", value:"$Date: 2018-06-27 17:50:28 +0200 (Wed, 27 Jun 2018) $");
  script_tag(name:"creation_date", value:"2018-05-30 05:47:22 +0200 (Wed, 30 May 2018)");
  script_cve_id("CVE-2018-1124", "CVE-2018-1126");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_tag(name:"qod_type", value:"package");
  script_name("CentOS Update for procps-ng CESA-2018:1700 centos7 ");
  script_tag(name:"summary", value:"Check the version of procps-ng");
  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");
  script_tag(name:"insight", value:"The procps-ng packages contain a set of system utilities that provide
system information, including ps, free, skill, pkill, pgrep, snice, tload,
top, uptime, vmstat, w, watch, and pwdx.

Security Fix(es):

* procps-ng, procps: Integer overflows leading to heap overflow in
file2strvec (CVE-2018-1124)

* procps-ng, procps: incorrect integer size in proc/alloc.* leading to
truncation / integer overflow issues (CVE-2018-1126)

For more details about the security issue(s), including the impact, a CVSS
score, and other related information, refer to the CVE page(s) listed in
the References section.

Red Hat would like to thank Qualys Research Labs for reporting these
issues.
");
  script_tag(name:"affected", value:"procps-ng on CentOS 7");
  script_tag(name:"solution", value:"Please install the updated packages.");

  script_xref(name:"CESA", value:"2018:1700");
  script_xref(name:"URL" , value:"http://lists.centos.org/pipermail/centos-announce/2018-May/022847.html");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
  script_family("CentOS Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/centos", "ssh/login/rpms");
  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-rpm.inc");

release = get_kb_item("ssh/login/release");

res = "";
if(release == NULL){
  exit(0);
}

if(release == "CentOS7")
{

  if ((res = isrpmvuln(pkg:"procps-ng", rpm:"procps-ng~3.3.10~17.el7_5.2", rls:"CentOS7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"procps-ng-devel", rpm:"procps-ng-devel~3.3.10~17.el7_5.2", rls:"CentOS7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"procps-ng-i18n", rpm:"procps-ng-i18n~3.3.10~17.el7_5.2", rls:"CentOS7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}