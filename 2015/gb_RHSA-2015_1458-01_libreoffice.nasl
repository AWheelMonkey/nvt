###############################################################################
# OpenVAS Vulnerability Test
#
# RedHat Update for libreoffice RHSA-2015:1458-01
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (C) 2015 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.871412");
  script_version("$Revision: 12497 $");
  script_cve_id("CVE-2015-1774");
  script_tag(name:"cvss_base", value:"6.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
  script_tag(name:"last_modification", value:"$Date: 2018-11-23 09:28:21 +0100 (Fri, 23 Nov 2018) $");
  script_tag(name:"creation_date", value:"2015-07-23 06:26:59 +0200 (Thu, 23 Jul 2015)");
  script_tag(name:"qod_type", value:"package");
  script_name("RedHat Update for libreoffice RHSA-2015:1458-01");
  script_tag(name:"summary", value:"The remote host is missing an update for the 'libreoffice'
  package(s) announced via the referenced advisory.");
  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");
  script_tag(name:"insight", value:"LibreOffice is an open source, community-developed office productivity
suite. It includes key desktop applications, such as a word processor, a
spreadsheet, a presentation manager, a formula editor, and a drawing
program. LibreOffice replaces OpenOffice and provides a similar but
enhanced and extended office suite.

A flaw was found in the way the LibreOffice HWP (Hangul Word Processor)
file filter processed certain HWP documents. An attacker able to trick a
user into opening a specially crafted HWP document could possibly use this
flaw to execute arbitrary code with the privileges of the user opening that
document. (CVE-2015-1774)

The libreoffice packages have been upgraded to upstream version 4.2.8.2,
which provides a number of bug fixes and enhancements over the previous
version, including:

  * OpenXML interoperability has been improved.

  * This update adds additional statistics functions to the Calc application,
thus improving interoperability with Microsoft Excel and its 'Analysis
ToolPak' add-in.

  * Various performance improvements have been implemented in Calc.

  * This update adds new import filters for importing files from the Appple
Keynote and Abiword applications.

  * The export filter for the MathML markup language has been improved.

  * This update adds a new start screen that includes thumbnails of recently
opened documents.

  * A visual clue is now displayed in the Slide Sorter window for slides with
transitions or animations.

  * This update improves trend lines in charts.

  * LibreOffice now supports BCP 47 language tags.

For a complete list of bug fixes and enhancements provided by this rebase,
see the libreoffice change log linked from the References section.
(BZ#1150048)

Users of libreoffice are advised to upgrade to these updated packages,
which correct these issues and add these enhancements.");
  script_tag(name:"affected", value:"libreoffice on Red Hat Enterprise Linux Desktop (v. 6),
  Red Hat Enterprise Linux Workstation (v. 6)");
  script_tag(name:"solution", value:"Please Install the Updated Packages.");
  script_xref(name:"RHSA", value:"2015:1458-01");
  script_xref(name:"URL", value:"https://www.redhat.com/archives/rhsa-announce/2015-July/msg00035.html");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2015 Greenbone Networks GmbH");
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

  if ((res = isrpmvuln(pkg:"libreoffice-base", rpm:"libreoffice-base~4.2.8.2~11.el6", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-calc", rpm:"libreoffice-calc~4.2.8.2~11.el6", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-core", rpm:"libreoffice-core~4.2.8.2~11.el6", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-debuginfo", rpm:"libreoffice-debuginfo~4.2.8.2~11.el6", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-draw", rpm:"libreoffice-draw~4.2.8.2~11.el6", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-emailmerge", rpm:"libreoffice-emailmerge~4.2.8.2~11.el6", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-graphicfilter", rpm:"libreoffice-graphicfilter~4.2.8.2~11.el6", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-headless", rpm:"libreoffice-headless~4.2.8.2~11.el6", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-impress", rpm:"libreoffice-impress~4.2.8.2~11.el6", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-langpack-af", rpm:"libreoffice-langpack-af~4.2.8.2~11.el6", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-langpack-ar", rpm:"libreoffice-langpack-ar~4.2.8.2~11.el6", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-langpack-as", rpm:"libreoffice-langpack-as~4.2.8.2~11.el6", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-langpack-bg", rpm:"libreoffice-langpack-bg~4.2.8.2~11.el6", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-langpack-bn", rpm:"libreoffice-langpack-bn~4.2.8.2~11.el6", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-langpack-ca", rpm:"libreoffice-langpack-ca~4.2.8.2~11.el6", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-langpack-cs", rpm:"libreoffice-langpack-cs~4.2.8.2~11.el6", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-langpack-cy", rpm:"libreoffice-langpack-cy~4.2.8.2~11.el6", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-langpack-da", rpm:"libreoffice-langpack-da~4.2.8.2~11.el6", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-langpack-de", rpm:"libreoffice-langpack-de~4.2.8.2~11.el6", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-langpack-dz", rpm:"libreoffice-langpack-dz~4.2.8.2~11.el6", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-langpack-el", rpm:"libreoffice-langpack-el~4.2.8.2~11.el6", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-langpack-en", rpm:"libreoffice-langpack-en~4.2.8.2~11.el6", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-langpack-es", rpm:"libreoffice-langpack-es~4.2.8.2~11.el6", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-langpack-et", rpm:"libreoffice-langpack-et~4.2.8.2~11.el6", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-langpack-eu", rpm:"libreoffice-langpack-eu~4.2.8.2~11.el6", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-langpack-fi", rpm:"libreoffice-langpack-fi~4.2.8.2~11.el6", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-langpack-fr", rpm:"libreoffice-langpack-fr~4.2.8.2~11.el6", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-langpack-ga", rpm:"libreoffice-langpack-ga~4.2.8.2~11.el6", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-langpack-gl", rpm:"libreoffice-langpack-gl~4.2.8.2~11.el6", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-langpack-gu", rpm:"libreoffice-langpack-gu~4.2.8.2~11.el6", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-langpack-he", rpm:"libreoffice-langpack-he~4.2.8.2~11.el6", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-langpack-hi", rpm:"libreoffice-langpack-hi~4.2.8.2~11.el6", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-langpack-hr", rpm:"libreoffice-langpack-hr~4.2.8.2~11.el6", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-langpack-hu", rpm:"libreoffice-langpack-hu~4.2.8.2~11.el6", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-langpack-it", rpm:"libreoffice-langpack-it~4.2.8.2~11.el6", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-langpack-ja", rpm:"libreoffice-langpack-ja~4.2.8.2~11.el6", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-langpack-kn", rpm:"libreoffice-langpack-kn~4.2.8.2~11.el6", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-langpack-ko", rpm:"libreoffice-langpack-ko~4.2.8.2~11.el6", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-langpack-lt", rpm:"libreoffice-langpack-lt~4.2.8.2~11.el6", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-langpack-mai", rpm:"libreoffice-langpack-mai~4.2.8.2~11.el6", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-langpack-ml", rpm:"libreoffice-langpack-ml~4.2.8.2~11.el6", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-langpack-mr", rpm:"libreoffice-langpack-mr~4.2.8.2~11.el6", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-langpack-ms", rpm:"libreoffice-langpack-ms~4.2.8.2~11.el6", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-langpack-nb", rpm:"libreoffice-langpack-nb~4.2.8.2~11.el6", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-langpack-nl", rpm:"libreoffice-langpack-nl~4.2.8.2~11.el6", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-langpack-nn", rpm:"libreoffice-langpack-nn~4.2.8.2~11.el6", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-langpack-nr", rpm:"libreoffice-langpack-nr~4.2.8.2~11.el6", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-langpack-nso", rpm:"libreoffice-langpack-nso~4.2.8.2~11.el6", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-langpack-or", rpm:"libreoffice-langpack-or~4.2.8.2~11.el6", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-langpack-pa", rpm:"libreoffice-langpack-pa~4.2.8.2~11.el6", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-langpack-pl", rpm:"libreoffice-langpack-pl~4.2.8.2~11.el6", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-langpack-pt-BR", rpm:"libreoffice-langpack-pt-BR~4.2.8.2~11.el6", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-langpack-pt-PT", rpm:"libreoffice-langpack-pt-PT~4.2.8.2~11.el6", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-langpack-ro", rpm:"libreoffice-langpack-ro~4.2.8.2~11.el6", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-langpack-ru", rpm:"libreoffice-langpack-ru~4.2.8.2~11.el6", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-langpack-sk", rpm:"libreoffice-langpack-sk~4.2.8.2~11.el6", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-langpack-sl", rpm:"libreoffice-langpack-sl~4.2.8.2~11.el6", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-langpack-sr", rpm:"libreoffice-langpack-sr~4.2.8.2~11.el6", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-langpack-ss", rpm:"libreoffice-langpack-ss~4.2.8.2~11.el6", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-langpack-st", rpm:"libreoffice-langpack-st~4.2.8.2~11.el6", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-langpack-sv", rpm:"libreoffice-langpack-sv~4.2.8.2~11.el6", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-langpack-ta", rpm:"libreoffice-langpack-ta~4.2.8.2~11.el6", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-langpack-te", rpm:"libreoffice-langpack-te~4.2.8.2~11.el6", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-langpack-th", rpm:"libreoffice-langpack-th~4.2.8.2~11.el6", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-langpack-tn", rpm:"libreoffice-langpack-tn~4.2.8.2~11.el6", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-langpack-tr", rpm:"libreoffice-langpack-tr~4.2.8.2~11.el6", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-langpack-ts", rpm:"libreoffice-langpack-ts~4.2.8.2~11.el6", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-langpack-uk", rpm:"libreoffice-langpack-uk~4.2.8.2~11.el6", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-langpack-ur", rpm:"libreoffice-langpack-ur~4.2.8.2~11.el6", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-langpack-ve", rpm:"libreoffice-langpack-ve~4.2.8.2~11.el6", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-langpack-xh", rpm:"libreoffice-langpack-xh~4.2.8.2~11.el6", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-langpack-zh-Hans", rpm:"libreoffice-langpack-zh-Hans~4.2.8.2~11.el6", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-langpack-zh-Hant", rpm:"libreoffice-langpack-zh-Hant~4.2.8.2~11.el6", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-langpack-zu", rpm:"libreoffice-langpack-zu~4.2.8.2~11.el6", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-math", rpm:"libreoffice-math~4.2.8.2~11.el6", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-ogltrans", rpm:"libreoffice-ogltrans~4.2.8.2~11.el6", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-pdfimport", rpm:"libreoffice-pdfimport~4.2.8.2~11.el6", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-pyuno", rpm:"libreoffice-pyuno~4.2.8.2~11.el6", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-ure", rpm:"libreoffice-ure~4.2.8.2~11.el6", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-wiki-publisher", rpm:"libreoffice-wiki-publisher~4.2.8.2~11.el6", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-writer", rpm:"libreoffice-writer~4.2.8.2~11.el6", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-xsltfilter", rpm:"libreoffice-xsltfilter~4.2.8.2~11.el6", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"autocorr-af", rpm:"autocorr-af~4.2.8.2~11.el6", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"autocorr-bg", rpm:"autocorr-bg~4.2.8.2~11.el6", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"autocorr-ca", rpm:"autocorr-ca~4.2.8.2~11.el6", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"autocorr-cs", rpm:"autocorr-cs~4.2.8.2~11.el6", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"autocorr-da", rpm:"autocorr-da~4.2.8.2~11.el6", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"autocorr-de", rpm:"autocorr-de~4.2.8.2~11.el6", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"autocorr-en", rpm:"autocorr-en~4.2.8.2~11.el6", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"autocorr-es", rpm:"autocorr-es~4.2.8.2~11.el6", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"autocorr-fa", rpm:"autocorr-fa~4.2.8.2~11.el6", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"autocorr-fi", rpm:"autocorr-fi~4.2.8.2~11.el6", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"autocorr-fr", rpm:"autocorr-fr~4.2.8.2~11.el6", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"autocorr-ga", rpm:"autocorr-ga~4.2.8.2~11.el6", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"autocorr-hr", rpm:"autocorr-hr~4.2.8.2~11.el6", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"autocorr-hu", rpm:"autocorr-hu~4.2.8.2~11.el6", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"autocorr-it", rpm:"autocorr-it~4.2.8.2~11.el6", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"autocorr-ja", rpm:"autocorr-ja~4.2.8.2~11.el6", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"autocorr-ko", rpm:"autocorr-ko~4.2.8.2~11.el6", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"autocorr-lb", rpm:"autocorr-lb~4.2.8.2~11.el6", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"autocorr-lt", rpm:"autocorr-lt~4.2.8.2~11.el6", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"autocorr-mn", rpm:"autocorr-mn~4.2.8.2~11.el6", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"autocorr-nl", rpm:"autocorr-nl~4.2.8.2~11.el6", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"autocorr-pl", rpm:"autocorr-pl~4.2.8.2~11.el6", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"autocorr-pt", rpm:"autocorr-pt~4.2.8.2~11.el6", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"autocorr-ro", rpm:"autocorr-ro~4.2.8.2~11.el6", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"autocorr-ru", rpm:"autocorr-ru~4.2.8.2~11.el6", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"autocorr-sk", rpm:"autocorr-sk~4.2.8.2~11.el6", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"autocorr-sl", rpm:"autocorr-sl~4.2.8.2~11.el6", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"autocorr-sr", rpm:"autocorr-sr~4.2.8.2~11.el6", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"autocorr-sv", rpm:"autocorr-sv~4.2.8.2~11.el6", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"autocorr-tr", rpm:"autocorr-tr~4.2.8.2~11.el6", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"autocorr-vi", rpm:"autocorr-vi~4.2.8.2~11.el6", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"autocorr-zh", rpm:"autocorr-zh~4.2.8.2~11.el6", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-opensymbol-fonts", rpm:"libreoffice-opensymbol-fonts~4.2.8.2~11.el6", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
