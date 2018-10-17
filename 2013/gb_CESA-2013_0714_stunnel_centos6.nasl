###############################################################################
# OpenVAS Vulnerability Test
#
# CentOS Update for stunnel CESA-2013:0714 centos6
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
tag_insight = "stunnel is a socket wrapper which can provide SSL (Secure Sockets Layer)
  support to ordinary applications. For example, it can be used in
  conjunction with imapd to create an SSL-secure IMAP server.

  An integer conversion issue was found in stunnel when using Microsoft NT
  LAN Manager (NTLM) authentication with the HTTP CONNECT tunneling method.
  With this configuration, and using stunnel in SSL client mode on a 64-bit
  system, an attacker could possibly execute arbitrary code with the
  privileges of the stunnel process via a man-in-the-middle attack or by
  tricking a user into using a malicious proxy. (CVE-2013-1762)

  All stunnel users should upgrade to this updated package, which contains a
  backported patch to correct this issue.";


tag_affected = "stunnel on CentOS 6";
tag_solution = "Please Install the Updated Packages.";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.881712");
  script_version("$Revision: 9353 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-06 09:14:20 +0200 (Fri, 06 Apr 2018) $");
  script_tag(name:"creation_date", value:"2013-04-15 10:13:31 +0530 (Mon, 15 Apr 2013)");
  script_cve_id("CVE-2013-1762");
  script_tag(name:"cvss_base", value:"6.6");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:H/Au:N/C:P/I:P/A:C");
  script_name("CentOS Update for stunnel CESA-2013:0714 centos6 ");

  script_xref(name: "CESA", value: "2013:0714");
  script_xref(name: "URL" , value: "http://lists.centos.org/pipermail/centos-announce/2013-April/019681.html");
  script_tag(name: "summary" , value: "Check for the Version of stunnel");
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

if(release == "CentOS6")
{

  if ((res = isrpmvuln(pkg:"stunnel", rpm:"stunnel~4.29~3.el6_4", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
