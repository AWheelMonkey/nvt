###############################################################################
# OpenVAS Vulnerability Test
#
# CentOS Update for gstreamer-plugins CESA-2011:0477 centos4 i386
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

include("revisions-lib.inc");
tag_insight = "The gstreamer-plugins packages contain plug-ins used by the GStreamer
  streaming-media framework to support a wide variety of media formats.

  An integer overflow flaw, leading to a heap-based buffer overflow, and a
  stack-based buffer overflow flaw were found in various ModPlug music file
  format library (libmodplug) modules, embedded in GStreamer. An attacker
  could create specially-crafted music files that, when played by a victim,
  would cause applications using GStreamer to crash or, potentially, execute
  arbitrary code. (CVE-2006-4192, CVE-2011-1574)
  
  All users of gstreamer-plugins are advised to upgrade to these updated
  packages, which contain backported patches to correct these issues. After
  installing the update, all applications using GStreamer (such as Rhythmbox)
  must be restarted for the changes to take effect.";
tag_solution = "Please Install the Updated Packages.";

tag_affected = "gstreamer-plugins on CentOS 4";


if(description)
{
  script_xref(name : "URL" , value : "http://lists.centos.org/pipermail/centos-announce/2011-May/017472.html");
  script_oid("1.3.6.1.4.1.25623.1.0.880532");
  script_version("$Revision: 9371 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-06 10:55:06 +0200 (Fri, 06 Apr 2018) $");
  script_tag(name:"creation_date", value:"2011-08-09 08:20:34 +0200 (Tue, 09 Aug 2011)");
  script_tag(name:"cvss_base", value:"6.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
  script_xref(name: "CESA", value: "2011:0477");
  script_cve_id("CVE-2006-4192", "CVE-2011-1574");
  script_name("CentOS Update for gstreamer-plugins CESA-2011:0477 centos4 i386");

  script_tag(name:"summary", value:"Check for the Version of gstreamer-plugins");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2011 Greenbone Networks GmbH");
  script_family("CentOS Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/centos", "ssh/login/rpms");
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "solution" , value : tag_solution);
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

if(release == "CentOS4")
{

  if ((res = isrpmvuln(pkg:"gstreamer-plugins", rpm:"gstreamer-plugins~0.8.5~1.EL.3", rls:"CentOS4")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"gstreamer-plugins-devel", rpm:"gstreamer-plugins-devel~0.8.5~1.EL.3", rls:"CentOS4")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
