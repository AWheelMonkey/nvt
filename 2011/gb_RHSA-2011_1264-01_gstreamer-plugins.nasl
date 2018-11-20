###############################################################################
# OpenVAS Vulnerability Test
#
# RedHat Update for gstreamer-plugins RHSA-2011:1264-01
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

if(description)
{
  script_xref(name:"URL" , value:"https://www.redhat.com/archives/rhsa-announce/2011-September/msg00004.html");
  script_oid("1.3.6.1.4.1.25623.1.0.870483");
  script_tag(name:"cvss_base", value:"6.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
  script_version("$Revision: 12382 $");
  script_tag(name:"last_modification", value:"$Date: 2018-11-16 12:51:56 +0100 (Fri, 16 Nov 2018) $");
  script_tag(name:"creation_date", value:"2011-09-12 16:29:49 +0200 (Mon, 12 Sep 2011)");
  script_xref(name:"RHSA", value:"2011:1264-01");
  script_cve_id("CVE-2011-2911", "CVE-2011-2912", "CVE-2011-2913", "CVE-2011-2914", "CVE-2011-2915");
  script_name("RedHat Update for gstreamer-plugins RHSA-2011:1264-01");

  script_tag(name:"summary", value:"The remote host is missing an update for the 'gstreamer-plugins'
  package(s) announced via the referenced advisory.");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2011 Greenbone Networks GmbH");
  script_family("Red Hat Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/rhel", "ssh/login/rpms", re:"ssh/login/release=RHENT_4");
  script_tag(name:"affected", value:"gstreamer-plugins on Red Hat Enterprise Linux AS version 4,
  Red Hat Enterprise Linux ES version 4,
  Red Hat Enterprise Linux WS version 4");
  script_tag(name:"solution", value:"Please Install the Updated Packages.");
  script_tag(name:"insight", value:"The gstreamer-plugins packages contain plug-ins used by the GStreamer
  streaming-media framework to support a wide variety of media formats.

  An integer overflow flaw, a boundary error, and multiple off-by-one flaws
  were found in various ModPlug music file format library (libmodplug)
  modules, embedded in GStreamer. An attacker could create specially-crafted
  music files that, when played by a victim, would cause applications using
  GStreamer to crash or, potentially, execute arbitrary code. (CVE-2011-2911,
  CVE-2011-2912, CVE-2011-2913, CVE-2011-2914, CVE-2011-2915)

  All users of gstreamer-plugins are advised to upgrade to these updated
  packages, which contain backported patches to correct these issues. After
  installing the update, all applications using GStreamer (such as Rhythmbox)
  must be restarted for the changes to take effect.");
  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-rpm.inc");

release = rpm_get_ssh_release();
if(!release) exit(0);

res = "";

if(release == "RHENT_4")
{

  if ((res = isrpmvuln(pkg:"gstreamer-plugins", rpm:"gstreamer-plugins~0.8.5~1.EL.4", rls:"RHENT_4")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"gstreamer-plugins-debuginfo", rpm:"gstreamer-plugins-debuginfo~0.8.5~1.EL.4", rls:"RHENT_4")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"gstreamer-plugins-devel", rpm:"gstreamer-plugins-devel~0.8.5~1.EL.4", rls:"RHENT_4")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
