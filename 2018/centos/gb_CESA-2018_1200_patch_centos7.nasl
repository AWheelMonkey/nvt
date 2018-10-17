###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_CESA-2018_1200_patch_centos7.nasl 10086 2018-06-06 04:57:58Z ckuersteiner $
#
# CentOS Update for patch CESA-2018:1200 centos7 
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
  script_oid("1.3.6.1.4.1.25623.1.0.882907");
  script_version("$Revision: 10086 $");
  script_tag(name:"last_modification", value:"$Date: 2018-06-06 06:57:58 +0200 (Wed, 06 Jun 2018) $");
  script_tag(name:"creation_date", value:"2018-06-05 14:03:26 +0530 (Tue, 05 Jun 2018)");
  script_cve_id("CVE-2018-1000156");
  script_tag(name:"cvss_base", value:"6.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
  script_tag(name:"qod_type", value:"package");
  script_name("CentOS Update for patch CESA-2018:1200 centos7 ");
  script_tag(name:"summary", value:"Check the version of patch");
  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");
  script_tag(name:"insight", value:"The patch program applies diff files to originals. The diff command is used
to compare an original to a changed file. Diff lists the changes made to
the file. A person who has the original file can then use the patch command
with the diff file to add the changes to their original file (patching the
file).

Patch should be installed because it is a common way of upgrading
applications.

Security Fix(es):

* patch: Malicious patch files cause ed to execute arbitrary commands
(CVE-2018-1000156)

For more details about the security issue(s), including the impact, a CVSS
score, and other related information, refer to the CVE page(s) listed in
the References section.
");
  script_tag(name:"affected", value:"patch on CentOS 7");
  script_tag(name:"solution", value:"Please install the updated packages.");

  script_xref(name:"CESA", value:"2018:1200");
  script_xref(name:"URL" , value:"http://lists.centos.org/pipermail/centos-announce/2018-May/022892.html");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
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

  if ((res = isrpmvuln(pkg:"patch", rpm:"patch~2.7.1~10.el7_5", rls:"CentOS7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
