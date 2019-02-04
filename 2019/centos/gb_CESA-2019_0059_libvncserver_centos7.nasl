###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_CESA-2019_0059_libvncserver_centos7.nasl 13316 2019-01-28 07:41:51Z asteins $
#
# CentOS Update for libvncserver CESA-2019:0059 centos7
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (C) 2019 Greenbone Networks GmbH, http://www.greenbone.net
# Text descriptions are largely excerpted from the referenced
# advisory, and are Copyright (c) the respective author(s)
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
  script_oid("1.3.6.1.4.1.25623.1.0.882993");
  script_version("$Revision: 13316 $");
  script_cve_id("CVE-2018-15127");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_tag(name:"last_modification", value:"$Date: 2019-01-28 08:41:51 +0100 (Mon, 28 Jan 2019) $");
  script_tag(name:"creation_date", value:"2019-01-17 04:00:43 +0100 (Thu, 17 Jan 2019)");
  script_name("CentOS Update for libvncserver CESA-2019:0059 centos7 ");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2019 Greenbone Networks GmbH");
  script_family("CentOS Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/centos", "ssh/login/rpms");

  script_xref(name:"CESA", value:"2019:0059");
  script_xref(name:"URL", value:"http://lists.centos.org/pipermail/centos-announce/2019-January/023144.html");

  script_tag(name:"summary", value:"The remote host is missing an update for the 'libvncserver'
  package(s) announced via the CESA-2019:0059 advisory.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable package version is present on the target host.");

  script_tag(name:"insight", value:"LibVNCServer is a C library that enables you to implement VNC server
functionality into own programs.

Security Fix(es):

* libvncserver: Heap out-of-bounds write in rfbserver.c in
rfbProcessFileTransferReadBuffer() allows for potential code execution
(CVE-2018-15127)

For more details about the security issue(s), including the impact, a CVSS
score, and other related information, refer to the CVE page(s) listed in
the References section.
");

  script_tag(name:"affected", value:"libvncserver on CentOS 7.");

  script_tag(name:"solution", value:"Please install the updated package(s).");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"package");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-rpm.inc");

release = rpm_get_ssh_release();
if(!release) exit(0);

res = "";

if(release == "CentOS7")
{

  if ((res = isrpmvuln(pkg:"libvncserver", rpm:"libvncserver~0.9.9~13.el7_6", rls:"CentOS7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libvncserver-devel", rpm:"libvncserver-devel~0.9.9~13.el7_6", rls:"CentOS7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
