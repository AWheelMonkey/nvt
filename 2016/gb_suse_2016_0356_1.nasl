###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_suse_2016_0356_1.nasl 8047 2017-12-08 08:56:07Z santu $
#
# SuSE Update for rubygem-rails-html-sanitizer openSUSE-SU-2016:0356-1 (rubygem-rails-html-sanitizer)
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (C) 2016 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.851200");
  script_version("$Revision: 8047 $");
  script_tag(name:"last_modification", value:"$Date: 2017-12-08 09:56:07 +0100 (Fri, 08 Dec 2017) $");
  script_tag(name:"creation_date", value:"2016-02-08 06:18:19 +0100 (Mon, 08 Feb 2016)");
  script_cve_id("CVE-2015-7578", "CVE-2015-7579", "CVE-2015-7580");
  script_tag(name:"cvss_base", value:"4.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:P/A:N");
  script_tag(name:"qod_type", value:"package");
  script_name("SuSE Update for rubygem-rails-html-sanitizer openSUSE-SU-2016:0356-1 (rubygem-rails-html-sanitizer)");
  script_tag(name: "summary", value: "Check the version of rubygem-rails-html-sanitizer");
  script_tag(name: "vuldetect", value: "Get the installed version with the help 
of detect NVT and check if the version is vulnerable or not.");
  script_tag(name: "insight", value: "
  This update for rubygem-rails-html-sanitizer fixes the following issues:

  - CVE-2015-7579: XSS vulnerability in rails-html-sanitizer (bsc#963327)
  - CVE-2015-7578: XSS vulnerability via attributes (bsc#963326)
  - CVE-2015-7580: XSS via whitelist sanitizer (bsc#963328)");
  script_tag(name: "affected", value: "rubygem-rails-html-sanitizer on openSUSE Leap 42.1");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");

  script_xref(name: "openSUSE-SU", value: "2016:0356_1");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
  script_family("SuSE Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/suse", "ssh/login/rpms");
  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-rpm.inc");

release = get_kb_item("ssh/login/release");

res = "";
if(release == NULL){
  exit(0);
}

if(release == "openSUSELeap42.1")
{

  if ((res = isrpmvuln(pkg:"ruby2.1-rubygem-rails-html-sanitizer", rpm:"ruby2.1-rubygem-rails-html-sanitizer~1.0.2~5.1", rls:"openSUSELeap42.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"ruby2.1-rubygem-rails-html-sanitizer-doc", rpm:"ruby2.1-rubygem-rails-html-sanitizer-doc~1.0.2~5.1", rls:"openSUSELeap42.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"ruby2.1-rubygem-rails-html-sanitizer-testsuite", rpm:"uby2.1-rubygem-rails-html-sanitizer-testsuite~1.0.2~5.1", rls:"openSUSELeap42.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
