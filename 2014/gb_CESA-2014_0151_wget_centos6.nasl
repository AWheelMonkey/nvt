###############################################################################
# OpenVAS Vulnerability Test
#
# CentOS Update for wget CESA-2014:0151 centos6 
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
  script_oid("1.3.6.1.4.1.25623.1.0.881878");
  script_version("$Revision: 9373 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-06 10:57:18 +0200 (Fri, 06 Apr 2018) $");
  script_tag(name:"creation_date", value:"2014-02-13 11:41:37 +0530 (Thu, 13 Feb 2014)");
  script_cve_id("CVE-2010-2252");
  script_tag(name:"cvss_base", value:"6.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
  script_name("CentOS Update for wget CESA-2014:0151 centos6 ");

  tag_insight = "The wget package provides the GNU Wget file retrieval utility for HTTP,
HTTPS, and FTP protocols. Wget provides various useful features, such as
the ability to work in the background while the user is logged out,
recursive retrieval of directories, file name wildcard matching or updating
files in dependency on file timestamp comparison.

It was discovered that wget used a file name provided by the server when
saving a downloaded file. This could cause wget to create a file with a
different name than expected, possibly allowing the server to execute
arbitrary code on the client. (CVE-2010-2252)

Note: With this update, wget always uses the last component of the original
URL as the name for the downloaded file. Previous behavior of using the
server provided name or the last component of the redirected URL when
creating files can be re-enabled by using the '--trust-server-names'
command line option, or by setting 'trust_server_names=on' in the wget
start-up file.

This update also fixes the following bugs:

* Prior to this update, the wget package did not recognize HTTPS SSL
certificates with alternative names (subjectAltName) specified in the
certificate as valid. As a consequence, running the wget command failed
with a certificate error. This update fixes wget to recognize such
certificates as valid. (BZ#1060113)

All users of wget are advised to upgrade to this updated package, which
contain backported patches to correct these issues.
";

  tag_affected = "wget on CentOS 6";

  tag_solution = "Please Install the Updated Packages.";


  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");
  script_xref(name: "CESA", value: "2014:0151");
  script_xref(name: "URL" , value: "http://lists.centos.org/pipermail/centos-announce/2014-February/020145.html");
  script_tag(name:"summary", value:"Check for the Version of wget");
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

  if ((res = isrpmvuln(pkg:"wget", rpm:"wget~1.12~1.11.el6_5", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}