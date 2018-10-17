###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_CESA-2018_2240_openslp_centos7.nasl 10664 2018-07-27 13:57:41Z cfischer $
#
# CentOS Update for openslp CESA-2018:2240 centos7 
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
  script_oid("1.3.6.1.4.1.25623.1.0.882927");
  script_version("$Revision: 10664 $");
  script_tag(name:"last_modification", value:"$Date: 2018-07-27 15:57:41 +0200 (Fri, 27 Jul 2018) $");
  script_tag(name:"creation_date", value:"2018-07-26 06:00:44 +0200 (Thu, 26 Jul 2018)");
  script_cve_id("CVE-2017-17833");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_tag(name:"qod_type", value:"package");
  script_name("CentOS Update for openslp CESA-2018:2240 centos7 ");
  script_tag(name:"summary", value:"Check the version of openslp");
  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present 
on the target host.");
  script_tag(name:"insight", value:"OpenSLP is an open source implementation 
of the Service Location Protocol (SLP) which is an Internet Engineering Task 
Force (IETF) standards track protocol and provides a framework to allow 
networking applications to discover the existence, location, and configuration 
of networked services in enterprise networks.

Security Fix(es):

* openslp: Heap memory corruption in slpd/slpd_process.c allows denial of
service or potentially code execution (CVE-2017-17833)

For more details about the security issue(s), including the impact, a CVSS
score, and other related information, refer to the CVE page(s) listed in
the References section.
");
  script_tag(name:"affected", value:"openslp on CentOS 7");
  script_tag(name:"solution", value:"Please install the updated packages.");

  script_xref(name:"CESA", value:"2018:2240");
  script_xref(name:"URL" , value:"http://lists.centos.org/pipermail/centos-announce/2018-July/022971.html");
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

  if ((res = isrpmvuln(pkg:"openslp", rpm:"openslp~2.0.0~7.el7_5", rls:"CentOS7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"openslp-devel", rpm:"openslp-devel~2.0.0~7.el7_5", rls:"CentOS7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"openslp-server", rpm:"openslp-server~2.0.0~7.el7_5", rls:"CentOS7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
