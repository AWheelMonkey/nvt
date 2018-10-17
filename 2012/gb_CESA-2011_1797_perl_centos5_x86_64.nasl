###############################################################################
# OpenVAS Vulnerability Test
#
# CentOS Update for perl CESA-2011:1797 centos5 x86_64
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
tag_insight = "Perl is a high-level programming language commonly used for system
  administration utilities and web programming.

  It was found that the &quot;new&quot; constructor of the Digest module used its
  argument as part of the string expression passed to the eval() function. An
  attacker could possibly use this flaw to execute arbitrary Perl code with
  the privileges of a Perl program that uses untrusted input as an argument
  to the constructor. (CVE-2011-3597)
  
  It was found that the Perl CGI module used a hard-coded value for the MIME
  boundary string in multipart/x-mixed-replace content. A remote attacker
  could possibly use this flaw to conduct an HTTP response splitting attack
  via a specially-crafted HTTP request. (CVE-2010-2761)
  
  A CRLF injection flaw was found in the way the Perl CGI module processed a
  sequence of non-whitespace preceded by newline characters in the header. A
  remote attacker could use this flaw to conduct an HTTP response splitting
  attack via a specially-crafted sequence of characters provided to the CGI
  module. (CVE-2010-4410)
  
  All Perl users should upgrade to these updated packages, which contain
  backported patches to correct these issues. All running Perl programs must
  be restarted for this update to take effect.";

tag_affected = "perl on CentOS 5";
tag_solution = "Please Install the Updated Packages.";



if(description)
{
  script_xref(name : "URL" , value : "http://lists.centos.org/pipermail/centos-announce/2011-December/018307.html");
  script_oid("1.3.6.1.4.1.25623.1.0.881316");
  script_version("$Revision: 9352 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-06 09:13:02 +0200 (Fri, 06 Apr 2018) $");
  script_tag(name:"creation_date", value:"2012-07-30 17:21:47 +0530 (Mon, 30 Jul 2012)");
  script_cve_id("CVE-2010-2761", "CVE-2010-4410", "CVE-2011-3597");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_xref(name: "CESA", value: "2011:1797");
  script_name("CentOS Update for perl CESA-2011:1797 centos5 x86_64");

  script_tag(name: "summary" , value: "Check for the Version of perl");
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

  if ((res = isrpmvuln(pkg:"perl", rpm:"perl~5.8.8~32.el5_7.6", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"perl-suidperl", rpm:"perl-suidperl~5.8.8~32.el5_7.6", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
