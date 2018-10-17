###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_suse_2014_0449_1.nasl 9373 2018-04-06 08:57:18Z cfischer $
#
# SuSE Update for lighttpd openSUSE-SU-2014:0449-1 (lighttpd)
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
  script_oid("1.3.6.1.4.1.25623.1.0.850579");
  script_version("$Revision: 9373 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-06 10:57:18 +0200 (Fri, 06 Apr 2018) $");
  script_tag(name:"creation_date", value:"2014-04-03 12:52:28 +0530 (Thu, 03 Apr 2014)");
  script_cve_id("CVE-2014-2323", "CVE-2014-2324");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_name("SuSE Update for lighttpd openSUSE-SU-2014:0449-1 (lighttpd)");

  tag_insight = "
  lighttpd was updated to version 1.4.35, fixing bugs and
  security issues:

  CVE-2014-2323: SQL injection vulnerability in
  mod_mysql_vhost.c in lighttpd allowed remote attackers to
  execute arbitrary SQL commands via the host name, related
  to request_check_hostname.

  CVE-2014-2323: Multiple directory traversal vulnerabilities
  in (1) mod_evhost and (2) mod_simple_vhost in lighttpd
  allowed remote attackers to read arbitrary files via a ..
  (dot dot) in the host name, related to
  request_check_hostname.

  More information can be found on the lighttpd advisory
  page:
  <a  rel='nofollow' href='http://download.lighttpd.net/lighttpd/security/lighttpd_sa_2'>http://download.lighttpd.net/lighttpd/security/lighttpd_sa_2
  014_01.txt

  Other changes:
  * [network/ssl] fix build error if TLSEXT is disabled
  * [mod_fastcgi] fix use after free (only triggered if
  fastcgi debug is active)
  * [mod_rrdtool] fix invalid read (string not null
  terminated)
  * [mod_dirlisting] fix memory leak if pcre fails
  * [mod_fastcgi,mod_scgi] fix resource leaks on spawning
  backends
  * [mod_magnet] fix memory leak
  * add comments for switch fall throughs
  * remove logical dead code
  * [buffer] fix length check in buffer_is_equal_right_len
  * fix resource leaks in error cases on config parsing and
  other initializations
  * add force_assert() to enforce assertions as simple
  assert()s are disabled by -DNDEBUG (fixes #2546)
  * [mod_cml_lua] fix null pointer dereference
  * force assertion: setting FD_CLOEXEC must work (if
  available)
  * [network] check return value of lseek()
  * fix unchecked return values from
  stream_open/stat_cache_get_entry
  * [mod_webdav] fix logic error in handling file creation
  error
  * check length of unix domain socket filenames
  * fix SQL injection / host name validation (thx Jann Horn)
  for all the changes see
  /usr/share/doc/packages/lighttpd/NEWS";

  tag_affected = "lighttpd on openSUSE 13.1, openSUSE 12.3";

  tag_solution = "Please Install the Updated Packages.";


  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");
  script_xref(name: "openSUSE-SU", value: "2014:0449_1");
  script_tag(name:"summary", value:"Check for the Version of lighttpd");
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

if(release == "openSUSE12.3")
{

  if ((res = isrpmvuln(pkg:"lighttpd", rpm:"lighttpd~1.4.35~6.9.1", rls:"openSUSE12.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"lighttpd-debuginfo", rpm:"lighttpd-debuginfo~1.4.35~6.9.1", rls:"openSUSE12.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"lighttpd-debugsource", rpm:"lighttpd-debugsource~1.4.35~6.9.1", rls:"openSUSE12.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"lighttpd-mod_cml", rpm:"lighttpd-mod_cml~1.4.35~6.9.1", rls:"openSUSE12.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"lighttpd-mod_cml-debuginfo", rpm:"lighttpd-mod_cml-debuginfo~1.4.35~6.9.1", rls:"openSUSE12.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"lighttpd-mod_geoip", rpm:"lighttpd-mod_geoip~1.4.35~6.9.1", rls:"openSUSE12.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"lighttpd-mod_geoip-debuginfo", rpm:"lighttpd-mod_geoip-debuginfo~1.4.35~6.9.1", rls:"openSUSE12.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"lighttpd-mod_magnet", rpm:"lighttpd-mod_magnet~1.4.35~6.9.1", rls:"openSUSE12.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"lighttpd-mod_magnet-debuginfo", rpm:"lighttpd-mod_magnet-debuginfo~1.4.35~6.9.1", rls:"openSUSE12.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"lighttpd-mod_mysql_vhost", rpm:"lighttpd-mod_mysql_vhost~1.4.35~6.9.1", rls:"openSUSE12.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"lighttpd-mod_mysql_vhost-debuginfo", rpm:"lighttpd-mod_mysql_vhost-debuginfo~1.4.35~6.9.1", rls:"openSUSE12.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"lighttpd-mod_rrdtool", rpm:"lighttpd-mod_rrdtool~1.4.35~6.9.1", rls:"openSUSE12.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"lighttpd-mod_rrdtool-debuginfo", rpm:"lighttpd-mod_rrdtool-debuginfo~1.4.35~6.9.1", rls:"openSUSE12.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"lighttpd-mod_trigger_b4_dl", rpm:"lighttpd-mod_trigger_b4_dl~1.4.35~6.9.1", rls:"openSUSE12.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"lighttpd-mod_trigger_b4_dl-debuginfo", rpm:"lighttpd-mod_trigger_b4_dl-debuginfo~1.4.35~6.9.1", rls:"openSUSE12.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"lighttpd-mod_webdav", rpm:"lighttpd-mod_webdav~1.4.35~6.9.1", rls:"openSUSE12.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"lighttpd-mod_webdav-debuginfo", rpm:"lighttpd-mod_webdav-debuginfo~1.4.35~6.9.1", rls:"openSUSE12.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}


if(release == "openSUSE13.1")
{

  if ((res = isrpmvuln(pkg:"lighttpd", rpm:"lighttpd~1.4.35~2.9.1", rls:"openSUSE13.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"lighttpd-debuginfo", rpm:"lighttpd-debuginfo~1.4.35~2.9.1", rls:"openSUSE13.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"lighttpd-debugsource", rpm:"lighttpd-debugsource~1.4.35~2.9.1", rls:"openSUSE13.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"lighttpd-mod_cml", rpm:"lighttpd-mod_cml~1.4.35~2.9.1", rls:"openSUSE13.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"lighttpd-mod_cml-debuginfo", rpm:"lighttpd-mod_cml-debuginfo~1.4.35~2.9.1", rls:"openSUSE13.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"lighttpd-mod_geoip", rpm:"lighttpd-mod_geoip~1.4.35~2.9.1", rls:"openSUSE13.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"lighttpd-mod_geoip-debuginfo", rpm:"lighttpd-mod_geoip-debuginfo~1.4.35~2.9.1", rls:"openSUSE13.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"lighttpd-mod_magnet", rpm:"lighttpd-mod_magnet~1.4.35~2.9.1", rls:"openSUSE13.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"lighttpd-mod_magnet-debuginfo", rpm:"lighttpd-mod_magnet-debuginfo~1.4.35~2.9.1", rls:"openSUSE13.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"lighttpd-mod_mysql_vhost", rpm:"lighttpd-mod_mysql_vhost~1.4.35~2.9.1", rls:"openSUSE13.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"lighttpd-mod_mysql_vhost-debuginfo", rpm:"lighttpd-mod_mysql_vhost-debuginfo~1.4.35~2.9.1", rls:"openSUSE13.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"lighttpd-mod_rrdtool", rpm:"lighttpd-mod_rrdtool~1.4.35~2.9.1", rls:"openSUSE13.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"lighttpd-mod_rrdtool-debuginfo", rpm:"lighttpd-mod_rrdtool-debuginfo~1.4.35~2.9.1", rls:"openSUSE13.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"lighttpd-mod_trigger_b4_dl", rpm:"lighttpd-mod_trigger_b4_dl~1.4.35~2.9.1", rls:"openSUSE13.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"lighttpd-mod_trigger_b4_dl-debuginfo", rpm:"lighttpd-mod_trigger_b4_dl-debuginfo~1.4.35~2.9.1", rls:"openSUSE13.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"lighttpd-mod_webdav", rpm:"lighttpd-mod_webdav~1.4.35~2.9.1", rls:"openSUSE13.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"lighttpd-mod_webdav-debuginfo", rpm:"lighttpd-mod_webdav-debuginfo~1.4.35~2.9.1", rls:"openSUSE13.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}