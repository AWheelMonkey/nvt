###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_suse_2014_0548_1.nasl 12284 2018-11-09 12:37:21Z cfischer $
#
# SuSE Update for jakarta-commons-fileupload SUSE-SU-2014:0548-1 (jakarta-commons-fileupload)
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (C) 2015 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.850747");
  script_version("$Revision: 12284 $");
  script_tag(name:"last_modification", value:"$Date: 2018-11-09 13:37:21 +0100 (Fri, 09 Nov 2018) $");
  script_tag(name:"creation_date", value:"2015-10-13 18:35:00 +0530 (Tue, 13 Oct 2015)");
  script_cve_id("CVE-2014-0050");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_tag(name:"qod_type", value:"package");
  script_name("SuSE Update for jakarta-commons-fileupload SUSE-SU-2014:0548-1 (jakarta-commons-fileupload)");
  script_tag(name:"summary", value:"Check the version of jakarta-commons-fileupload");
  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");
  script_tag(name:"insight", value:"This update fixes a security issue with
  jakarta-commons-fileupload:

  * bnc#862781: denial of service due to too-small buffer
  size used (CVE-2014-0050)

  Security Issue reference:

  * CVE-2014-0050");
  script_tag(name:"affected", value:"jakarta-commons-fileupload on SUSE Linux Enterprise Server 11 SP3");
  script_tag(name:"solution", value:"Please install the updated packages.");
  script_xref(name:"SUSE-SU", value:"2014:0548_1");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2015 Greenbone Networks GmbH");
  script_family("SuSE Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/suse", "ssh/login/rpms", re:"ssh/login/release=SLES11\.0SP3");
  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-rpm.inc");

release = rpm_get_ssh_release();
if(!release) exit(0);
res = "";

if(release == "SLES11.0SP3")
{

  if ((res = isrpmvuln(pkg:"jakarta-commons-fileupload", rpm:"jakarta-commons-fileupload~1.1.1~1.37.1", rls:"SLES11.0SP3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"jakarta-commons-fileupload-javadoc", rpm:"jakarta-commons-fileupload-javadoc~1.1.1~1.37.1", rls:"SLES11.0SP3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
