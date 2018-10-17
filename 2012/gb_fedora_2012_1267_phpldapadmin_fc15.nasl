###############################################################################
# OpenVAS Vulnerability Test
#
# Fedora Update for phpldapadmin FEDORA-2012-1267
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
tag_insight = "PhpLDAPadmin is a web-based LDAP client.
  It provides easy, anywhere-accessible, multi-language administration
  for your LDAP server. Its hierarchical tree-viewer and advanced search
  functionality make it intuitive to browse and administer your LDAP directory.

  Since it is a web application, this LDAP browser works on many platforms,
  making your LDAP server easily manageable from any location.

  PhpLDAPadmin is the perfect LDAP browser for the LDAP professional
  and novice alike. Its user base consists mostly of LDAP administration
  professionals.

  Edit /etc/phpldapadmin/config.php to change default (localhost) LDAP server
  location and other things. Edit /etc/httpd/conf.d/phpldapadmin.conf to allow
  access by remote web-clients.";

tag_affected = "phpldapadmin on Fedora 15";
tag_solution = "Please Install the Updated Packages.";



if(description)
{
  script_xref(name : "URL" , value : "http://lists.fedoraproject.org/pipermail/package-announce/2012-February/073213.html");
  script_oid("1.3.6.1.4.1.25623.1.0.863737");
  script_version("$Revision: 9352 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-06 09:13:02 +0200 (Fri, 06 Apr 2018) $");
  script_tag(name:"creation_date", value:"2012-02-21 18:54:43 +0530 (Tue, 21 Feb 2012)");
  script_cve_id("CVE-2012-0834");
  script_tag(name:"cvss_base", value:"4.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:P/A:N");
  script_xref(name: "FEDORA", value: "2012-1267");
  script_name("Fedora Update for phpldapadmin FEDORA-2012-1267");

  script_tag(name: "summary" , value: "Check for the Version of phpldapadmin");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2012 Greenbone Networks GmbH");
  script_family("Fedora Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/fedora", "ssh/login/rpms");
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

if(release == "FC15")
{
  if ((res = isrpmvuln(pkg:"phpldapadmin", rpm:"phpldapadmin~1.2.2~1.fc15", rls:"FC15")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
