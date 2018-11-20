###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_fedora_2018_9a4d7ec61e_glusterfs_fc27.nasl 12408 2018-11-19 09:34:54Z asteins $
#
# Fedora Update for glusterfs FEDORA-2018-9a4d7ec61e
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
  script_oid("1.3.6.1.4.1.25623.1.0.875121");
  script_version("$Revision: 12408 $");
  script_tag(name:"last_modification", value:"$Date: 2018-11-19 10:34:54 +0100 (Mon, 19 Nov 2018) $");
  script_tag(name:"creation_date", value:"2018-10-03 17:02:10 +0530 (Wed, 03 Oct 2018)");
  script_cve_id("CVE-2018-10904", "CVE-2018-10907", "CVE-2018-10911", "CVE-2018-10913",
                "CVE-2018-10914", "CVE-2018-10923", "CVE-2018-10926", "CVE-2018-10927",
                "CVE-2018-10928", "CVE-2018-10929", "CVE-2018-10930");
  script_tag(name:"cvss_base", value:"6.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:S/C:P/I:P/A:P");
  script_tag(name:"qod_type", value:"package");
  script_name("Fedora Update for glusterfs FEDORA-2018-9a4d7ec61e");
  script_tag(name:"summary", value:"Check the version of glusterfs");
  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present
  on the target host.");
  script_tag(name:"insight", value:"GlusterFS is a distributed file-system capable
  of scaling to several petabytes. It aggregates various storage bricks over
  Infiniband RDMA or TCP/IP interconnect into one large parallel network file
  system. GlusterFS is one of the most sophisticated file systems in terms of
  features and extensibility.  It borrows a powerful concept called Translators
  from GNU Hurd kernel. Much of the code in GlusterFS is in user space and easily
  manageable.

This package includes the glusterfs binary, the glusterfsd daemon and the
libglusterfs and glusterfs translator modules common to both GlusterFS server
and client framework.
");
  script_tag(name:"affected", value:"glusterfs on Fedora 27");
  script_tag(name:"solution", value:"Please install the updated packages.");

  script_xref(name:"FEDORA", value:"2018-9a4d7ec61e");
  script_xref(name:"URL" , value:"https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/7GBEZYJ34Y33Y5HQ3FZWECH6NWTE446V");
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

if(release == "FC27")
{

  if ((res = isrpmvuln(pkg:"glusterfs", rpm:"glusterfs~3.12.14~1.fc27", rls:"FC27")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
