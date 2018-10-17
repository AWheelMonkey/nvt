###############################################################################
# OpenVAS Vulnerability Test
#
# CentOS Update for device-mapper-multipath CESA-2009:0411 centos5 i386
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
tag_insight = "The device-mapper multipath packages provide tools to manage multipath
  devices by issuing instructions to the device-mapper multipath kernel
  module, and by managing the creation and removal of partitions for
  device-mapper devices.

  It was discovered that the multipathd daemon set incorrect permissions on
  the socket used to communicate with command line clients. An unprivileged,
  local user could use this flaw to send commands to multipathd, resulting in
  access disruptions to storage devices accessible via multiple paths and,
  possibly, file system corruption on these devices. (CVE-2009-0115)
  
  Users of device-mapper-multipath are advised to upgrade to these updated
  packages, which contain a backported patch to resolve this issue. The
  multipathd service must be restarted for the changes to take effect.
  
  Important: the version of the multipathd daemon in Red Hat Enterprise Linux
  5 has a known issue which may cause a machine to become unresponsive when
  the multipathd service is stopped. This issue is tracked in the Bugzilla
  bug #494582; a link is provided in the References section of this erratum.
  Until this issue is resolved, we recommend restarting the multipathd
  service by issuing the following commands in sequence:
  
  	# killall -KILL multipathd
  
  	# service multipathd restart";
tag_solution = "Please Install the Updated Packages.";

tag_affected = "device-mapper-multipath on CentOS 5";


if(description)
{
  script_xref(name : "URL" , value : "http://lists.centos.org/pipermail/centos-announce/2009-April/015739.html");
  script_oid("1.3.6.1.4.1.25623.1.0.880674");
  script_version("$Revision: 9371 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-06 10:55:06 +0200 (Fri, 06 Apr 2018) $");
  script_tag(name:"creation_date", value:"2011-08-09 08:20:34 +0200 (Tue, 09 Aug 2011)");
  script_tag(name:"cvss_base", value:"7.2");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:L/Au:N/C:C/I:C/A:C");
  script_xref(name: "CESA", value: "2009:0411");
  script_cve_id("CVE-2009-0115");
  script_name("CentOS Update for device-mapper-multipath CESA-2009:0411 centos5 i386");

  script_tag(name:"summary", value:"Check for the Version of device-mapper-multipath");
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

  if ((res = isrpmvuln(pkg:"device-mapper-multipath", rpm:"device-mapper-multipath~0.4.7~23.el5_3.2", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kpartx", rpm:"kpartx~0.4.7~23.el5_3.2", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
