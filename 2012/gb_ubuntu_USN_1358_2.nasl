###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ubuntu_USN_1358_2.nasl 11037 2018-08-17 11:51:16Z cfischer $
#
# Ubuntu Update for php5 USN-1358-2
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



if(description)
{
  script_xref(name:"URL", value:"http://www.ubuntu.com/usn/usn-1358-2/");
  script_oid("1.3.6.1.4.1.25623.1.0.840895");
  script_version("$Revision: 11037 $");
  script_tag(name:"last_modification", value:"$Date: 2018-08-17 13:51:16 +0200 (Fri, 17 Aug 2018) $");
  script_tag(name:"creation_date", value:"2012-02-21 18:59:05 +0530 (Tue, 21 Feb 2012)");
  script_cve_id("CVE-2012-0831", "CVE-2011-4885", "CVE-2012-0830", "CVE-2011-4153",
                "CVE-2012-0057", "CVE-2012-0788", "CVE-2011-0441");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_xref(name:"USN", value:"1358-2");
  script_name("Ubuntu Update for php5 USN-1358-2");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2012 Greenbone Networks GmbH");
  script_family("Ubuntu Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/ubuntu_linux", "ssh/login/packages", re:"ssh/login/release=UBUNTU(10\.10|10\.04 LTS|11\.04|8\.04 LTS)");
  script_tag(name:"summary", value:"Ubuntu Update for Linux kernel vulnerabilities USN-1358-2");
  script_tag(name:"affected", value:"php5 on Ubuntu 11.04,
  Ubuntu 10.10,
  Ubuntu 10.04 LTS,
  Ubuntu 8.04 LTS");
  script_tag(name:"solution", value:"Please Install the Updated Packages.");
  script_tag(name:"insight", value:"USN 1358-1 fixed multiple vulnerabilities in PHP. The fix for
  CVE-2012-0831 introduced a regression where the state of the
  magic_quotes_gpc setting was not correctly reflected when calling
  the ini_get() function.

  We apologize for the inconvenience.

  Original advisory details:

  It was discovered that PHP computed hash values for form parameters
  without restricting the ability to trigger hash collisions predictably.
  This could allow a remote attacker to cause a denial of service by
  sending many crafted parameters. (CVE-2011-4885)

  ATTENTION: this update changes previous PHP behavior by
  limiting the number of external input variables to 1000.
  This may be increased by adding a &quot;max_input_vars&quot;
  directive to the php.ini configuration file. See
  http://www.php.net/manual/en/info.configuration.php#ini.max-input-vars
  for more information.

  Stefan Esser discovered that the fix to address the predictable hash
  collision issue, CVE-2011-4885, did not properly handle the situation
  where the limit was reached. This could allow a remote attacker to
  cause a denial of service or execute arbitrary code via a request
  containing a large number of variables. (CVE-2012-0830)

  It was discovered that PHP did not always check the return value of
  the zend_strndup function. This could allow a remote attacker to
  cause a denial of service. (CVE-2011-4153)

  It was discovered that PHP did not properly enforce libxslt security
  settings. This could allow a remote attacker to create arbitrary
  files via a crafted XSLT stylesheet that uses the libxslt output
  extension. (CVE-2012-0057)

  It was discovered that PHP did not properly enforce that PDORow
  objects could not be serialized and not be saved in a session. A
  remote attacker could use this to cause a denial of service via an
  application crash. (CVE-2012-0788)

  It was discovered that PHP allowed the magic_quotes_gpc setting to
  be disabled remotely. This could allow a remote attacker to bypass
  restrictions that could prevent an SQL injection. (CVE-2012-0831)

  USN 1126-1 addressed an issue where the /etc/cron.d/php5 cron job
  for PHP allowed local users to delete arbitrary files via a symlink
  attack on a directory under /var/lib/php5/. Emese Revfy discovered
  that the fix had not been applied to PHP for Ubuntu 10.04 LTS. This
  update corrects the issue. We apologize for the error. (CVE-2011-0441)");
  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");
  exit(0);
}


include("pkg-lib-deb.inc");

release = dpkg_get_ssh_release();

res = "";
if(release == NULL){
  exit(0);
}

if(release == "UBUNTU10.10")
{

  if ((res = isdpkgvuln(pkg:"libapache2-mod-php5", ver:"5.3.3-1ubuntu9.10", rls:"UBUNTU10.10")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"php5", ver:"5.3.3-1ubuntu9.10", rls:"UBUNTU10.10")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"php5-cgi", ver:"5.3.3-1ubuntu9.10", rls:"UBUNTU10.10")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"php5-cli", ver:"5.3.3-1ubuntu9.10", rls:"UBUNTU10.10")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}


if(release == "UBUNTU10.04 LTS")
{

  if ((res = isdpkgvuln(pkg:"libapache2-mod-php5", ver:"5.3.2-1ubuntu4.14", rls:"UBUNTU10.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"php5", ver:"5.3.2-1ubuntu4.14", rls:"UBUNTU10.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"php5-cgi", ver:"5.3.2-1ubuntu4.14", rls:"UBUNTU10.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"php5-cli", ver:"5.3.2-1ubuntu4.14", rls:"UBUNTU10.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}


if(release == "UBUNTU11.04")
{

  if ((res = isdpkgvuln(pkg:"libapache2-mod-php5", ver:"5.3.5-1ubuntu7.7", rls:"UBUNTU11.04")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"php5", ver:"5.3.5-1ubuntu7.7", rls:"UBUNTU11.04")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"php5-cgi", ver:"5.3.5-1ubuntu7.7", rls:"UBUNTU11.04")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"php5-cli", ver:"5.3.5-1ubuntu7.7", rls:"UBUNTU11.04")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}


if(release == "UBUNTU8.04 LTS")
{

  if ((res = isdpkgvuln(pkg:"libapache2-mod-php5", ver:"5.2.4-2ubuntu5.23", rls:"UBUNTU8.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"php5", ver:"5.2.4-2ubuntu5.23", rls:"UBUNTU8.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"php5-cgi", ver:"5.2.4-2ubuntu5.23", rls:"UBUNTU8.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"php5-cli", ver:"5.2.4-2ubuntu5.23", rls:"UBUNTU8.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
