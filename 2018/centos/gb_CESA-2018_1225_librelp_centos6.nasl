###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_CESA-2018_1225_librelp_centos6.nasl 9807 2018-05-11 17:48:42Z cfischer $
#
# CentOS Update for librelp CESA-2018:1225 centos6 
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
  script_oid("1.3.6.1.4.1.25623.1.0.882869");
  script_version("$Revision: 9807 $");
  script_tag(name:"last_modification", value:"$Date: 2018-05-11 19:48:42 +0200 (Fri, 11 May 2018) $");
  script_tag(name:"creation_date", value:"2018-05-03 05:29:28 +0200 (Thu, 03 May 2018)");
  script_cve_id("CVE-2018-1000140");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_tag(name:"qod_type", value:"package");
  script_name("CentOS Update for librelp CESA-2018:1225 centos6 ");
  script_tag(name:"summary", value:"Check the version of librelp");
  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");
  script_tag(name:"insight", value:"Librelp is an easy-to-use library for the
  Reliable Event Logging Protocol (RELP) protocol. RELP is a general-purpose,
  extensible logging protocol.

Security Fix(es):

* librelp: Stack-based buffer overflow in relpTcpChkPeerName function in
src/tcp.c (CVE-2018-1000140)

For more details about the security issue(s), including the impact, a CVSS
score, and other related information, refer to the CVE page(s) listed in
the References section.

Red Hat would like to thank Rainer Gerhards (rsyslog) for reporting this
issue. Upstream acknowledges Bas van Schaik (lgtm.com / Semmle) and Kevin
Backhouse (lgtm.com / Semmle) as the original reporters.
");
  script_tag(name:"affected", value:"librelp on CentOS 6");
  script_tag(name:"solution", value:"Please install the updated packages.");

  script_xref(name:"CESA", value:"2018:1225");
  script_xref(name:"URL" , value:"http://lists.centos.org/pipermail/centos-announce/2018-May/022818.html");
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

if(release == "CentOS6")
{

  if ((res = isrpmvuln(pkg:"librelp", rpm:"librelp~1.2.7~3.el6_9.1", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"librelp-devel", rpm:"librelp-devel~1.2.7~3.el6_9.1", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
