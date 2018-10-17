###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_suse_2015_0921_1.nasl 8046 2017-12-08 08:48:56Z santu $
#
# SuSE Update for gstreamer-0_10-plugins-bad SUSE-SU-2015:0921-1 (gstreamer-0_10-plugins-bad)
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
  script_oid("1.3.6.1.4.1.25623.1.0.851085");
  script_version("$Revision: 8046 $");
  script_tag(name:"last_modification", value:"$Date: 2017-12-08 09:48:56 +0100 (Fri, 08 Dec 2017) $");
  script_tag(name:"creation_date", value:"2015-10-16 19:42:41 +0200 (Fri, 16 Oct 2015)");
  script_cve_id("CVE-2015-0797");
  script_tag(name:"cvss_base", value:"6.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
  script_tag(name:"qod_type", value:"package");
  script_name("SuSE Update for gstreamer-0_10-plugins-bad SUSE-SU-2015:0921-1 (gstreamer-0_10-plugins-bad)");
  script_tag(name: "summary", value: "Check the version of gstreamer-0_10-plugins-bad");
  script_tag(name: "vuldetect", value: "Get the installed version with the help of detect NVT and check if the version is vulnerable or not.");
  script_tag(name: "insight", value: "
  gstreamer-0_10-plugins-bad was updated to fix a security issue, a buffer
  overflow in mp4 parsing (bnc#927559 CVE-2015-0797).

  Security Issues:

  * CVE-2015-0797
   http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2015-0797");
  script_tag(name: "affected", value: "gstreamer-0_10-plugins-bad on SUSE Linux Enterprise Desktop 11 SP3");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");
  script_xref(name: "SUSE-SU", value: "2015:0921_1");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2015 Greenbone Networks GmbH");
  script_family("SuSE Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/suse", "ssh/login/rpms");
  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-rpm.inc");

release = get_kb_item("ssh/login/release");

res = "";
if(release == NULL){
  exit(0);
}

if(release == "SLED11.0SP3")
{

  if ((res = isrpmvuln(pkg:"gstreamer-0_10-plugins-bad", rpm:"gstreamer-0_10-plugins-bad~0.10.22~7.11.1", rls:"SLED11.0SP3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"gstreamer-0_10-plugins-bad-lang", rpm:"gstreamer-0_10-plugins-bad-lang~0.10.22~7.11.1", rls:"SLED11.0SP3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libgstbasecamerabinsrc-0_10-0", rpm:"libgstbasecamerabinsrc-0_10-0~0.10.22~7.11.1", rls:"SLED11.0SP3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libgstbasevideo-0_10-0", rpm:"libgstbasevideo-0_10-0~0.10.22~7.11.1", rls:"SLED11.0SP3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libgstphotography-0_10-0", rpm:"libgstphotography-0_10-0~0.10.22~7.11.1", rls:"SLED11.0SP3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libgstsignalprocessor-0_10-0", rpm:"libgstsignalprocessor-0_10-0~0.10.22~7.11.1", rls:"SLED11.0SP3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libgstvdp-0_10-0", rpm:"libgstvdp-0_10-0~0.10.22~7.11.1", rls:"SLED11.0SP3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libgstbasecamerabinsrc-0_10-0-32bit", rpm:"libgstbasecamerabinsrc-0_10-0-32bit~0.10.22~7.11.1", rls:"SLED11.0SP3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libgstbasevideo-0_10-0-32bit", rpm:"libgstbasevideo-0_10-0-32bit~0.10.22~7.11.1", rls:"SLED11.0SP3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libgstphotography-0_10-0-32bit", rpm:"libgstphotography-0_10-0-32bit~0.10.22~7.11.1", rls:"SLED11.0SP3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libgstsignalprocessor-0_10-0-32bit", rpm:"libgstsignalprocessor-0_10-0-32bit~0.10.22~7.11.1", rls:"SLED11.0SP3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libgstvdp-0_10-0-32bit", rpm:"libgstvdp-0_10-0-32bit~0.10.22~7.11.1", rls:"SLED11.0SP3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}