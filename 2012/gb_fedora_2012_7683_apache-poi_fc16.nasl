###############################################################################
# OpenVAS Vulnerability Test
#
# Fedora Update for apache-poi FEDORA-2012-7683
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
tag_insight = "The Apache POI Project's mission is to create and maintain Java APIs for
  manipulating various file formats based upon the Office Open XML standards
  (OOXML) and Microsoft's OLE 2 Compound Document format (OLE2). In short, you
  can read and write MS Excel files using Java. In addition, you can read and
  write MS Word and MS PowerPoint files using Java. Apache POI is your Java
  Excel solution (for Excel 97-2008). We have a complete API for porting other
  OOXML and OLE2 formats and welcome others to participate.

  OLE2 files include most Microsoft Office files such as XLS, DOC, and PPT as
  well as MFC serialization API based file formats. The project provides APIs
  for the OLE2 Filesystem (POIFS) and OLE2 Document Properties (HPSF).

  Office OpenXML Format is the new standards based XML file format found in
  Microsoft Office 2007 and 2008. This includes XLSX, DOCX and PPTX. The
  project provides a low level API to support the Open Packaging Conventions
  using openxml4j.

  For each MS Office application there exists a component module that attempts
  to provide a common high level Java API to both OLE2 and OOXML document
  formats. This is most developed for Excel workbooks (SS=HSSF+XSSF). Work is
  progressing for Word documents (HWPF+XWPF) and PowerPoint presentations
  (HSLF+XSLF).

  The project has recently added support for Outlook (HSMF). Microsoft opened
  the specifications to this format in October 2007. We would welcome
  contributions.

  There are also projects for Visio (HDGF) and Publisher (HPBF).";

tag_affected = "apache-poi on Fedora 16";
tag_solution = "Please Install the Updated Packages.";



if(description)
{
  script_xref(name : "URL" , value : "http://lists.fedoraproject.org/pipermail/package-announce/2012-May/080633.html");
  script_oid("1.3.6.1.4.1.25623.1.0.864250");
  script_version("$Revision: 9352 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-06 09:13:02 +0200 (Fri, 06 Apr 2018) $");
  script_tag(name:"creation_date", value:"2012-05-22 10:09:54 +0530 (Tue, 22 May 2012)");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:P");
  script_cve_id("CVE-2012-0213");
  script_xref(name: "FEDORA", value: "2012-7683");
  script_name("Fedora Update for apache-poi FEDORA-2012-7683");

  script_tag(name: "summary" , value: "Check for the Version of apache-poi");
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

if(release == "FC16")
{

  if ((res = isrpmvuln(pkg:"apache-poi", rpm:"apache-poi~3.8~1.fc16", rls:"FC16")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
