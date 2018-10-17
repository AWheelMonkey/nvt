###############################################################################
# OpenVAS Vulnerability Test
#
# CentOS Update for pcs CESA-2015:1700 centos6 
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
  script_oid("1.3.6.1.4.1.25623.1.0.882265");
  script_version("$Revision: 6657 $");
  script_tag(name:"cvss_base", value:"8.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:S/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2017-07-10 13:50:44 +0200 (Mon, 10 Jul 2017) $");
  script_tag(name:"creation_date", value:"2015-09-02 06:59:00 +0200 (Wed, 02 Sep 2015)");
  script_cve_id("CVE-2015-5189", "CVE-2015-5190");
  script_tag(name:"qod_type", value:"package");
  script_name("CentOS Update for pcs CESA-2015:1700 centos6 ");
  script_tag(name: "summary", value: "Check the version of pcs");
  script_tag(name: "vuldetect", value: "Get the installed version with the help of detect NVT and check if the version is vulnerable or not.");
  script_tag(name: "insight", value: "The pcs packages provide a command-line configuration system for the
Pacemaker and Corosync utilities.

A command injection flaw was found in the pcsd web UI. An attacker able to
trick a victim that was logged in to the pcsd web UI into visiting a
specially crafted URL could use this flaw to execute arbitrary code with
root privileges on the server hosting the web UI. (CVE-2015-5190)

A race condition was found in the way the pcsd web UI backend performed
authorization of user requests. An attacker could use this flaw to send a
request that would be evaluated as originating from a different user,
potentially allowing the attacker to perform actions with permissions of a
more privileged user. (CVE-2015-5189)

These issues were discovered by Tom Jelnek of Red Hat.

All pcs users are advised to upgrade to these updated packages, which
contain backported patches to correct these issues.
");
  script_tag(name: "affected", value: "pcs on CentOS 6");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");
  script_xref(name: "CESA", value: "2015:1700");
  script_xref(name: "URL" , value: "http://lists.centos.org/pipermail/centos-announce/2015-September/021356.html");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2015 Greenbone Networks GmbH");
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

  if ((res = isrpmvuln(pkg:"pcs", rpm:"pcs~0.9.139~9.el6_7.1", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
