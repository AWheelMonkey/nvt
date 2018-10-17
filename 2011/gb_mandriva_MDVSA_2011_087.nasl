###############################################################################
# OpenVAS Vulnerability Test
#
# Mandriva Update for vino MDVSA-2011:087 (vino)
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
tag_insight = "Multiple vulnerabilities has been found and corrected in vino:

  The rfbSendFramebufferUpdate function in
  server/libvncserver/rfbserver.c in vino-server in Vino 2.x before
  2.28.3, 2.32.x before 2.32.2, 3.0.x before 3.0.2, and 3.1.x before
  3.1.1, when raw encoding is used, allows remote authenticated users to
  cause a denial of service (daemon crash) via a large (1) X position or
  (2) Y position value in a framebuffer update request that triggers
  an out-of-bounds memory access, related to the rfbTranslateNone and
  rfbSendRectEncodingRaw functions (CVE-2011-0904).
  
  The rfbSendFramebufferUpdate function in
  server/libvncserver/rfbserver.c in vino-server in Vino 2.x before
  2.28.3, 2.32.x before 2.32.2, 3.0.x before 3.0.2, and 3.1.x before
  3.1.1, when tight encoding is used, allows remote authenticated users
  to cause a denial of service (daemon crash) via crafted dimensions
  in a framebuffer update request that triggers an out-of-bounds read
  operation (CVE-2011-0905).
  
  The updated packages have been upgraded to 2.28.3 which is not
  vulnerable to these isssues.";
tag_solution = "Please Install the Updated Packages.";

tag_affected = "vino on Mandriva Linux 2010.1,
  Mandriva Linux 2010.1/X86_64";


if(description)
{
  script_xref(name : "URL" , value : "http://lists.mandriva.com/security-announce/2011-05/msg00009.php");
  script_oid("1.3.6.1.4.1.25623.1.0.831392");
  script_version("$Revision: 9371 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-06 10:55:06 +0200 (Fri, 06 Apr 2018) $");
  script_tag(name:"creation_date", value:"2011-05-17 15:58:48 +0200 (Tue, 17 May 2011)");
  script_tag(name:"cvss_base", value:"3.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:S/C:N/I:N/A:P");
  script_xref(name: "MDVSA", value: "2011:087");
  script_cve_id("CVE-2011-0904", "CVE-2011-0905");
  script_name("Mandriva Update for vino MDVSA-2011:087 (vino)");

  script_tag(name:"summary", value:"Check for the Version of vino");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2011 Greenbone Networks GmbH");
  script_family("Mandrake Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/mandriva_mandrake_linux", "ssh/login/release");
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

if(release == "MNDK_2010.1")
{

  if ((res = isrpmvuln(pkg:"vino", rpm:"vino~2.28.3~1.1mdv2010.2", rls:"MNDK_2010.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
