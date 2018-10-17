###############################################################################
# OpenVAS Vulnerability Test
#
# CentOS Update for libssh2 CESA-2016:0428 centos7 
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
  script_oid("1.3.6.1.4.1.25623.1.0.882419");
  script_version("$Revision: 6658 $");
  script_tag(name:"last_modification", value:"$Date: 2017-07-10 13:51:48 +0200 (Mon, 10 Jul 2017) $");
  script_tag(name:"creation_date", value:"2016-03-11 06:01:56 +0100 (Fri, 11 Mar 2016)");
  script_cve_id("CVE-2016-0787");
  script_tag(name:"cvss_base", value:"4.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:N/A:N");
  script_tag(name:"qod_type", value:"package");
  script_name("CentOS Update for libssh2 CESA-2016:0428 centos7 ");
  script_tag(name: "summary", value: "Check the version of libssh2");
  script_tag(name: "vuldetect", value: "Get the installed version with the help 
of detect NVT and check if the version is vulnerable or not.");
  script_tag(name: "insight", value: "The libssh2 packages provide a library 
that implements the SSHv2 protocol.

A type confusion issue was found in the way libssh2 generated ephemeral
secrets for the diffie-hellman-group1 and diffie-hellman-group14 key
exchange methods. This would cause an SSHv2 Diffie-Hellman handshake to use
significantly less secure random parameters. (CVE-2016-0787)

Red Hat would like to thank Aris Adamantiadis for reporting this issue.

All libssh2 users are advised to upgrade to these updated packages, which
contain a backported patch to correct this issue. After installing these
updated packages, all running applications using libssh2 must be restarted
for this update to take effect.
");
  script_tag(name: "affected", value: "libssh2 on CentOS 7");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");

  script_xref(name: "CESA", value: "2016:0428");
  script_xref(name: "URL" , value: "http://lists.centos.org/pipermail/centos-announce/2016-March/021727.html");
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

  if ((res = isrpmvuln(pkg:"libssh2", rpm:"libssh2~1.4.3~10.el7_2.1", rls:"CentOS7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libssh2-devel", rpm:"libssh2-devel~1.4.3~10.el7_2.1", rls:"CentOS7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libssh2-docs", rpm:"libssh2-docs~1.4.3~10.el7_2.1", rls:"CentOS7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
