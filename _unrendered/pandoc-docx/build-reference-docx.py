"""Build reference.docx: pandoc's default Word template with tighter, more
readable styles for planning documents that are full of tables.

Run from anywhere (needs pandoc on the PATH):

    python3 _unrendered/pandoc-docx/build-reference-docx.py

Edit the settings below and re-run to adjust fonts, sizes or margins.
"""

import pathlib
import re
import subprocess
import tempfile
import zipfile

FONT = "Arial"          # Google Docs maps Arial cleanly
BODY_PT = 10.5
TABLE_PT = 8.5
CODE_PT = 9
HEADING_PT = {1: 16, 2: 13, 3: 11.5, 4: 10.5}
TITLE_PT = 20
MARGIN_IN = 0.75
BORDER_COLOR = "BFBFBF"
HEADER_FILL = "EDEBF7"  # pale purple, matches the Miro board

OUT = pathlib.Path(__file__).with_name("reference.docx")


def half_points(pt):
    return str(round(pt * 2))


def set_style_size(styles, style_id, pt):
    pattern = re.compile(
        r'(<w:style [^>]*w:styleId="%s".*?</w:style>)' % style_id, re.S)

    def fix(m):
        block = m.group(1)
        block = re.sub(r'<w:sz w:val="\d+" />', '<w:sz w:val="%s" />' % half_points(pt), block)
        block = re.sub(r'<w:szCs w:val="\d+" />', '<w:szCs w:val="%s" />' % half_points(pt), block)
        if "<w:sz " not in block:
            if "<w:rPr>" in block:
                block = block.replace(
                    "<w:rPr>", '<w:rPr><w:sz w:val="%s" /><w:szCs w:val="%s" />'
                    % (half_points(pt), half_points(pt)), 1)
            else:
                block = block.replace(
                    "</w:style>", '<w:rPr><w:sz w:val="%s" /><w:szCs w:val="%s" /></w:rPr></w:style>'
                    % (half_points(pt), half_points(pt)))
        return block

    styles, n = pattern.subn(fix, styles)
    assert n == 1, style_id
    return styles


def set_style_spacing(styles, style_id, spacing_xml):
    pattern = re.compile(
        r'(<w:style [^>]*w:styleId="%s".*?</w:style>)' % style_id, re.S)

    def fix(m):
        block = re.sub(r"<w:spacing [^>]*/>", spacing_xml, m.group(1))
        if spacing_xml not in block:
            block = block.replace(
                "</w:style>", "<w:pPr>%s</w:pPr></w:style>" % spacing_xml)
        return block

    styles, n = pattern.subn(fix, styles)
    assert n == 1, style_id
    return styles


def edit_styles(styles):
    # Document defaults: one plain font, smaller body text, less space after.
    styles = re.sub(
        r"<w:rFonts [^>]*/>\s*<w:sz w:val=\"24\" />\s*<w:szCs w:val=\"24\" />",
        '<w:rFonts w:ascii="%s" w:hAnsi="%s" w:eastAsia="%s" w:cs="%s" />'
        '<w:sz w:val="%s" /><w:szCs w:val="%s" />'
        % (FONT, FONT, FONT, FONT, half_points(BODY_PT), half_points(BODY_PT)),
        styles, count=1)
    styles = styles.replace('<w:spacing w:after="200" />',
                            '<w:spacing w:after="120" w:line="264" w:lineRule="auto" />', 1)

    # Headings and title: smaller, same font as body.
    for level, pt in HEADING_PT.items():
        sid = "Heading%d" % level
        styles = set_style_size(styles, sid, pt)
        styles = re.sub(
            r'(<w:style [^>]*w:styleId="%s".*?)<w:rFonts [^>]*/>' % sid,
            r'\1<w:rFonts w:ascii="%s" w:hAnsi="%s" w:cs="%s" /><w:b />' % (FONT, FONT, FONT),
            styles, count=1, flags=re.S)
    styles = set_style_spacing(styles, "Heading1", '<w:spacing w:before="320" w:after="120" />')
    styles = set_style_spacing(styles, "Heading2", '<w:spacing w:before="240" w:after="80" />')
    styles = set_style_spacing(styles, "Heading3", '<w:spacing w:before="200" w:after="60" />')
    styles = set_style_size(styles, "Title", TITLE_PT)

    # Body paragraphs and tight lists.
    styles = set_style_spacing(styles, "BodyText", '<w:spacing w:before="60" w:after="120" />')
    styles = set_style_spacing(styles, "Compact", '<w:spacing w:before="20" w:after="20" />')
    styles = set_style_size(styles, "VerbatimChar", CODE_PT)

    # Table style: light grid, small cell padding, shaded header row.
    border = '<w:%s w:val="single" w:sz="4" w:space="0" w:color="' + BORDER_COLOR + '" />'
    borders = "<w:tblBorders>%s</w:tblBorders>" % "".join(
        border % side for side in ("top", "left", "bottom", "right", "insideH", "insideV"))
    styles = re.sub(
        r'(<w:style w:type="table" w:default="1" w:styleId="Table">.*?<w:tblPr>)\s*'
        r'<w:tblInd w:w="0" w:type="dxa" />\s*<w:tblCellMar>.*?</w:tblCellMar>',
        r'\1<w:tblInd w:w="0" w:type="dxa" />' + borders +
        '<w:tblCellMar><w:top w:w="40" w:type="dxa" /><w:left w:w="80" w:type="dxa" />'
        '<w:bottom w:w="40" w:type="dxa" /><w:right w:w="80" w:type="dxa" /></w:tblCellMar>',
        styles, count=1, flags=re.S)
    styles = re.sub(
        r'(<w:tblStylePr w:type="firstRow">.*?<w:tcPr>)\s*<w:tcBorders>.*?</w:tcBorders>',
        r'\1<w:shd w:val="clear" w:color="auto" w:fill="%s" />' % HEADER_FILL,
        styles, count=1, flags=re.S)

    # Paragraph styles used inside tables by docx-tables.lua.
    table_text = (
        '<w:style w:type="paragraph" w:customStyle="1" w:styleId="TableText">'
        '<w:name w:val="Table Text" /><w:basedOn w:val="Normal" /><w:qFormat />'
        '<w:pPr><w:spacing w:before="0" w:after="40" w:line="240" w:lineRule="auto" /></w:pPr>'
        '<w:rPr><w:sz w:val="%s" /><w:szCs w:val="%s" /></w:rPr></w:style>'
        '<w:style w:type="paragraph" w:customStyle="1" w:styleId="TableHeading">'
        '<w:name w:val="Table Heading" /><w:basedOn w:val="TableText" /><w:qFormat />'
        '<w:rPr><w:b /><w:bCs /></w:rPr></w:style>'
        % (half_points(TABLE_PT), half_points(TABLE_PT)))
    styles = styles.replace("</w:styles>", table_text + "</w:styles>")
    return styles


def edit_document(document):
    # Pandoc copies the reference document's final section properties (page
    # size and margins) into the output. The default template has none, so add
    # a US Letter page with narrower margins to give tables more room.
    margin = str(round(MARGIN_IN * 1440))
    sect = ('<w:sectPr><w:pgSz w:w="12240" w:h="15840" />'
            '<w:pgMar w:top="%s" w:right="%s" w:bottom="%s" w:left="%s" '
            'w:header="720" w:footer="720" w:gutter="0" /></w:sectPr>'
            % (margin, margin, margin, margin))
    document = re.sub(r"<w:sectPr>.*?</w:sectPr>", "", document, flags=re.S)
    return document.replace("</w:body>", sect + "</w:body>", 1)


def main():
    with tempfile.TemporaryDirectory() as tmp:
        default = pathlib.Path(tmp, "default.docx")
        subprocess.run(["pandoc", "-o", str(default),
                        "--print-default-data-file", "reference.docx"], check=True)
        with zipfile.ZipFile(default) as zin, zipfile.ZipFile(OUT, "w", zipfile.ZIP_DEFLATED) as zout:
            for item in zin.infolist():
                data = zin.read(item.filename)
                if item.filename == "word/styles.xml":
                    data = edit_styles(data.decode("utf-8")).encode("utf-8")
                elif item.filename == "word/document.xml":
                    data = edit_document(data.decode("utf-8")).encode("utf-8")
                zout.writestr(item, data)
    print("wrote", OUT)


if __name__ == "__main__":
    main()
