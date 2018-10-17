###############################################################################
# OpenVAS Vulnerability Test
#
# CentOS Update for libtirpc CESA-2017:1263 centos7 
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (C) 2017 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.882717");
  script_version("$Revision: 6659 $");
  script_tag(name:"last_modification", value:"$Date: 2017-07-10 13:52:22 +0200 (Mon, 10 Jul 2017) $");
  script_tag(name:"creation_date", value:"2017-05-23 07:03:08 +0200 (Tue, 23 May 2017)");
  script_cve_id("CVE-2017-8779");
  script_tag(name:"cvss_base", value:"7.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:C");
  script_tag(name:"qod_type", value:"package");
  script_name("CentOS Update for libtirpc CESA-2017:1263 centos7 ");
  script_tag(name: "summary", value: "Check the version of libtirpc");
  script_tag(name: "vuldetect", value: "Get the installed version with the help 
of detect NVT and check if the version is vulnerable or not.");
  script_tag(name: "insight", value: "The libtirpc packages contain SunLib's 
implementation of transport-independent remote procedure call (TI-RPC) 
documentation, which includes a library required by programs in the 
nfs-utils and rpcbind packages.

Security Fix(es):

* It was found that due to the way rpcbind uses libtirpc (libntirpc), a
memory leak can occur when parsing specially crafted XDR messages. An
attacker sending thousands of messages to rpcbind could cause its memory
usage to grow without bound, eventually causing it to be terminated by the
OOM killer. (CVE-2017-8779)
");
  script_tag(name: "affected", value: "libtirpc on CentOS 7");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");

  script_xref(name: "CESA", value: "2017:1263");
  script_xref(name: "URL" , value: "http://lists.centos.org/pipermail/centos-announce/2017-May/022415.html");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
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

  if ((res = isrpmvuln(pkg:"libtirpc", rpm:"libtirpc~0.2.4~0.8.el7_3", rls:"CentOS7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libtirpc-devel", rpm:"libtirpc-devel~0.2.4~0.8.el7_3", rls:"CentOS7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
