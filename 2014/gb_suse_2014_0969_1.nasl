###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_suse_2014_0969_1.nasl 9373 2018-04-06 08:57:18Z cfischer $
#
# SuSE Update for security openSUSE-SU-2014:0969-1 (security)
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (C) 2014 Greenbone Networks GmbH, http://www.greenbone.net
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

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.850602");
  script_version("$Revision: 9373 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-06 10:57:18 +0200 (Fri, 06 Apr 2018) $");
  script_tag(name:"creation_date", value:"2014-08-08 05:58:45 +0200 (Fri, 08 Aug 2014)");
  script_cve_id("CVE-2014-0226", "CVE-2013-5705", "CVE-2013-6438", "CVE-2014-0098",
                "CVE-2014-0231");
  script_tag(name:"cvss_base", value:"6.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
  script_name("SuSE Update for security openSUSE-SU-2014:0969-1 (security)");

  tag_insight = "
  apache2:
  - ECC support was added to mod_ssl
  - fix for a race condition in mod_status known as CVE-2014-0226 can lead
  to information disclosure  mod_status is not active by default, and is
  normally only open for connects from localhost.
  - fix for bug known as CVE-2014-0098 that can crash the apache process if
  a specially designed cookie is sent to the server (log_cookie.c)
  - fix for crash bug in mod_dav known as CVE-2013-6438
  - fix for a problem with non-responsive CGI scripts that would otherwise
  cause the server to stall and deny service. CVE-2014-0231, new
  configuration parameter CGIDScriptTimeout defaults to 60s.

  apache2-mod_security2:
  - specially drafted chunked http requests allow an attacker to bypass
  filters configured in mod_security2. This vulnerability is known as
  CVE-2013-5705.";

  tag_affected = "security on openSUSE 11.4";

  tag_solution = "Please Install the Updated Packages.";


  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");
  script_xref(name: "openSUSE-SU", value: "2014:0969_1");
  script_tag(name:"summary", value:"Check for the Version of security");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2014 Greenbone Networks GmbH");
  script_family("SuSE Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/suse", "ssh/login/rpms");
  exit(0);
}


include("pkg-lib-rpm.inc");

release = get_kb_item("ssh/login/release");

res = "";
if(release == NULL){
  exit(0);
}

if(release == "openSUSE11.4")
{

  if ((res = isrpmvuln(pkg:"apache2", rpm:"apache2~2.2.17~80.1", rls:"openSUSE11.4")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"apache2-debuginfo", rpm:"apache2-debuginfo~2.2.17~80.1", rls:"openSUSE11.4")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"apache2-debugsource", rpm:"apache2-debugsource~2.2.17~80.1", rls:"openSUSE11.4")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"apache2-devel", rpm:"apache2-devel~2.2.17~80.1", rls:"openSUSE11.4")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"apache2-event", rpm:"apache2-event~2.2.17~80.1", rls:"openSUSE11.4")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"apache2-event-debuginfo", rpm:"apache2-event-debuginfo~2.2.17~80.1", rls:"openSUSE11.4")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"apache2-example-certificates", rpm:"apache2-example-certificates~2.2.17~80.1", rls:"openSUSE11.4")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"apache2-example-pages", rpm:"apache2-example-pages~2.2.17~80.1", rls:"openSUSE11.4")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"apache2-itk", rpm:"apache2-itk~2.2.17~80.1", rls:"openSUSE11.4")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"apache2-itk-debuginfo", rpm:"apache2-itk-debuginfo~2.2.17~80.1", rls:"openSUSE11.4")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"apache2-mod_security2", rpm:"apache2-mod_security2~2.7.5~16.1", rls:"openSUSE11.4")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"apache2-mod_security2-debuginfo", rpm:"apache2-mod_security2-debuginfo~2.7.5~16.1", rls:"openSUSE11.4")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"apache2-mod_security2-debugsource", rpm:"apache2-mod_security2-debugsource~2.7.5~16.1", rls:"openSUSE11.4")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"apache2-prefork", rpm:"apache2-prefork~2.2.17~80.1", rls:"openSUSE11.4")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"apache2-prefork-debuginfo", rpm:"apache2-prefork-debuginfo~2.2.17~80.1", rls:"openSUSE11.4")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"apache2-utils", rpm:"apache2-utils~2.2.17~80.1", rls:"openSUSE11.4")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"apache2-utils-debuginfo", rpm:"apache2-utils-debuginfo~2.2.17~80.1", rls:"openSUSE11.4")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"apache2-worker", rpm:"apache2-worker~2.2.17~80.1", rls:"openSUSE11.4")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"apache2-worker-debuginfo", rpm:"apache2-worker-debuginfo~2.2.17~80.1", rls:"openSUSE11.4")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"apache2-doc", rpm:"apache2-doc~2.2.17~80.1", rls:"openSUSE11.4")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
