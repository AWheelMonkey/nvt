###############################################################################
# OpenVAS Vulnerability Test
#
# CentOS Update for thunderbird CESA-2012:1211 centos5 
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
tag_insight = "Mozilla Thunderbird is a standalone mail and newsgroup client.

  Several flaws were found in the processing of malformed content. Malicious
  content could cause Thunderbird to crash or, potentially, execute arbitrary
  code with the privileges of the user running Thunderbird. (CVE-2012-1970,
  CVE-2012-1972, CVE-2012-1973, CVE-2012-1974, CVE-2012-1975, CVE-2012-1976,
  CVE-2012-3956, CVE-2012-3957, CVE-2012-3958, CVE-2012-3959, CVE-2012-3960,
  CVE-2012-3961, CVE-2012-3962, CVE-2012-3963, CVE-2012-3964)
  
  Content containing a malicious Scalable Vector Graphics (SVG) image file
  could cause Thunderbird to crash or, potentially, execute arbitrary code
  with the privileges of the user running Thunderbird. (CVE-2012-3969,
  CVE-2012-3970)
  
  Two flaws were found in the way Thunderbird rendered certain images using
  WebGL. Malicious content could cause Thunderbird to crash or, under certain
  conditions, possibly execute arbitrary code with the privileges of the user
  running Thunderbird. (CVE-2012-3967, CVE-2012-3968)
  
  A flaw was found in the way Thunderbird decoded embedded bitmap images in
  Icon Format (ICO) files. Content containing a malicious ICO file could
  cause Thunderbird to crash or, under certain conditions, possibly execute
  arbitrary code with the privileges of the user running Thunderbird.
  (CVE-2012-3966)
  
  A flaw was found in the way the &quot;eval&quot; command was handled by the
  Thunderbird Error Console. Running &quot;eval&quot; in the Error Console while
  viewing malicious content could possibly cause Thunderbird to execute
  arbitrary code with the privileges of the user running Thunderbird.
  (CVE-2012-3980)
  
  An out-of-bounds memory read flaw was found in the way Thunderbird used the
  format-number feature of XSLT (Extensible Stylesheet Language
  Transformations). Malicious content could possibly cause an information
  leak, or cause Thunderbird to crash. (CVE-2012-3972)
  
  A flaw was found in the location object implementation in Thunderbird.
  Malicious content could use this flaw to possibly allow restricted content
  to be loaded. (CVE-2012-3978)
  
  Red Hat would like to thank the Mozilla project for reporting these issues.
  Upstream acknowledges Gary Kwong, Christian Holler, Jesse Ruderman, John
  Schoenick, Vladimir Vukicevic, Daniel Holbert, Abhishek Arya, Fr�d�ric
  Hoguin, miaubiz, Arthur Gerkis, Nicolas Gr�goire, moz_bug_r_a4, and Colby
  Russell as the original reporters of these issues.
  
  Note: All issues except CVE-2012-3969 and CVE-2012-3970 cannot be exploited
  by a specially-crafted HTML mail message as JavaScrip ... 

  Description truncated, for more information please check the Reference URL";

tag_affected = "thunderbird on CentOS 5";
tag_solution = "Please Install the Updated Packages.";



if(description)
{
  script_xref(name : "URL" , value : "http://lists.centos.org/pipermail/centos-announce/2012-August/018833.html");
  script_oid("1.3.6.1.4.1.25623.1.0.881480");
  script_version("$Revision: 9352 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-06 09:13:02 +0200 (Fri, 06 Apr 2018) $");
  script_tag(name:"creation_date", value:"2012-08-30 10:44:44 +0530 (Thu, 30 Aug 2012)");
  script_cve_id("CVE-2012-1970", "CVE-2012-1972", "CVE-2012-1973", "CVE-2012-1974",
                "CVE-2012-1975", "CVE-2012-1976", "CVE-2012-3956", "CVE-2012-3957",
                "CVE-2012-3958", "CVE-2012-3959", "CVE-2012-3960", "CVE-2012-3961",
                "CVE-2012-3962", "CVE-2012-3963", "CVE-2012-3964", "CVE-2012-3966",
                "CVE-2012-3967", "CVE-2012-3968", "CVE-2012-3969", "CVE-2012-3970",
                "CVE-2012-3972", "CVE-2012-3978", "CVE-2012-3980");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_xref(name: "CESA", value: "2012:1211");
  script_name("CentOS Update for thunderbird CESA-2012:1211 centos5 ");

  script_tag(name: "summary" , value: "Check for the Version of thunderbird");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2012 Greenbone Networks GmbH");
  script_family("CentOS Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/centos", "ssh/login/rpms");
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

if(release == "CentOS5")
{

  if ((res = isrpmvuln(pkg:"thunderbird", rpm:"thunderbird~10.0.7~1.el5.centos", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
