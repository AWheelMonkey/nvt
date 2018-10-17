###############################################################################
# OpenVAS Vulnerability Test
#
# CentOS Update for cups CESA-2009:0429 centos4 i386
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
tag_insight = "The Common UNIX� Printing System (CUPS) provides a portable printing layer
  for UNIX operating systems.

  Multiple integer overflow flaws were found in the CUPS JBIG2 decoder. An
  attacker could create a malicious PDF file that would cause CUPS to crash
  or, potentially, execute arbitrary code as the &quot;lp&quot; user if the file was
  printed. (CVE-2009-0147, CVE-2009-1179)
  
  Multiple buffer overflow flaws were found in the CUPS JBIG2 decoder. An
  attacker could create a malicious PDF file that would cause CUPS to crash
  or, potentially, execute arbitrary code as the &quot;lp&quot; user if the file was
  printed. (CVE-2009-0146, CVE-2009-1182)
  
  Multiple flaws were found in the CUPS JBIG2 decoder that could lead to the
  freeing of arbitrary memory. An attacker could create a malicious PDF file
  that would cause CUPS to crash or, potentially, execute arbitrary code
  as the &quot;lp&quot; user if the file was printed. (CVE-2009-0166, CVE-2009-1180)
  
  Multiple input validation flaws were found in the CUPS JBIG2 decoder. An
  attacker could create a malicious PDF file that would cause CUPS to crash
  or, potentially, execute arbitrary code as the &quot;lp&quot; user if the file was
  printed. (CVE-2009-0800)
  
  An integer overflow flaw, leading to a heap-based buffer overflow, was
  discovered in the Tagged Image File Format (TIFF) decoding routines used by
  the CUPS image-converting filters, &quot;imagetops&quot; and &quot;imagetoraster&quot;. An
  attacker could create a malicious TIFF file that could, potentially,
  execute arbitrary code as the &quot;lp&quot; user if the file was printed.
  (CVE-2009-0163)
  
  Multiple denial of service flaws were found in the CUPS JBIG2 decoder. An
  attacker could create a malicious PDF file that would cause CUPS to crash
  when printed. (CVE-2009-0799, CVE-2009-1181, CVE-2009-1183)
  
  Red Hat would like to thank Aaron Sigel, Braden Thomas and Drew Yao of
  the Apple Product Security team, and Will Dormann of the CERT/CC for
  responsibly reporting these flaws.
  
  Users of cups are advised to upgrade to these updated packages, which
  contain backported patches to correct these issues. After installing the
  update, the cupsd daemon will be restarted automatically.";
tag_solution = "Please Install the Updated Packages.";

tag_affected = "cups on CentOS 4";


if(description)
{
  script_xref(name : "URL" , value : "http://lists.centos.org/pipermail/centos-announce/2009-May/015916.html");
  script_oid("1.3.6.1.4.1.25623.1.0.880886");
  script_version("$Revision: 9371 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-06 10:55:06 +0200 (Fri, 06 Apr 2018) $");
  script_tag(name:"creation_date", value:"2011-08-09 08:20:34 +0200 (Tue, 09 Aug 2011)");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_xref(name: "CESA", value: "2009:0429");
  script_cve_id("CVE-2009-0146", "CVE-2009-0147", "CVE-2009-0163", "CVE-2009-0166",
                "CVE-2009-0799", "CVE-2009-0800", "CVE-2009-1179", "CVE-2009-1180",
                "CVE-2009-1181", "CVE-2009-1182", "CVE-2009-1183");
  script_name("CentOS Update for cups CESA-2009:0429 centos4 i386");

  script_tag(name:"summary", value:"Check for the Version of cups");
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

  if ((res = isrpmvuln(pkg:"cups", rpm:"cups~1.1.22~0.rc1.9.27.el4_7.5", rls:"CentOS4")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"cups-devel", rpm:"cups-devel~1.1.22~0.rc1.9.27.el4_7.5", rls:"CentOS4")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"cups-libs", rpm:"cups-libs~1.1.22~0.rc1.9.27.el4_7.5", rls:"CentOS4")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
