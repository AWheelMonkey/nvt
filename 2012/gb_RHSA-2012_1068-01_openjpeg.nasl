###############################################################################
# OpenVAS Vulnerability Test
#
# RedHat Update for openjpeg RHSA-2012:1068-01
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

tag_insight = "OpenJPEG is an open source library for reading and writing image files in
  JPEG 2000 format.

  An input validation flaw, leading to a heap-based buffer overflow, was
  found in the way OpenJPEG handled the tile number and size in an image tile
  header. A remote attacker could provide a specially-crafted image file
  that, when decoded using an application linked against OpenJPEG, would
  cause the application to crash or, potentially, execute arbitrary code with
  the privileges of the user running the application. (CVE-2012-3358)

  OpenJPEG allocated insufficient memory when encoding JPEG 2000 files from
  input images that have certain color depths. A remote attacker could
  provide a specially-crafted image file that, when opened in an application
  linked against OpenJPEG (such as image_to_j2k), would cause the application
  to crash or, potentially, execute arbitrary code with the privileges of the
  user running the application. (CVE-2009-5030)

  Users of OpenJPEG should upgrade to these updated packages, which contain
  patches to correct these issues. All running applications using OpenJPEG
  must be restarted for the update to take effect.";

tag_affected = "openjpeg on Red Hat Enterprise Linux Desktop (v. 6),
  Red Hat Enterprise Linux Server (v. 6),
  Red Hat Enterprise Linux Workstation (v. 6)";
tag_solution = "Please Install the Updated Packages.";



if(description)
{
  script_xref(name : "URL" , value : "https://www.redhat.com/archives/rhsa-announce/2012-July/msg00010.html");
  script_oid("1.3.6.1.4.1.25623.1.0.870786");
  script_tag(name:"cvss_base", value:"10.0");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
 script_version("$Revision: 12370 $");
  script_tag(name:"last_modification", value:"$Date: 2018-11-16 08:56:29 +0100 (Fri, 16 Nov 2018) $");
  script_tag(name:"creation_date", value:"2012-07-16 11:52:18 +0530 (Mon, 16 Jul 2012)");
  script_cve_id("CVE-2009-5030", "CVE-2012-3358");
  script_xref(name: "RHSA", value: "2012:1068-01");
  script_name("RedHat Update for openjpeg RHSA-2012:1068-01");

  script_tag(name: "summary" , value: "Check for the Version of openjpeg");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2012 Greenbone Networks GmbH");
  script_family("Red Hat Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/rhel", "ssh/login/rpms", re:"ssh/login/release=RHENT_6");
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

if(release == "RHENT_6")
{

  if ((res = isrpmvuln(pkg:"openjpeg-debuginfo", rpm:"openjpeg-debuginfo~1.3~8.el6_3", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"openjpeg-libs", rpm:"openjpeg-libs~1.3~8.el6_3", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
