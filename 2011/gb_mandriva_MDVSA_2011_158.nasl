###############################################################################
# OpenVAS Vulnerability Test
#
# Mandriva Update for phpmyadmin MDVSA-2011:158 (phpmyadmin)
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
tag_insight = "Multiple vulnerabilities has been found and corrected in phpmyadmin:

  Missing sanitization on the table, column and index names leads to
  XSS vulnerabilities (CVE-2011-3181).
  
  Firstly, if a row contains javascript code, after inline editing this
  row and saving, the code is executed. Secondly, missing sanitization
  on the db, table and column names leads to XSS vulnerabilities.
  
  When the js_frame parameter of phpmyadmin.css.php is defined as an
  array, an error message shows the full path of this file, leading to
  possible further attacks (CVE-2011-3646).
  
  Crafted values entered in the setup interface can produce XSS; also,
  if the config directory exists and is writeable, the XSS payload can
  be saved to this directory (CVE-2011-4064).
  
  This upgrade provides the latest phpmyadmin version (3.4.6) to address
  these vulnerabilities.";
tag_solution = "Please Install the Updated Packages.";

tag_affected = "phpmyadmin on Mandriva Enterprise Server 5,
  Mandriva Enterprise Server 5/X86_64";


if(description)
{
  script_xref(name : "URL" , value : "http://lists.mandriva.com/security-announce/2011-10/msg00039.php");
  script_oid("1.3.6.1.4.1.25623.1.0.831480");
  script_version("$Revision: 9371 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-06 10:55:06 +0200 (Fri, 06 Apr 2018) $");
  script_tag(name:"creation_date", value:"2011-10-31 13:45:00 +0100 (Mon, 31 Oct 2011)");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:N");
  script_xref(name: "MDVSA", value: "2011:158");
  script_cve_id("CVE-2011-3181", "CVE-2011-3646", "CVE-2011-4064");
  script_name("Mandriva Update for phpmyadmin MDVSA-2011:158 (phpmyadmin)");

  script_tag(name:"summary", value:"Check for the Version of phpmyadmin");
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

if(release == "MNDK_mes5")
{

  if ((res = isrpmvuln(pkg:"phpmyadmin", rpm:"phpmyadmin~3.4.6~0.1mdvmes5.2", rls:"MNDK_mes5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
