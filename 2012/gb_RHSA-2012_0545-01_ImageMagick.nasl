###############################################################################
# OpenVAS Vulnerability Test
#
# RedHat Update for ImageMagick RHSA-2012:0545-01
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
tag_insight = "ImageMagick is an image display and manipulation tool for the X Window
  System that can read and write multiple image formats.

  A flaw was found in the way ImageMagick processed images with malformed
  Exchangeable image file format (Exif) metadata. An attacker could create a
  specially-crafted image file that, when opened by a victim, would cause
  ImageMagick to crash or, potentially, execute arbitrary code.
  (CVE-2012-0247)

  A denial of service flaw was found in the way ImageMagick processed images
  with malformed Exif metadata. An attacker could create a specially-crafted
  image file that, when opened by a victim, could cause ImageMagick to enter
  an infinite loop. (CVE-2012-0248)

  A denial of service flaw was found in the way ImageMagick decoded certain
  JPEG images. A remote attacker could provide a JPEG image with
  specially-crafted sequences of RST0 up to RST7 restart markers (used to
  indicate the input stream to be corrupted), which once processed by
  ImageMagick, would cause it to consume excessive amounts of memory and CPU
  time. (CVE-2012-0260)

  Red Hat would like to thank CERT-FI for reporting CVE-2012-0260. CERT-FI
  acknowledges Aleksis Kauppinen, Joonas Kuorilehto, Tuomas Parttimaa and
  Lasse Ylivainio of Codenomicon's CROSS project as the original reporters.

  This update also fixes the following bug:

  * The fix for Red Hat Bugzilla bug 694922, provided by the RHSA-2012:0301
  ImageMagick update, introduced a regression. Attempting to use the
  &quot;convert&quot; utility to convert a PostScript document could fail with a
  &quot;/undefinedfilename&quot; error. With this update, conversion works as expected.
  (BZ#804546)

  Users of ImageMagick are advised to upgrade to these updated packages,
  which contain backported patches to correct these issues. All running
  instances of ImageMagick must be restarted for this update to take effect.";

tag_affected = "ImageMagick on Red Hat Enterprise Linux (v. 5 server)";
tag_solution = "Please Install the Updated Packages.";



if(description)
{
  script_xref(name : "URL" , value : "https://www.redhat.com/archives/rhsa-announce/2012-May/msg00003.html");
  script_oid("1.3.6.1.4.1.25623.1.0.870592");
  script_tag(name:"cvss_base", value:"9.3");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
 script_version("$Revision: 9352 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-06 09:13:02 +0200 (Fri, 06 Apr 2018) $");
  script_tag(name:"creation_date", value:"2012-05-08 12:35:39 +0530 (Tue, 08 May 2012)");
  script_cve_id("CVE-2012-0247", "CVE-2012-0248", "CVE-2012-0260");
  script_xref(name: "RHSA", value: "2012:0545-01");
  script_name("RedHat Update for ImageMagick RHSA-2012:0545-01");

  script_tag(name: "summary" , value: "Check for the Version of ImageMagick");
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

if(release == "RHENT_5")
{

  if ((res = isrpmvuln(pkg:"ImageMagick", rpm:"ImageMagick~6.2.8.0~15.el5_8", rls:"RHENT_5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"ImageMagick-c++", rpm:"ImageMagick-c++~6.2.8.0~15.el5_8", rls:"RHENT_5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"ImageMagick-c++-devel", rpm:"ImageMagick-c++-devel~6.2.8.0~15.el5_8", rls:"RHENT_5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"ImageMagick-debuginfo", rpm:"ImageMagick-debuginfo~6.2.8.0~15.el5_8", rls:"RHENT_5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"ImageMagick-devel", rpm:"ImageMagick-devel~6.2.8.0~15.el5_8", rls:"RHENT_5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"ImageMagick-perl", rpm:"ImageMagick-perl~6.2.8.0~15.el5_8", rls:"RHENT_5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
