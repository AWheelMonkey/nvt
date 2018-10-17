###############################################################################
# OpenVAS Vulnerability Test
#
# RedHat Update for icedtea-web RHSA-2013:0753-01
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (c) 2013 Greenbone Networks GmbH, http://www.greenbone.net
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

include("revisions-lib.inc");
tag_insight = "The IcedTea-Web project provides a Java web browser plug-in and an
  implementation of Java Web Start, which is based on the Netx project. It
  also contains a configuration tool for managing deployment settings for the
  plug-in and Web Start implementations.

  It was discovered that the IcedTea-Web plug-in incorrectly used the same
  class loader instance for applets with the same value of the codebase
  attribute, even when they originated from different domains. A malicious
  applet could use this flaw to gain information about and possibly
  manipulate applets from different domains currently running in the browser.
  (CVE-2013-1926)

  The IcedTea-Web plug-in did not properly check the format of the downloaded
  Java Archive (JAR) files. This could cause the plug-in to execute code
  hidden in a file in a different format, possibly allowing attackers to
  execute code in the context of web sites that allow uploads of specific
  file types, known as a GIFAR attack. (CVE-2013-1927)

  The CVE-2013-1926 issue was discovered by Jiri Vanek of the Red Hat OpenJDK
  Team, and CVE-2013-1927 was discovered by the Red Hat Security Response
  Team.

  This erratum also upgrades IcedTea-Web to version 1.2.3. Refer to the NEWS
  file, linked to in the References, for further information.

  All IcedTea-Web users should upgrade to these updated packages, which
  resolve these issues. Web browsers using the IcedTea-Web browser plug-in
  must be restarted for this update to take effect.";


tag_affected = "icedtea-web on Red Hat Enterprise Linux Desktop (v. 6),
  Red Hat Enterprise Linux Server (v. 6),
  Red Hat Enterprise Linux Workstation (v. 6)";
tag_solution = "Please Install the Updated Packages.";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.870984");
  script_version("$Revision: 9353 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-06 09:14:20 +0200 (Fri, 06 Apr 2018) $");
  script_tag(name:"creation_date", value:"2013-04-19 09:57:28 +0530 (Fri, 19 Apr 2013)");
  script_cve_id("CVE-2013-1926", "CVE-2013-1927");
  script_tag(name:"cvss_base", value:"6.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
  script_name("RedHat Update for icedtea-web RHSA-2013:0753-01");

  script_xref(name: "RHSA", value: "2013:0753-01");
  script_xref(name: "URL" , value: "https://www.redhat.com/archives/rhsa-announce/2013-April/msg00027.html");
  script_tag(name: "summary" , value: "Check for the Version of icedtea-web");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2013 Greenbone Networks GmbH");
  script_family("Red Hat Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/rhel", "ssh/login/rpms");
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");
  exit(0);
}


include("pkg-lib-rpm.inc");

release = get_kb_item("ssh/login/release");

res = "";
if(release == NULL){
  exit(0);
}

if(release == "RHENT_6")
{

  if ((res = isrpmvuln(pkg:"icedtea-web", rpm:"icedtea-web~1.2.3~2.el6_4", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"icedtea-web-debuginfo", rpm:"icedtea-web-debuginfo~1.2.3~2.el6_4", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
