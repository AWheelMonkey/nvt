###############################################################################
# OpenVAS Vulnerability Test
#
# RedHat Update for ImageMagick RHSA-2012:0301-03
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

if(description)
{
  script_xref(name:"URL" , value:"https://www.redhat.com/archives/rhsa-announce/2012-February/msg00059.html");
  script_oid("1.3.6.1.4.1.25623.1.0.870567");
  script_version("$Revision: 12382 $");
  script_tag(name:"last_modification", value:"$Date: 2018-11-16 12:51:56 +0100 (Fri, 16 Nov 2018) $");
  script_tag(name:"creation_date", value:"2012-02-21 18:58:04 +0530 (Tue, 21 Feb 2012)");
  script_cve_id("CVE-2010-4167");
  script_tag(name:"cvss_base", value:"6.9");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:M/Au:N/C:C/I:C/A:C");
  script_xref(name:"RHSA", value:"2012:0301-03");
  script_name("RedHat Update for ImageMagick RHSA-2012:0301-03");

  script_tag(name:"summary", value:"The remote host is missing an update for the 'ImageMagick'
  package(s) announced via the referenced advisory.");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2012 Greenbone Networks GmbH");
  script_family("Red Hat Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/rhel", "ssh/login/rpms", re:"ssh/login/release=RHENT_5");
  script_tag(name:"affected", value:"ImageMagick on Red Hat Enterprise Linux (v. 5 server)");
  script_tag(name:"solution", value:"Please Install the Updated Packages.");
  script_tag(name:"insight", value:"ImageMagick is an image display and manipulation tool for the X Window
  System that can read and write multiple image formats.

  It was found that ImageMagick utilities tried to load ImageMagick
  configuration files from the current working directory. If a user ran an
  ImageMagick utility in an attacker-controlled directory containing a
  specially-crafted ImageMagick configuration file, it could cause the
  utility to execute arbitrary code. (CVE-2010-4167)

  This update also fixes the following bugs:

  * Previously, the &quot;identify -verbose&quot; command failed with an assertion if
  there was no image information available. An upstream patch has been
  applied, so that GetImageOption() is now called correctly. Now, the
  &quot;identify -verbose&quot; command works correctly even if no image information is
  available. (BZ#502626)

  * Previously, an incorrect use of the semaphore data type led to a
  deadlock. As a consequence, the ImageMagick utility could become
  unresponsive when converting JPEG files to PDF (Portable Document Format)
  files. A patch has been applied to address the deadlock issue, and JPEG
  files can now be properly converted to PDF files. (BZ#530592)

  * Previously, running the &quot;convert&quot; command with the &quot;-color&quot; option failed
  with a memory allocation error. The source code has been modified to fix
  problems with memory allocation. Now, using the &quot;convert&quot; command with the
  &quot;-color&quot; option works correctly. (BZ#616538)

  * Previously, ImageMagick could become unresponsive when using the
  &quot;display&quot; command on damaged GIF files. The source code has been revised to
  prevent the issue. ImageMagick now produces an error message in the
  described scenario. A file selector is now opened so the user can choose
  another image to display. (BZ#693989)

  * Prior to this update, the &quot;convert&quot; command did not handle rotated PDF
  files correctly. As a consequence, the output was rendered as a portrait
  with the content being cropped. With this update, the PDF render geometry
  is modified, and the output produced by the &quot;convert&quot; command is properly
  rendered as a landscape. (BZ#694922)

  All users of ImageMagick are advised to upgrade to these updated packages,
  which contain backported patches to correct these issues. All running
  instances of ImageMagick must be restarted for this update to take effect.");
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

  if ((res = isrpmvuln(pkg:"ImageMagick", rpm:"ImageMagick~6.2.8.0~12.el5", rls:"RHENT_5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"ImageMagick-c++", rpm:"ImageMagick-c++~6.2.8.0~12.el5", rls:"RHENT_5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"ImageMagick-c++-devel", rpm:"ImageMagick-c++-devel~6.2.8.0~12.el5", rls:"RHENT_5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"ImageMagick-debuginfo", rpm:"ImageMagick-debuginfo~6.2.8.0~12.el5", rls:"RHENT_5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"ImageMagick-devel", rpm:"ImageMagick-devel~6.2.8.0~12.el5", rls:"RHENT_5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"ImageMagick-perl", rpm:"ImageMagick-perl~6.2.8.0~12.el5", rls:"RHENT_5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
