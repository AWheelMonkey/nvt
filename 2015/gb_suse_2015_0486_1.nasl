###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_suse_2015_0486_1.nasl 8046 2017-12-08 08:48:56Z santu $
#
# SuSE Update for osc openSUSE-SU-2015:0486-1 (osc)
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
  script_oid("1.3.6.1.4.1.25623.1.0.850642");
  script_version("$Revision: 8046 $");
  script_tag(name:"last_modification", value:"$Date: 2017-12-08 09:48:56 +0100 (Fri, 08 Dec 2017) $");
  script_tag(name:"creation_date", value:"2015-03-13 05:12:04 +0100 (Fri, 13 Mar 2015)");
  script_cve_id("CVE-2015-0778");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_tag(name:"qod_type", value:"package");
  script_name("SuSE Update for osc openSUSE-SU-2015:0486-1 (osc)");
  script_tag(name: "summary", value: "Check the version of osc");
  script_tag(name: "vuldetect", value: "Get the installed version with the help of detect NVT and check if the version is vulnerable or not.");
  script_tag(name: "insight", value: "
  osc was updated to fix a security issue and some non-security bugs.

  osc was updated to 0.151.0, fixing the following vulnerability:
  * fixed shell command injection via crafted _service files CVE-2015-0778
  boo#901643

  The following non-security bugs were fixed:
  * fix times when data comes from OBS backend
  * support updateing the link in target package for submit requests
  * various minor bugfixes");
  script_tag(name: "affected", value: "osc on openSUSE 13.1");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");
  script_xref(name: "openSUSE-SU", value: "2015:0486_1");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2015 Greenbone Networks GmbH");
  script_family("SuSE Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/suse", "ssh/login/rpms");
  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-rpm.inc");

release = get_kb_item("ssh/login/release");

res = "";
if(release == NULL){
  exit(0);
}

if(release == "openSUSE13.1")
{

  if ((res = isrpmvuln(pkg:"osc", rpm:"osc~0.151.0~2.24.1", rls:"openSUSE13.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}