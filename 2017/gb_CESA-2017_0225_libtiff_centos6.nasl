###############################################################################
# OpenVAS Vulnerability Test
#
# CentOS Update for libtiff CESA-2017:0225 centos6 
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
  script_oid("1.3.6.1.4.1.25623.1.0.882648");
  script_version("$Revision: 6659 $");
  script_tag(name:"last_modification", value:"$Date: 2017-07-10 13:52:22 +0200 (Mon, 10 Jul 2017) $");
  script_tag(name:"creation_date", value:"2017-02-03 12:11:17 +0530 (Fri, 03 Feb 2017)");
  script_cve_id("CVE-2015-8870", "CVE-2016-5652", "CVE-2016-9533", "CVE-2016-9534", 
                "CVE-2016-9535", "CVE-2016-9536", "CVE-2016-9537", "CVE-2016-9540");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_tag(name:"qod_type", value:"package");
  script_name("CentOS Update for libtiff CESA-2017:0225 centos6 ");
  script_tag(name: "summary", value: "Check the version of libtiff");
  script_tag(name: "vuldetect", value: "Get the installed version with the help 
of detect NVT and check if the version is vulnerable or not.");
  script_tag(name: "insight", value: "The libtiff packages contain a library of 
functions for manipulating Tagged Image File Format (TIFF) files.

Security Fix(es):

* Multiple flaws have been discovered in libtiff. A remote attacker could
exploit these flaws to cause a crash or memory corruption and, possibly,
execute arbitrary code by tricking an application linked against libtiff
into processing specially crafted files. (CVE-2016-9533, CVE-2016-9534,
CVE-2016-9535)

* Multiple flaws have been discovered in various libtiff tools (tiff2pdf,
tiffcrop, tiffcp, bmp2tiff). By tricking a user into processing a specially
crafted file, a remote attacker could exploit these flaws to cause a crash
or memory corruption and, possibly, execute arbitrary code with the
privileges of the user running the libtiff tool. (CVE-2015-8870,
CVE-2016-5652, CVE-2016-9540, CVE-2016-9537, CVE-2016-9536)
");
  script_tag(name: "affected", value: "libtiff on CentOS 6");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");

  script_xref(name: "CESA", value: "2017:0225");
  script_xref(name: "URL" , value: "http://lists.centos.org/pipermail/centos-announce/2017-February/022259.html");
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

if(release == "CentOS6")
{

  if ((res = isrpmvuln(pkg:"libtiff", rpm:"libtiff~3.9.4~21.el6_8", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libtiff-devel", rpm:"libtiff-devel~3.9.4~21.el6_8", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libtiff-static", rpm:"libtiff-static~3.9.4~21.el6_8", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
