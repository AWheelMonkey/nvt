###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_fedora_2018_f9e0f1caf7_glusterfs_fc26.nasl 9974 2018-05-28 03:25:02Z ckuersteiner $
#
# Fedora Update for glusterfs FEDORA-2018-f9e0f1caf7
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
  script_oid("1.3.6.1.4.1.25623.1.0.874434");
  script_version("$Revision: 9974 $");
  script_tag(name:"last_modification", value:"$Date: 2018-05-28 05:25:02 +0200 (Mon, 28 May 2018) $");
  script_tag(name:"creation_date", value:"2018-05-13 05:45:03 +0200 (Sun, 13 May 2018)");
  script_cve_id("CVE-2018-1088");
  script_tag(name:"cvss_base", value:"6.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
  script_tag(name:"qod_type", value:"package");
  script_name("Fedora Update for glusterfs FEDORA-2018-f9e0f1caf7");
  script_tag(name:"summary", value:"Check the version of glusterfs");
  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present 
on the target host.");
  script_tag(name:"insight", value:"GlusterFS is a distributed file-system 
capable of scaling to several petabytes. It aggregates various storage bricks 
over Infiniband RDMA or TCP/IP interconnect into one large parallel network file
system. GlusterFS is one of the most sophisticated file systems in terms of 
features and extensibility.  It borrows a powerful concept called Translators 
from GNU Hurd kernel. Much of the code in GlusterFS is in user space and easily 
manageable.

This package includes the glusterfs binary, the glusterfsd daemon and the
libglusterfs and glusterfs translator modules common to both GlusterFS server
and client framework.
");
  script_tag(name:"affected", value:"glusterfs on Fedora 26");
  script_tag(name:"solution", value:"Please install the updated packages.");

  script_xref(name:"FEDORA", value:"2018-f9e0f1caf7");
  script_xref(name:"URL" , value:"https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/NSUXP7GIHXVAH7YVAMMXDMS7RK5FJWMY");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
  script_family("Fedora Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/fedora", "ssh/login/rpms");
  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-rpm.inc");

release = get_kb_item("ssh/login/release");

res = "";
if(release == NULL){
  exit(0);
}

if(release == "FC26")
{

  if ((res = isrpmvuln(pkg:"glusterfs", rpm:"glusterfs~3.10.12~1.fc26", rls:"FC26")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
