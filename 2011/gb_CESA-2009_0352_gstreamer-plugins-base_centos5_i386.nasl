###############################################################################
# OpenVAS Vulnerability Test
#
# CentOS Update for gstreamer-plugins-base CESA-2009:0352 centos5 i386
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
tag_insight = "GStreamer is a streaming media framework based on graphs of filters which
  operate on media data. GStreamer Base Plug-ins is a collection of
  well-maintained base plug-ins.

  An integer overflow flaw which caused a heap-based buffer overflow was
  discovered in the Vorbis comment tags reader. An attacker could create a
  carefully-crafted Vorbis file that would cause an application using
  GStreamer to crash or, potentially, execute arbitrary code if opened by a
  victim. (CVE-2009-0586)
  
  All users of gstreamer-plugins-base are advised to upgrade to these updated
  packages, which contain a backported patch to correct this issue. After
  installing this update, all applications using GStreamer (such as Totem or
  Rhythmbox) must be restarted for the changes to take effect.";
tag_solution = "Please Install the Updated Packages.";

tag_affected = "gstreamer-plugins-base on CentOS 5";


if(description)
{
  script_xref(name : "URL" , value : "http://lists.centos.org/pipermail/centos-announce/2009-April/015741.html");
  script_oid("1.3.6.1.4.1.25623.1.0.880852");
  script_version("$Revision: 9371 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-06 10:55:06 +0200 (Fri, 06 Apr 2018) $");
  script_tag(name:"creation_date", value:"2011-08-09 08:20:34 +0200 (Tue, 09 Aug 2011)");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_xref(name: "CESA", value: "2009:0352");
  script_cve_id("CVE-2009-0586");
  script_name("CentOS Update for gstreamer-plugins-base CESA-2009:0352 centos5 i386");

  script_tag(name:"summary", value:"Check for the Version of gstreamer-plugins-base");
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

if(release == "CentOS5")
{

  if ((res = isrpmvuln(pkg:"gstreamer-plugins-base", rpm:"gstreamer-plugins-base~0.10.20~3.0.1.el5_3", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"gstreamer-plugins-base-devel", rpm:"gstreamer-plugins-base-devel~0.10.20~3.0.1.el5_3", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
