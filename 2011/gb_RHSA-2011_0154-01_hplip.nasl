###############################################################################
# OpenVAS Vulnerability Test
#
# RedHat Update for hplip RHSA-2011:0154-01
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (c) 2011 Greenbone Networks GmbH, http://www.greenbone.net
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

tag_insight = "Hewlett-Packard Linux Imaging and Printing (HPLIP) provides drivers for
  Hewlett-Packard printers and multifunction peripherals, and tools for
  installing, using, and configuring them.

  A flaw was found in the way certain HPLIP tools discovered devices using
  the SNMP protocol. If a user ran certain HPLIP tools that search for
  supported devices using SNMP, and a malicious user is able to send
  specially-crafted SNMP responses, it could cause those HPLIP tools to crash
  or, possibly, execute arbitrary code with the privileges of the user
  running them. (CVE-2010-4267)
  
  Red Hat would like to thank Sebastian Krahmer of the SuSE Security Team for
  reporting this issue.
  
  Users of hplip should upgrade to these updated packages, which contain a
  backported patch to correct this issue.";

tag_affected = "hplip on Red Hat Enterprise Linux (v. 5 server)";
tag_solution = "Please Install the Updated Packages.";


if(description)
{
  script_xref(name : "URL" , value : "https://www.redhat.com/archives/rhsa-announce/2011-January/msg00014.html");
  script_oid("1.3.6.1.4.1.25623.1.0.870383");
  script_version("$Revision: 12370 $");
  script_tag(name:"last_modification", value:"$Date: 2018-11-16 08:56:29 +0100 (Fri, 16 Nov 2018) $");
  script_tag(name:"creation_date", value:"2011-01-21 14:59:01 +0100 (Fri, 21 Jan 2011)");
  script_xref(name: "RHSA", value: "2011:0154-01");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_cve_id("CVE-2010-4267");
  script_name("RedHat Update for hplip RHSA-2011:0154-01");

  script_tag(name:"summary", value:"Check for the Version of hplip");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2011 Greenbone Networks GmbH");
  script_family("Red Hat Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/rhel", "ssh/login/rpms", re:"ssh/login/release=RHENT_5");
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-rpm.inc");

release = rpm_get_ssh_release();
if(!release) exit(0);

res = "";

if(release == "RHENT_5")
{

  if ((res = isrpmvuln(pkg:"hpijs", rpm:"hpijs~1.6.7~6.el5_6.1", rls:"RHENT_5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"hplip", rpm:"hplip~1.6.7~6.el5_6.1", rls:"RHENT_5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"hplip-debuginfo", rpm:"hplip-debuginfo~1.6.7~6.el5_6.1", rls:"RHENT_5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libsane-hpaio", rpm:"libsane-hpaio~1.6.7~6.el5_6.1", rls:"RHENT_5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
