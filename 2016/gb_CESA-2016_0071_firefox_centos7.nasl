###############################################################################
# OpenVAS Vulnerability Test
#
# CentOS Update for firefox CESA-2016:0071 centos7
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (C) 2016 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.882384");
  script_version("$Revision: 6658 $");
  script_tag(name:"last_modification", value:"$Date: 2017-07-10 13:51:48 +0200 (Mon, 10 Jul 2017) $");
  script_tag(name:"creation_date", value:"2016-01-28 06:32:52 +0100 (Thu, 28 Jan 2016)");
  script_cve_id("CVE-2016-1930", "CVE-2016-1935");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"qod_type", value:"package");
  script_name("CentOS Update for firefox CESA-2016:0071 centos7 ");
  script_tag(name: "summary", value: "Check the version of firefox");
  script_tag(name: "vuldetect", value: "Get the installed version with the help
of detect NVT and check if the version is vulnerable or not.");
  script_tag(name: "insight", value: "Mozilla Firefox is an open source web
browser. XULRunner provides the XUL Runtime environment for Mozilla Firefox.

Several flaws were found in the processing of malformed web content. A web
page containing malicious content could cause Firefox to crash or,
potentially, execute arbitrary code with the privileges of the user running
Firefox. (CVE-2016-1930, CVE-2016-1935)

Red Hat would like to thank the Mozilla project for reporting these issues.
Upstream acknowledges Bob Clary, Christian Holler, Nils Ohlmeier, Gary
Kwong, Jesse Ruderman, Carsten Book, Randell Jesup, and Aki Helin as the
original reporters of these issues.

All Firefox users should upgrade to these updated packages, which contain
Firefox version 38.6.0 ESR, which corrects these issues. After installing
the update, Firefox must be restarted for the changes to take effect.
");
  script_tag(name: "affected", value: "firefox on CentOS 7");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");

  script_xref(name: "CESA", value: "2016:0071");
  script_xref(name: "URL" , value: "http://lists.centos.org/pipermail/centos-announce/2016-January/021631.html");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
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

  if ((res = isrpmvuln(pkg:"firefox", rpm:"firefox~38.6.0~1.el7.centos", rls:"CentOS7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
