###############################################################################
# OpenVAS Vulnerability Test
#
# CentOS Update for squid CESA-2014:0597 centos6
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (C) 2014 Greenbone Networks GmbH, http://www.greenbone.net
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

include("revisions-lib.inc");

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.881945");
  script_version("$Revision: 9373 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-06 10:57:18 +0200 (Fri, 06 Apr 2018) $");
  script_tag(name:"creation_date", value:"2014-06-09 12:31:54 +0530 (Mon, 09 Jun 2014)");
  script_cve_id("CVE-2014-0128");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:P");
  script_name("CentOS Update for squid CESA-2014:0597 centos6 ");

  tag_insight = "Squid is a high-performance proxy caching server for web
clients, supporting FTP, Gopher, and HTTP data objects.

A denial of service flaw was found in the way Squid processed certain HTTPS
requests when the SSL Bump feature was enabled. A remote attacker could
send specially crafted requests that could cause Squid to crash.
(CVE-2014-0128)

Red Hat would like to thank the Squid project for reporting this issue.
Upstream acknowledges Mathias Fischer and Fabian Hugelshofer from Open
Systems AG as the original reporters.

All squid users are advised to upgrade to these updated packages, which
contain a backported patch to correct this issue. After installing this
update, the squid service will be restarted automatically.
";

  tag_affected = "squid on CentOS 6";

  tag_solution = "Please Install the Updated Packages.";


  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");
  script_xref(name: "CESA", value: "2014:0597");
  script_xref(name: "URL" , value: "http://lists.centos.org/pipermail/centos-announce/2014-June/020340.html");
  script_tag(name:"summary", value:"Check for the Version of squid");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2014 Greenbone Networks GmbH");
  script_family("CentOS Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/centos", "ssh/login/rpms");
  exit(0);
}


include("pkg-lib-rpm.inc");

release = get_kb_item("ssh/login/release");

res = "";
if(release == NULL){
  exit(0);
}

if(release == "CentOS6")
{

  if ((res = isrpmvuln(pkg:"squid", rpm:"squid~3.1.10~20.el6_5.3", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
