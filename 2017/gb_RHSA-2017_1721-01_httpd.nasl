###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_RHSA-2017_1721-01_httpd.nasl 12380 2018-11-16 11:03:48Z cfischer $
#
# RedHat Update for httpd RHSA-2017:1721-01
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (C) 2017 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.871843");
  script_version("$Revision: 12380 $");
  script_tag(name:"last_modification", value:"$Date: 2018-11-16 12:03:48 +0100 (Fri, 16 Nov 2018) $");
  script_tag(name:"creation_date", value:"2017-07-12 07:11:32 +0200 (Wed, 12 Jul 2017)");
  script_cve_id("CVE-2016-8743");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:P/A:N");
  script_tag(name:"qod_type", value:"package");
  script_name("RedHat Update for httpd RHSA-2017:1721-01");
  script_tag(name:"summary", value:"The remote host is missing an update for the 'httpd'
  package(s) announced via the referenced advisory.");
  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");
  script_tag(name:"insight", value:"The httpd packages provide the Apache HTTP
Server, a powerful, efficient, and extensible web server.

Security Fix(es):

  * It was discovered that the HTTP parser in httpd incorrectly allowed
certain characters not permitted by the HTTP protocol specification to
appear unencoded in HTTP request headers. If httpd was used in conjunction
with a proxy or backend server that interpreted those characters
differently, a remote attacker could possibly use this flaw to inject data
into HTTP responses, resulting in proxy cache poisoning. (CVE-2016-8743)

Note: The fix for the CVE-2016-8743 issue causes httpd to return '400 Bad
Request' error to HTTP clients which do not strictly follow HTTP protocol
specification. A newly introduced configuration directive
'HttpProtocolOptions Unsafe' can be used to re-enable the old less strict
parsing. However, such setting also re-introduces the CVE-2016-8743 issue.

Note: Administrators of Red Hat Satellite 5 and Red Hat Satellite Proxy 5
systems should consult Red Hat Knowledgebase article 3013361 linked to in
the Reference section before installing this update.

Bug Fix(es):

  * Previously, httpd was unable to correctly check a boundary of an array,
and in rare cases it attempted to access an element of an array that was
out of bounds. Consequently, httpd terminated unexpectedly with a
segmentation fault at proxy_util.c. With this update, bounds checking has
been fixed, and httpd no longer crashes. (BZ#1463354)");
  script_tag(name:"affected", value:"httpd on
  Red Hat Enterprise Linux Desktop (v. 6),
  Red Hat Enterprise Linux Server (v. 6),
  Red Hat Enterprise Linux Workstation (v. 6)");
  script_tag(name:"solution", value:"Please Install the Updated Packages.");

  script_xref(name:"RHSA", value:"2017:1721-01");
  script_xref(name:"URL" , value:"https://www.redhat.com/archives/rhsa-announce/2017-July/msg00012.html");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("Red Hat Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/rhel", "ssh/login/rpms", re:"ssh/login/release=RHENT_6");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-rpm.inc");

release = rpm_get_ssh_release();
if(!release) exit(0);

res = "";

if(release == "RHENT_6")
{

  if ((res = isrpmvuln(pkg:"httpd", rpm:"httpd~2.2.15~60.el6_9.4", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"httpd-debuginfo", rpm:"httpd-debuginfo~2.2.15~60.el6_9.4", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"httpd-devel", rpm:"httpd-devel~2.2.15~60.el6_9.4", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"httpd-tools", rpm:"httpd-tools~2.2.15~60.el6_9.4", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"mod_ssl", rpm:"mod_ssl~2.2.15~60.el6_9.4", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"httpd-manual", rpm:"httpd-manual~2.2.15~60.el6_9.4", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
