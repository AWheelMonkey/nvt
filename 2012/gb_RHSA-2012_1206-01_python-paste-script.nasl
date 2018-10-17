###############################################################################
# OpenVAS Vulnerability Test
#
# RedHat Update for python-paste-script RHSA-2012:1206-01
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (c) 2012 Greenbone Networks GmbH, http://www.greenbone.net
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
tag_insight = "Python Paste provides middleware for building and running Python web
  applications. The python-paste-script package includes paster, a tool for
  working with and running Python Paste applications.

  It was discovered that paster did not drop supplementary group privileges
  when started by the root user. Running &quot;paster serve&quot; as root to start a
  Python web application that will run as a non-root user and group resulted
  in that application running with root group privileges. This could possibly
  allow a remote attacker to gain access to files that should not be
  accessible to the application. (CVE-2012-0878)

  All paster users should upgrade to this updated package, which contains a
  backported patch to resolve this issue. All running paster instances
  configured to drop privileges must be restarted for this update to take
  effect.";

tag_affected = "python-paste-script on Red Hat Enterprise Linux Server (v. 6),
  Red Hat Enterprise Linux Workstation (v. 6)";
tag_solution = "Please Install the Updated Packages.";



if(description)
{
  script_xref(name : "URL" , value : "https://www.redhat.com/archives/rhsa-announce/2012-August/msg00026.html");
  script_oid("1.3.6.1.4.1.25623.1.0.870815");
  script_version("$Revision: 9352 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-06 09:13:02 +0200 (Fri, 06 Apr 2018) $");
  script_tag(name:"creation_date", value:"2012-08-28 10:25:44 +0530 (Tue, 28 Aug 2012)");
  script_cve_id("CVE-2012-0878");
  script_tag(name:"cvss_base", value:"5.1");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:H/Au:N/C:P/I:P/A:P");
  script_xref(name: "RHSA", value: "2012:1206-01");
  script_name("RedHat Update for python-paste-script RHSA-2012:1206-01");

  script_tag(name: "summary" , value: "Check for the Version of python-paste-script");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2012 Greenbone Networks GmbH");
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

  if ((res = isrpmvuln(pkg:"python-paste-script", rpm:"python-paste-script~1.7.3~5.el6_3", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
