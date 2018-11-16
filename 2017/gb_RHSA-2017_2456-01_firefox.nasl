###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_RHSA-2017_2456-01_firefox.nasl 12370 2018-11-16 07:56:29Z cfischer $
#
# RedHat Update for firefox RHSA-2017:2456-01
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
  script_oid("1.3.6.1.4.1.25623.1.0.871880");
  script_version("$Revision: 12370 $");
  script_tag(name:"last_modification", value:"$Date: 2018-11-16 08:56:29 +0100 (Fri, 16 Nov 2018) $");
  script_tag(name:"creation_date", value:"2017-08-11 07:21:28 +0200 (Fri, 11 Aug 2017)");
  script_cve_id("CVE-2017-7753", "CVE-2017-7779", "CVE-2017-7784", "CVE-2017-7785", 
                "CVE-2017-7786", "CVE-2017-7787", "CVE-2017-7791", "CVE-2017-7792",
                "CVE-2017-7798", "CVE-2017-7800", "CVE-2017-7801", "CVE-2017-7802",
                "CVE-2017-7803", "CVE-2017-7807", "CVE-2017-7809"); 
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"qod_type", value:"package");
  script_name("RedHat Update for firefox RHSA-2017:2456-01");
  script_tag(name: "summary", value: "Check the version of firefox");
  script_tag(name: "vuldetect", value: "Get the installed version with the help of 
  detect NVT and check if the version is vulnerable or not."); 
  script_tag(name: "insight", value: "Mozilla Firefox is an open source web 
  browser. This update upgrades Firefox to version 52.3.0 ESR. Security Fix(es): * 
  Multiple flaws were found in the processing of malformed web content. A web page 
  containing malicious content could cause Firefox to crash or, potentially, 
  execute arbitrary code with the privileges of the user running Firefox. 
  (CVE-2017-7779, CVE-2017-7798, CVE-2017-7800, CVE-2017-7801, CVE-2017-7753, 
  CVE-2017-7784, CVE-2017-7785, CVE-2017-7786, CVE-2017-7787, CVE-2017-7792, 
  CVE-2017-7802, CVE-2017-7807, CVE-2017-7809, CVE-2017-7791, CVE-2017-7803) Red 
  Hat would like to thank the Mozilla project for reporting these issues. Upstream 
  acknowledges Mozilla developers and community, Frederik Braun, Looben Yang, 
  Nils, SkyLined, Oliver Wagner, Fraser Tweedale, Mathias Karlsson, Jose Mara 
  Acua, and Rhys Enniks as the original reporters. "); 
  script_tag(name: "affected", value: "firefox on
  Red Hat Enterprise Linux Desktop (v. 6),
  Red Hat Enterprise Linux Server (v. 6),
  Red Hat Enterprise Linux Server (v. 7),
  Red Hat Enterprise Linux Workstation (v. 6)");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");

  script_xref(name: "RHSA", value: "2017:2456-01");
  script_xref(name: "URL" , value: "https://www.redhat.com/archives/rhsa-announce/2017-August/msg00055.html");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("Red Hat Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/rhel", "ssh/login/rpms", re:"ssh/login/release=RHENT_(7|6)");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-rpm.inc");

release = rpm_get_ssh_release();
if(!release) exit(0);

res = "";

if(release == "RHENT_7")
{

  if ((res = isrpmvuln(pkg:"firefox", rpm:"firefox~52.3.0~2.el7_4", rls:"RHENT_7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"firefox-debuginfo", rpm:"firefox-debuginfo~52.3.0~2.el7_4", rls:"RHENT_7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}


if(release == "RHENT_6")
{

  if ((res = isrpmvuln(pkg:"firefox", rpm:"firefox~52.3.0~3.el6_9", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"firefox-debuginfo", rpm:"firefox-debuginfo~52.3.0~3.el6_9", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
