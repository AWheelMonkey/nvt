###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_RHSA-2017_3111-01_liblouis.nasl 7730 2017-11-10 10:16:19Z santu $
#
# RedHat Update for liblouis RHSA-2017:3111-01
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
  script_oid("1.3.6.1.4.1.25623.1.0.812076");
  script_version("$Revision: 7730 $");
  script_tag(name:"last_modification", value:"$Date: 2017-11-10 11:16:19 +0100 (Fri, 10 Nov 2017) $");
  script_tag(name:"creation_date", value:"2017-11-04 09:05:51 +0100 (Sat, 04 Nov 2017)");
  script_cve_id("CVE-2014-8184", "CVE-2017-13738", "CVE-2017-13740", "CVE-2017-13741",
                "CVE-2017-13742", "CVE-2017-13743", "CVE-2017-13744");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"qod_type", value:"package");
  script_name("RedHat Update for liblouis RHSA-2017:3111-01");
  script_tag(name: "summary", value: "Check the version of liblouis");
  script_tag(name: "vuldetect", value: "Get the installed version with the help
  of detect NVT and check if the version is vulnerable or not.");
  script_tag(name: "insight", value: "Liblouis is an open source braille translator
  and back-translator named in honor of Louis Braille. It features support for
  computer and literary braille, supports contracted and uncontracted translation
  for many languages and has support for hyphenation. New languages can easily be
  added through tables that support a rule or dictionary based approach.
Liblouis also supports math braille (Nemeth and Marburg).

Security Fix(es):

* Multiple flaws were found in the processing of translation tables in
liblouis. An attacker could crash or potentially execute arbitrary code
using malicious translation tables. (CVE-2014-8184, CVE-2017-13738,
CVE-2017-13740, CVE-2017-13741, CVE-2017-13742, CVE-2017-13743,
CVE-2017-13744)

The CVE-2014-8184 issue was discovered by Raphael Sanchez Prudencio (Red
Hat).");
  script_tag(name: "affected", value: "liblouis on Red Hat Enterprise Linux Server (v. 7)");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");

  script_xref(name: "RHSA", value: "2017:3111-01");
  script_xref(name: "URL" , value: "https://www.redhat.com/archives/rhsa-announce/2017-November/msg00001.html");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("Red Hat Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/rhel", "ssh/login/rpms");
  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-rpm.inc");

release = get_kb_item("ssh/login/release");

res = "";
if(release == NULL){
  exit(0);
}

if(release == "RHENT_7")
{

  if ((res = isrpmvuln(pkg:"liblouis-python", rpm:"liblouis-python~2.5.2~11.el7_4", rls:"RHENT_7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"liblouis", rpm:"liblouis~2.5.2~11.el7_4", rls:"RHENT_7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"liblouis-debuginfo", rpm:"liblouis-debuginfo~2.5.2~11.el7_4", rls:"RHENT_7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
