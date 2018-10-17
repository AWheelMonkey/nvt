###############################################################################
# OpenVAS Vulnerability Test
#
# RedHat Update for libsndfile RHSA-2011:1084-01
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
tag_insight = "The libsndfile packages provide a library for reading and writing sound
  files.

  An integer overflow flaw, leading to a heap-based buffer overflow, was
  found in the way the libsndfile library processed certain Ensoniq PARIS
  Audio Format (PAF) audio files. An attacker could create a
  specially-crafted PAF file that, when opened, could cause an application
  using libsndfile to crash or, potentially, execute arbitrary code with the
  privileges of the user running the application. (CVE-2011-2696)

  Users of libsndfile are advised to upgrade to these updated packages, which
  contain a backported patch to correct this issue. All running applications
  using libsndfile must be restarted for the update to take effect.";

tag_affected = "libsndfile on Red Hat Enterprise Linux Desktop (v. 6),
  Red Hat Enterprise Linux Server (v. 6),
  Red Hat Enterprise Linux Workstation (v. 6)";
tag_solution = "Please Install the Updated Packages.";



if(description)
{
  script_xref(name : "URL" , value : "https://www.redhat.com/archives/rhsa-announce/2011-July/msg00019.html");
  script_oid("1.3.6.1.4.1.25623.1.0.870621");
  script_version("$Revision: 9352 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-06 09:13:02 +0200 (Fri, 06 Apr 2018) $");
  script_tag(name:"creation_date", value:"2012-06-06 10:34:51 +0530 (Wed, 06 Jun 2012)");
  script_cve_id("CVE-2011-2696");
  script_tag(name:"cvss_base", value:"6.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
  script_xref(name: "RHSA", value: "2011:1084-01");
  script_name("RedHat Update for libsndfile RHSA-2011:1084-01");

  script_tag(name: "summary" , value: "Check for the Version of libsndfile");
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

  if ((res = isrpmvuln(pkg:"libsndfile", rpm:"libsndfile~1.0.20~3.el6_1.1", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libsndfile-debuginfo", rpm:"libsndfile-debuginfo~1.0.20~3.el6_1.1", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
