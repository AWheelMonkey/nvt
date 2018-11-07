###############################################################################
# OpenVAS Vulnerability Test
#
# Mandriva Update for python-django MDVSA-2012:143 (python-django)
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

if(description)
{
  script_xref(name:"URL", value:"http://www.mandriva.com/en/support/security/advisories/?name=MDVSA-2012:143");
  script_oid("1.3.6.1.4.1.25623.1.0.831728");
  script_version("$Revision: 11985 $");
  script_tag(name:"last_modification", value:"$Date: 2018-10-19 12:24:37 +0200 (Fri, 19 Oct 2018) $");
  script_tag(name:"creation_date", value:"2012-08-24 09:57:26 +0530 (Fri, 24 Aug 2012)");
  script_cve_id("CVE-2012-3442", "CVE-2012-3443", "CVE-2012-3444");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:P");
  script_xref(name:"MDVSA", value:"2012:143");
  script_name("Mandriva Update for python-django MDVSA-2012:143 (python-django)");

  script_tag(name:"summary", value:"Check for the Version of python-django");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2012 Greenbone Networks GmbH");
  script_family("Mandrake Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/mandriva_mandrake_linux", "ssh/login/release", re:"ssh/login/release=MNDK_(2011\.0|mes5\.2)");
  script_tag(name:"affected", value:"python-django on Mandriva Linux 2011.0,
  Mandriva Enterprise Server 5.2");
  script_tag(name:"solution", value:"Please Install the Updated Packages.");
  script_tag(name:"insight", value:"Multiple vulnerabilities has been discovered and corrected in
  python-django:

  The (1) django.http.HttpResponseRedirect and (2)
  django.http.HttpResponsePermanentRedirect classes in Django before
  1.3.2 and 1.4.x before 1.4.1 do not validate the scheme of a redirect
  target, which might allow remote attackers to conduct cross-site
  scripting (XSS) attacks via a data: URL (CVE-2012-3442).

  The django.forms.ImageField class in the form system in Django
  before 1.3.2 and 1.4.x before 1.4.1 completely decompresses image
  data during image validation, which allows remote attackers to cause
  a denial of service (memory consumption) by uploading an image file
  (CVE-2012-3443).

  The get_image_dimensions function in the image-handling functionality
  in Django before 1.3.2 and 1.4.x before 1.4.1 uses a constant chunk
  size in all attempts to determine dimensions, which allows remote
  attackers to cause a denial of service (process or thread consumption)
  via a large TIFF image (CVE-2012-3444).

  The updated packages have been upgraded to the 1.3.3 version which
  is not vulnerable to these issues.");
  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-rpm.inc");

release = rpm_get_ssh_release();
if(!release) exit(0);

res = "";

if(release == "MNDK_2011.0")
{

  if ((res = isrpmvuln(pkg:"python-django", rpm:"python-django~1.3.3~0.1", rls:"MNDK_2011.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}


if(release == "MNDK_mes5.2")
{

  if ((res = isrpmvuln(pkg:"python-django", rpm:"python-django~1.3.3~0.1mdvmes5.2", rls:"MNDK_mes5.2")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
