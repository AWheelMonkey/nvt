###############################################################################
# OpenVAS Vulnerability Test
#
# CentOS Update for curl CESA-2013:0983 centos5
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (c) 2013 Greenbone Networks GmbH, http://www.greenbone.net
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
tag_insight = "cURL provides the libcurl library and a command line tool for downloading
  files from servers using various protocols, including HTTP, FTP, and LDAP.

  A heap-based buffer overflow flaw was found in the way libcurl unescaped
  URLs. A remote attacker could provide a specially-crafted URL that, when
  processed by an application using libcurl that handles untrusted URLs,
  would possibly cause it to crash or, potentially, execute arbitrary code.
  (CVE-2013-2174)

  Red Hat would like to thank the cURL project for reporting this issue.
  Upstream acknowledges Timo Sirainen as the original reporter.

  Users of curl should upgrade to these updated packages, which contain a
  backported patch to correct this issue. All running applications using
  libcurl must be restarted for the update to take effect.";


tag_affected = "curl on CentOS 5";
tag_solution = "Please Install the Updated Packages.";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.881754");
  script_version("$Revision: 9372 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-06 10:56:37 +0200 (Fri, 06 Apr 2018) $");
  script_tag(name:"creation_date", value:"2013-06-27 09:58:15 +0530 (Thu, 27 Jun 2013)");
  script_cve_id("CVE-2013-2174");
  script_tag(name:"cvss_base", value:"6.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
  script_name("CentOS Update for curl CESA-2013:0983 centos5 ");

  script_xref(name: "CESA", value: "2013:0983");
  script_xref(name: "URL" , value: "http://lists.centos.org/pipermail/centos-announce/2013-June/019815.html");
  script_tag(name:"summary", value:"Check for the Version of curl");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2013 Greenbone Networks GmbH");
  script_family("CentOS Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/centos", "ssh/login/rpms");
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");
  exit(0);
}


include("pkg-lib-rpm.inc");

release = get_kb_item("ssh/login/release");

res = "";
if(release == NULL){
  exit(0);
}

if(release == "CentOS5")
{

  if ((res = isrpmvuln(pkg:"curl", rpm:"curl~7.15.5~17.el5_9", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"curl-devel", rpm:"curl-devel~7.15.5~17.el5_9", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
