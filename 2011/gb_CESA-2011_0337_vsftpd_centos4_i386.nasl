###############################################################################
# OpenVAS Vulnerability Test
#
# CentOS Update for vsftpd CESA-2011:0337 centos4 i386
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (c) 2011 Greenbone Networks GmbH, http://www.greenbone.net
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
tag_insight = "vsftpd (Very Secure File Transfer Protocol (FTP) daemon) is a secure FTP
  server for Linux, UNIX, and similar operating systems.

  A flaw was discovered in the way vsftpd processed file name patterns. An
  FTP user could use this flaw to cause the vsftpd process to use an
  excessive amount of CPU time, when processing a request with a
  specially-crafted file name pattern. (CVE-2011-0762)
  
  All vsftpd users should upgrade to this updated package, which contains a
  backported patch to correct this issue. The vsftpd daemon must be restarted
  for this update to take effect.";
tag_solution = "Please Install the Updated Packages.";

tag_affected = "vsftpd on CentOS 4";


if(description)
{
  script_xref(name : "URL" , value : "http://lists.centos.org/pipermail/centos-announce/2011-March/017271.html");
  script_oid("1.3.6.1.4.1.25623.1.0.880479");
  script_version("$Revision: 9371 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-06 10:55:06 +0200 (Fri, 06 Apr 2018) $");
  script_tag(name:"creation_date", value:"2011-03-15 14:58:18 +0100 (Tue, 15 Mar 2011)");
  script_tag(name:"cvss_base", value:"4.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:S/C:N/I:N/A:P");
  script_xref(name: "CESA", value: "2011:0337");
  script_cve_id("CVE-2011-0762");
  script_name("CentOS Update for vsftpd CESA-2011:0337 centos4 i386");

  script_tag(name:"summary", value:"Check for the Version of vsftpd");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2011 Greenbone Networks GmbH");
  script_family("CentOS Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/centos", "ssh/login/rpms");
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "solution" , value : tag_solution);
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

if(release == "CentOS4")
{

  if ((res = isrpmvuln(pkg:"vsftpd", rpm:"vsftpd~2.0.1~9.el4", rls:"CentOS4")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
