###############################################################################
# OpenVAS Vulnerability Test
#
# RedHat Update for gstreamer-plugins-good RHSA-2017:0019-01
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
  script_oid("1.3.6.1.4.1.25623.1.0.871741");
  script_version("$Revision: 12370 $");
  script_tag(name:"last_modification", value:"$Date: 2018-11-16 08:56:29 +0100 (Fri, 16 Nov 2018) $");
  script_tag(name:"creation_date", value:"2017-01-06 05:45:04 +0100 (Fri, 06 Jan 2017)");
  script_cve_id("CVE-2016-9634", "CVE-2016-9635", "CVE-2016-9636", "CVE-2016-9807", "CVE-2016-9808");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_tag(name:"qod_type", value:"package");
  script_name("RedHat Update for gstreamer-plugins-good RHSA-2017:0019-01");
  script_tag(name: "summary", value: "Check the version of gstreamer-plugins-good");
  script_tag(name: "vuldetect", value: "Get the installed version with the help of detect NVT and check if the version is vulnerable or not.");
  script_tag(name: "insight", value: "GStreamer is a streaming media framework based on graphs of filters which
operate on media data. The gstreamer-plugins-good packages contain a
collection of well-supported plug-ins of good quality and under the LGPL
license.

Security Fix(es):

* Multiple flaws were discovered in GStreamer's FLC/FLI/FLX media file
format decoding plug-in. A remote attacker could use these flaws to cause
an application using GStreamer to crash or, potentially, execute arbitrary
code with the privileges of the user running the application.
(CVE-2016-9634, CVE-2016-9635, CVE-2016-9636, CVE-2016-9808)

* An invalid memory read access flaw was found in GStreamer's FLC/FLI/FLX
media file format decoding plug-in. A remote attacker could use this flaw
to cause an application using GStreamer to crash. (CVE-2016-9807)

Note: This update removes the vulnerable FLC/FLI/FLX plug-in.
");
  script_tag(name: "affected", value: "gstreamer-plugins-good on Red Hat Enterprise Linux Server (v. 7)");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");

  script_xref(name: "RHSA", value: "2017:0019-01");
  script_xref(name: "URL" , value: "https://www.redhat.com/archives/rhsa-announce/2017-January/msg00007.html");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("Red Hat Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/rhel", "ssh/login/rpms", re:"ssh/login/release=RHENT_7");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-rpm.inc");

release = rpm_get_ssh_release();
if(!release) exit(0);

res = "";

if(release == "RHENT_7")
{

  if ((res = isrpmvuln(pkg:"gstreamer-plugins-good", rpm:"gstreamer-plugins-good~0.10.31~12.el7_3", rls:"RHENT_7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"gstreamer-plugins-good-debuginfo", rpm:"gstreamer-plugins-good-debuginfo~0.10.31~12.el7_3", rls:"RHENT_7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}